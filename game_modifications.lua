--- STEAMODDED HEADER
--- MOD_NAME: Game Modifications
--- MOD_ID: ExpandInHandAbilities
--- MOD_AUTHOR: [JamesTheJellyfish]
--- MOD_DESCRIPTION: overrides various functions such as evaluate_play to add functionality
----------------------------------------------
------------MOD CODE -------------------------
  
supported_languages = {["ru"] = true}
G.LANGUAGES['ru'].beta = nil

G.FUNCS.evaluate_play = function(e)
    local text,disp_text,poker_hands,scoring_hand,non_loc_disp_text = G.FUNCS.get_poker_hand_info(G.play.cards)
    
    G.GAME.hands[text].played = G.GAME.hands[text].played + 1
    G.GAME.hands[text].played_this_round = G.GAME.hands[text].played_this_round + 1
    G.GAME.last_hand_played = text
    set_hand_usage(text)
    G.GAME.hands[text].visible = true

    --Add all the pure bonus cards to the scoring hand
    local pures = {}
    for i=1, #G.play.cards do
        if next(find_joker('Splash')) then
            scoring_hand[i] = G.play.cards[i]
        else
            if G.play.cards[i].ability.effect == 'Stone Card' or G.play.cards[i].ability.effect == 'Coal Card' then
                local inside = false
                for j=1, #scoring_hand do
                    if scoring_hand[j] == G.play.cards[i] then
                        inside = true
                    end
                end
                if not inside then table.insert(pures, G.play.cards[i]) end
            end
        end
    end
    for i=1, #pures do
        table.insert(scoring_hand, pures[i])
    end
    table.sort(scoring_hand, function (a, b) return a.T.x < b.T.x end )
    delay(0.2)
    for i=1, #scoring_hand do
        --Highlight all the cards used in scoring and play a sound indicating highlight
        highlight_card(scoring_hand[i],(i-0.999)/5,'up')
    end

    local percent = 0.3
    local percent_delta = 0.08

    if G.GAME.current_round.current_hand.handname ~= disp_text then delay(0.3) end
    update_hand_text({sound = G.GAME.current_round.current_hand.handname ~= disp_text and 'button' or nil, volume = 0.4, immediate = true, nopulse = nil,
                delay = G.GAME.current_round.current_hand.handname ~= disp_text and 0.4 or 0}, {handname=disp_text, level=G.GAME.hands[text].level, mult = G.GAME.hands[text].mult, chips = G.GAME.hands[text].chips})

    if not G.GAME.blind:debuff_hand(G.play.cards, poker_hands, text) then
        mult = mod_mult(G.GAME.hands[text].mult)
        hand_chips = mod_chips(G.GAME.hands[text].chips)

        check_for_unlock({type = 'hand', handname = text, disp_text = non_loc_disp_text, scoring_hand = scoring_hand, full_hand = G.play.cards})

        delay(0.4)

        if G.GAME.first_used_hand_level and G.GAME.first_used_hand_level > 0 then
            level_up_hand(G.deck.cards[1], text, nil, G.GAME.first_used_hand_level)
            G.GAME.first_used_hand_level = nil
        end

        local hand_text_set = false
        for i=1, #G.jokers.cards do
            --calculate the joker effects
            local effects = eval_card(G.jokers.cards[i], {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, before = true})
            if effects.jokers then
                card_eval_status_text(G.jokers.cards[i], 'jokers', nil, percent, nil, effects.jokers)
                percent = percent + percent_delta
                if effects.jokers.level_up then
                    level_up_hand(G.jokers.cards[i], text)
                end
            end
        end

        mult = mod_mult(G.GAME.hands[text].mult)
        hand_chips = mod_chips(G.GAME.hands[text].chips)

        local modded = false

        mult, hand_chips, modded = G.GAME.blind:modify_hand(G.play.cards, poker_hands, text, mult, hand_chips)
        mult, hand_chips = mod_mult(mult), mod_chips(hand_chips)
        if modded then update_hand_text({sound = 'chips2', modded = modded}, {chips = hand_chips, mult = mult}) end
        for i=1, #scoring_hand do
            --add cards played to list
            if scoring_hand[i].ability.effect ~= 'Stone Card' or scoring_hand[i].ability.effect ~= 'Coal Card' then 
                G.GAME.cards_played[scoring_hand[i].base.value].total = G.GAME.cards_played[scoring_hand[i].base.value].total + 1
                G.GAME.cards_played[scoring_hand[i].base.value].suits[scoring_hand[i].base.suit] = true 
            end
            --if card is debuffed
            if scoring_hand[i].debuff then
                G.GAME.blind.triggered = true
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = (function() G.HUD_blind:get_UIE_by_ID('HUD_blind_debuff_1'):juice_up(0.3, 0)
                        G.HUD_blind:get_UIE_by_ID('HUD_blind_debuff_2'):juice_up(0.3, 0)
                        G.GAME.blind:juice_up();return true end)
                }))
                card_eval_status_text(scoring_hand[i], 'debuff')
            else
                --Check for play doubling
                local reps = {1}
                
                --From Red seal
                local eval = eval_card(scoring_hand[i], {repetition_only = true,cardarea = G.play, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, repetition = true})
                if next(eval) then 
                    for h = 1, eval.seals.repetitions do
                        reps[#reps+1] = eval
                    end
                end
                --From jokers
                for j=1, #G.jokers.cards do
                    --calculate the joker effects
                    local eval = eval_card(G.jokers.cards[j], {cardarea = G.play, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, other_card = scoring_hand[i], repetition = true})
                    if next(eval) and eval.jokers then 
                        for h = 1, eval.jokers.repetitions do
                            reps[#reps+1] = eval
                        end
                    end
                end
                for j=1,#reps do
                    percent = percent + percent_delta
                    if reps[j] ~= 1 then
                        card_eval_status_text((reps[j].jokers or reps[j].seals).card, 'jokers', nil, nil, nil, (reps[j].jokers or reps[j].seals))
                    end
                    
                    --calculate the hand effects
                    local effects = {eval_card(scoring_hand[i], {cardarea = G.play, full_hand = G.play.cards, scoring_hand = scoring_hand, poker_hand = text})}
                    for k=1, #G.jokers.cards do
                        --calculate the joker individual card effects
                        local eval = G.jokers.cards[k]:calculate_joker({cardarea = G.play, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, other_card = scoring_hand[i], individual = true})
                        if eval then 
                            table.insert(effects, eval)
                        end
                    end
                    scoring_hand[i].lucky_trigger = nil

                    for ii = 1, #effects do
                        --If chips added, do chip add event and add the chips to the total
                        if effects[ii].coal and effects[ii].card then
                            local card = effects[ii].card
                            card.ability.extra.current = card.ability.extra.current + 1
                            card:update(0)
                            sendDebugMessage(card.ability.extra.current)
                        end
                        if effects[ii].chips then 
                            if effects[ii].card then juice_card(effects[ii].card) end
                            hand_chips = mod_chips(hand_chips + effects[ii].chips)
                            update_hand_text({delay = 0}, {chips = hand_chips})
                            card_eval_status_text(scoring_hand[i], 'chips', effects[ii].chips, percent)
                        end

                        --If mult added, do mult add event and add the mult to the total
                        if effects[ii].mult then 
                            if effects[ii].card then juice_card(effects[ii].card) end
                            mult = mod_mult(math.max(0, mult + effects[ii].mult))
                            update_hand_text({delay = 0}, {mult = mult})
                            card_eval_status_text(scoring_hand[i], 'mult', effects[ii].mult, percent)
                        end

                        if effects[ii].wooden then
                            card_eval_status_text(scoring_hand[i], 'debuff')
                        end

                        --If play dollars added, add dollars to total
                        if effects[ii].p_dollars then 
                            if effects[ii].card then juice_card(effects[ii].card) end
                            ease_dollars(effects[ii].p_dollars)
                            card_eval_status_text(scoring_hand[i], 'dollars', effects[ii].p_dollars, percent)
                        end

                        --If dollars added, add dollars to total
                        if effects[ii].dollars then 
                            if effects[ii].card then juice_card(effects[ii].card) end
                            ease_dollars(effects[ii].dollars)
                            card_eval_status_text(scoring_hand[i], 'dollars', effects[ii].dollars, percent)
                        end

                        --Any extra effects
                        if effects[ii].extra then 
                            if effects[ii].card then juice_card(effects[ii].card) end
                            local extras = {mult = false, hand_chips = false}
                            if effects[ii].extra.mult_mod then mult =mod_mult( mult + effects[ii].extra.mult_mod);extras.mult = true end
                            if effects[ii].extra.chip_mod then hand_chips = mod_chips(hand_chips + effects[ii].extra.chip_mod);extras.hand_chips = true end
                            if effects[ii].extra.swap then 
                                local old_mult = mult
                                mult = mod_mult(hand_chips)
                                hand_chips = mod_chips(old_mult)
                                extras.hand_chips = true; extras.mult = true
                            end
                            update_hand_text({delay = 0}, {chips = extras.hand_chips and hand_chips, mult = extras.mult and mult})
                            card_eval_status_text(scoring_hand[i], 'extra', nil, percent, nil, effects[ii].extra)
                        end

                        --If x_mult added, do mult add event and mult the mult to the total
                        if effects[ii].x_mult then 
                            if effects[ii].card then juice_card(effects[ii].card) end
                            mult = mod_mult(mult*effects[ii].x_mult)
                            update_hand_text({delay = 0}, {mult = mult})
                            card_eval_status_text(scoring_hand[i], 'x_mult', effects[ii].x_mult, percent)
                        end

                        --calculate the card edition effects
                        if effects[ii].edition then
                            hand_chips = mod_chips(hand_chips + (effects[ii].edition.chip_mod or 0))
                            mult = mult + (effects[ii].edition.mult_mod or 0)
                            mult = mod_mult(mult*(effects[ii].edition.x_mult_mod or 1))
                            update_hand_text({delay = 0}, {
                                chips = effects[ii].edition.chip_mod and hand_chips or nil,
                                mult = (effects[ii].edition.mult_mod or effects[ii].edition.x_mult_mod) and mult or nil,
                            })
                            card_eval_status_text(scoring_hand[i], 'extra', nil, percent, nil, {
                                message = (effects[ii].edition.chip_mod and localize{type='variable',key='a_chips',vars={effects[ii].edition.chip_mod}}) or
                                        (effects[ii].edition.mult_mod and localize{type='variable',key='a_mult',vars={effects[ii].edition.mult_mod}}) or
                                        (effects[ii].edition.x_mult_mod and localize{type='variable',key='a_xmult',vars={effects[ii].edition.x_mult_mod}}),
                                chip_mod =  effects[ii].edition.chip_mod,
                                mult_mod =  effects[ii].edition.mult_mod,
                                x_mult_mod =  effects[ii].edition.x_mult_mod,
                                colour = G.C.DARK_EDITION,
                                edition = true})
                        end
                    end
                end
            end
        end

        delay(0.3)
        local mod_percent = false
            for i=1, #G.hand.cards do
                if mod_percent then percent = percent + percent_delta end
                mod_percent = false

                --Check for hand doubling
                local reps = {1}
                local j = 1
                while j <= #reps do
                    if reps[j] ~= 1 then
                        card_eval_status_text((reps[j].jokers or reps[j].seals).card, 'jokers', nil, nil, nil, (reps[j].jokers or reps[j].seals))
                        percent = percent + percent_delta
                    end

                    --calculate the hand effects
                    local effects = {eval_card(G.hand.cards[i], {cardarea = G.hand, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands})}

                    for k=1, #G.jokers.cards do
                        --calculate the joker individual card effects
                        local eval = G.jokers.cards[k]:calculate_joker({cardarea = G.hand, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, other_card = G.hand.cards[i], individual = true})
                        if eval then 
                            mod_percent = true
                            table.insert(effects, eval)
                        end
                    end

                    if reps[j] == 1 then 
                        --Check for hand doubling

                        --From Red seal
                        local eval = eval_card(G.hand.cards[i], {repetition_only = true,cardarea = G.hand, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, repetition = true, card_effects = effects})
                        if next(eval) and (next(effects[1]) or #effects > 1) then 
                            for h  = 1, eval.seals.repetitions do
                                reps[#reps+1] = eval
                            end
                        end

                        --From Joker
                        for j=1, #G.jokers.cards do
                            --calculate the joker effects
                            local eval = eval_card(G.jokers.cards[j], {cardarea = G.hand, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, other_card = G.hand.cards[i], repetition = true, card_effects = effects})
                            if next(eval) then 
                                for h  = 1, eval.jokers.repetitions do
                                    reps[#reps+1] = eval
                                end
                            end
                        end
                    end
    
                    for ii = 1, #effects do
                        --if this effect came from a joker
                        if effects[ii].card then
                            mod_percent = true
                            G.E_MANAGER:add_event(Event({
                                trigger = 'immediate',
                                func = (function() effects[ii].card:juice_up(0.7);return true end)
                            }))
                        end
                        
                        --If hold mult added, do hold mult add event and add the mult to the total
                        
                        --If dollars added, add dollars to total
                        if effects[ii].dollars then 
                            ease_dollars(effects[ii].dollars)
                            card_eval_status_text(G.hand.cards[i], 'dollars', effects[ii].dollars, percent)
                        end

                        if effects[ii].h_mult then
                            mod_percent = true
                            mult = mod_mult(mult + effects[ii].h_mult)
                            update_hand_text({delay = 0}, {mult = mult})
                            card_eval_status_text(G.hand.cards[i], 'h_mult', effects[ii].h_mult, percent)
                        end

                        if effects[ii].h_bonus then
                            mod_percent = true
                            hand_chips = mod_chips(hand_chips + effects[ii].h_bonus)
                            update_hand_text({delay = 0}, {chips = hand_chips})
                            card_eval_status_text(G.hand.cards[i], 'chips', effects[ii].h_bonus, percent)
                        end

                        if effects[ii].x_chips then
                            mod_percent = true
                            sendDebugMessage("x_chips play")
                            hand_chips = mod_chips(hand_chips * effects[ii].x_chips)
                            update_hand_text({delay = 0}, {chips = hand_chips})
                            card_eval_status_text(G.hand.cards[i], 'x_chips', effects[ii].x_chips, percent)
                        end

                        if effects[ii].x_mult then
                            mod_percent = true
                            mult = mod_mult(mult*effects[ii].x_mult)
                            update_hand_text({delay = 0}, {mult = mult})
                            card_eval_status_text(G.hand.cards[i], 'x_mult', effects[ii].x_mult, percent)
                        end

                        if effects[ii].message then
                            mod_percent = true
                            update_hand_text({delay = 0}, {mult = mult})
                            card_eval_status_text(G.hand.cards[i], 'extra', nil, percent, nil, effects[ii])
                        end
                    end
                    j = j +1
                end
            end
        --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
        --Joker Effects
        --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
        percent = percent + percent_delta
        for i=1, #G.jokers.cards + #G.consumeables.cards do
            local _card = G.jokers.cards[i] or G.consumeables.cards[i - #G.jokers.cards]
            --calculate the joker edition effects
            local edition_effects = eval_card(_card, {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, edition = true})
            if edition_effects.jokers then
                edition_effects.jokers.edition = true
                if edition_effects.jokers.chip_mod then
                    hand_chips = mod_chips(hand_chips + edition_effects.jokers.chip_mod)
                    update_hand_text({delay = 0}, {chips = hand_chips})
                    card_eval_status_text(_card, 'jokers', nil, percent, nil, {
                        message = localize{type='variable',key='a_chips',vars={edition_effects.jokers.chip_mod}},
                        chip_mod =  edition_effects.jokers.chip_mod,
                        colour =  G.C.EDITION,
                        edition = true})
                end
                if edition_effects.jokers.mult_mod then
                    mult = mod_mult(mult + edition_effects.jokers.mult_mod)
                    update_hand_text({delay = 0}, {mult = mult})
                    card_eval_status_text(_card, 'jokers', nil, percent, nil, {
                        message = localize{type='variable',key='a_mult',vars={edition_effects.jokers.mult_mod}},
                        mult_mod =  edition_effects.jokers.mult_mod,
                        colour = G.C.DARK_EDITION,
                        edition = true})
                end
                percent = percent+percent_delta
            end

            --calculate the joker effects
            local effects = eval_card(_card, {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, joker_main = true})

            --Any Joker effects
            if effects.jokers then 
                local extras = {mult = false, hand_chips = false}
                if effects.jokers.mult_mod then mult = mod_mult(mult + effects.jokers.mult_mod);extras.mult = true end
                if effects.jokers.chip_mod then hand_chips = mod_chips(hand_chips + effects.jokers.chip_mod);extras.hand_chips = true end
                if effects.jokers.Xmult_mod then mult = mod_mult(mult*effects.jokers.Xmult_mod);extras.mult = true  end
                update_hand_text({delay = 0}, {chips = extras.hand_chips and hand_chips, mult = extras.mult and mult})
                card_eval_status_text(_card, 'jokers', nil, percent, nil, effects.jokers)
                percent = percent+percent_delta
            end

            --Joker on Joker effects
            for _, v in ipairs(G.jokers.cards) do
                local effect = v:calculate_joker{full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, other_joker = _card}
                if effect then
                    local extras = {mult = false, hand_chips = false}
                    if effect.mult_mod then mult = mod_mult(mult + effect.mult_mod);extras.mult = true end
                    if effect.chip_mod then hand_chips = mod_chips(hand_chips + effect.chip_mod);extras.hand_chips = true end
                    if effect.Xmult_mod then mult = mod_mult(mult*effect.Xmult_mod);extras.mult = true  end
                    if extras.mult or extras.hand_chips then update_hand_text({delay = 0}, {chips = extras.hand_chips and hand_chips, mult = extras.mult and mult}) end
                    if extras.mult or extras.hand_chips then card_eval_status_text(v, 'jokers', nil, percent, nil, effect) end
                    percent = percent+percent_delta
                end
            end

            if edition_effects.jokers then
                if edition_effects.jokers.x_mult_mod then
                    mult = mod_mult(mult*edition_effects.jokers.x_mult_mod)
                    update_hand_text({delay = 0}, {mult = mult})
                    card_eval_status_text(_card, 'jokers', nil, percent, nil, {
                        message = localize{type='variable',key='a_xmult',vars={edition_effects.jokers.x_mult_mod}},
                        x_mult_mod =  edition_effects.jokers.x_mult_mod,
                        colour =  G.C.EDITION,
                        edition = true})
                end
                percent = percent+percent_delta
            end
        end

        local nu_chip, nu_mult = G.GAME.selected_back:trigger_effect{context = 'final_scoring_step', chips = hand_chips, mult = mult}
        mult = mod_mult(nu_mult or mult)
        hand_chips = mod_chips(nu_chip or hand_chips)

        local cards_destroyed = {}
        for i=1, #scoring_hand do
            local destroyed = nil
            --un-highlight all cards
            highlight_card(scoring_hand[i],(i-0.999)/(#scoring_hand-0.998),'down')

            for j = 1, #G.jokers.cards do
                destroyed = G.jokers.cards[j]:calculate_joker({destroying_card = scoring_hand[i], full_hand = G.play.cards})
                if destroyed then break end
            end

            if scoring_hand[i].ability.name == 'Glass Card' and not scoring_hand[i].debuff and pseudorandom('glass') < G.GAME.probabilities.normal/scoring_hand[i].ability.extra then 
                destroyed = true
            end

            if destroyed then 
                if scoring_hand[i].ability.name == 'Glass Card' then 
                    scoring_hand[i].shattered = true
                else 
                    scoring_hand[i].destroyed = true
                end 
                cards_destroyed[#cards_destroyed+1] = scoring_hand[i]
            end
        end
        for j=1, #G.jokers.cards do
            eval_card(G.jokers.cards[j], {cardarea = G.jokers, remove_playing_cards = true, removed = cards_destroyed})
        end

        local glass_shattered = {}
        for k, v in ipairs(cards_destroyed) do
            if v.shattered then glass_shattered[#glass_shattered+1] = v end
        end

        check_for_unlock{type = 'shatter', shattered = glass_shattered}
        
        for i=1, #cards_destroyed do
            G.E_MANAGER:add_event(Event({
                func = function()
                    if cards_destroyed[i].ability.name == 'Glass Card' then 
                        cards_destroyed[i]:shatter()
                    else
                        cards_destroyed[i]:start_dissolve()
                    end
                  return true
                end
              }))
        end
    else
        mult = mod_mult(0)
        hand_chips = mod_chips(0)
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = (function()
                G.HUD_blind:get_UIE_by_ID('HUD_blind_debuff_1'):juice_up(0.3, 0)
                G.HUD_blind:get_UIE_by_ID('HUD_blind_debuff_2'):juice_up(0.3, 0)
                G.GAME.blind:juice_up()
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                    play_sound('tarot2', 0.76, 0.4);return true end}))
                play_sound('tarot2', 1, 0.4)
                return true
            end)
        }))
        play_area_status_text('Not Allowed!', true)
        --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
        --Joker Debuff Effects
        --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
        for i=1, #G.jokers.cards do
            
            --calculate the joker effects
            local effects = eval_card(G.jokers.cards[i], {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, debuffed_hand = true})

            --Any Joker effects
            if effects.jokers then
                card_eval_status_text(G.jokers.cards[i], 'jokers', nil, percent, nil, effects.jokers)
                percent = percent+percent_delta
            end
        end
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'after',delay = 0.4,
        func = (function()  update_hand_text({delay = 0, immediate = true}, {mult = 0, chips = 0, chip_total = math.floor(hand_chips*mult), level = '', handname = ''});play_sound('button', 0.9, 0.6);return true end)
      }))
      check_and_set_high_score('hand', hand_chips*mult)

      check_for_unlock({type = 'chip_score', chips = math.floor(hand_chips*mult)})
   
    if hand_chips*mult > 0 then 
        delay(0.8)
        G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function() play_sound('chips2');return true end)
        }))
    end
    G.E_MANAGER:add_event(Event({
      trigger = 'ease',
      blocking = false,
      ref_table = G.GAME,
      ref_value = 'chips',
      ease_to = G.GAME.chips + math.floor(hand_chips*mult),
      delay =  0.5,
      func = (function(t) return math.floor(t) end)
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'ease',
      blocking = true,
      ref_table = G.GAME.current_round.current_hand,
      ref_value = 'chip_total',
      ease_to = 0,
      delay =  0.5,
      func = (function(t) return math.floor(t) end)
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = (function() G.GAME.current_round.current_hand.handname = '';return true end)
    }))
    delay(0.3)
    
    local no_you = find_joker('One More Time!')
    if next(no_you) then
        for i=1,#no_you do
            no_you[i].ability.extra.score = math.floor(hand_chips * mult)
        end
    end

    for i=1, #G.jokers.cards do
        --calculate the joker after hand played effects
        local effects = eval_card(G.jokers.cards[i], {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, after = true})
        if effects.jokers then
            card_eval_status_text(G.jokers.cards[i], 'jokers', nil, percent, nil, effects.jokers)
            percent = percent + percent_delta
        end
    end

    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function()     
            if G.GAME.modifiers.debuff_played_cards then 
                for k, v in ipairs(scoring_hand) do v.ability.perma_debuff = true end
            end
        return true end)
      }))

end


G.FUNCS.evaluate_play_scouter = function(e)
    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + G.consumeables.config.card_limit
    local text,disp_text,poker_hands,scoring_hand,non_loc_disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)

    --Add all the pure bonus cards to the scoring hand
    local pures = {}
    for i=1, #G.hand.highlighted do
        if next(find_joker('Splash')) then
            scoring_hand[i] = G.hand.highlighted[i]
        else
            if G.hand.highlighted[i].ability.effect == 'Stone Card' or G.hand.highlighted[i].ability.effect == 'Coal Card' then
                local inside = false
                for j=1, #scoring_hand do
                    if scoring_hand[j] == G.hand.highlighted[i] then
                        inside = true
                    end
                end
                if not inside then table.insert(pures, G.hand.highlighted[i]) end
            end
        end
    end
    for i=1, #pures do
        table.insert(scoring_hand, pures[i])
    end
    table.sort(scoring_hand, function (a, b) return a.T.x < b.T.x end )
    local hand_scouter = {}
    for i=1, #G.hand.cards do
        local is_in_hand = false
        for j=1, #G.hand.highlighted do
            if G.hand.cards[i] == G.hand.highlighted[j] then is_in_hand = true end
        end
        if not is_in_hand then hand_scouter[#hand_scouter + 1] = G.hand.cards[i] end

    end


    local percent = 0.3
    local percent_delta = 0.08

    if not G.GAME.blind:debuff_hand(G.hand.highlighted, poker_hands, text, true) then
        mult = mod_mult(G.GAME.hands[text].mult)
        hand_chips = mod_chips(G.GAME.hands[text].chips)

        local hand_text_set = false
        for i=1, #G.jokers.cards do
            --calculate the joker effects
            local effects = eval_card(G.jokers.cards[i], {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, before = true, blueprint = 1, scouter = true})
        end

        mult = mod_mult(G.GAME.hands[text].mult)
        hand_chips = mod_chips(G.GAME.hands[text].chips)

        local modded = false

        mult, hand_chips, modded = G.GAME.blind:modify_hand(G.hand.highlighted, poker_hands, text, mult, hand_chips)
        mult, hand_chips = mod_mult(mult), mod_chips(hand_chips)
        for i=1, #scoring_hand do
            --add cards played to list
            if scoring_hand[i].ability.effect ~= 'Stone Card' and scoring_hand[i].ability.effect ~= 'Coal Card' then 
                G.GAME.cards_played[scoring_hand[i].base.value].total = G.GAME.cards_played[scoring_hand[i].base.value].total + 1
                G.GAME.cards_played[scoring_hand[i].base.value].suits[scoring_hand[i].base.suit] = true 
            end
            --if card is debuffed
            if scoring_hand[i].debuff then
                G.GAME.blind.triggered = true
            else
                --Check for play doubling
                local reps = {1}
                
                --From Red seal
                local eval = eval_card(scoring_hand[i], {repetition_only = true,cardarea = G.play, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, repetition = true})
                if next(eval) then 
                    for h = 1, eval.seals.repetitions do
                        reps[#reps+1] = eval
                    end
                end
                --From jokers
                for j=1, #G.jokers.cards do
                    --calculate the joker effects
                    local eval = eval_card(G.jokers.cards[j], {cardarea = G.play, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, other_card = scoring_hand[i], repetition = true})
                    if next(eval) and eval.jokers then 
                        for h = 1, eval.jokers.repetitions do
                            reps[#reps+1] = eval
                        end
                    end
                end
                for j=1,#reps do
                    percent = percent + percent_delta
                    
                    --calculate the hand effects
                    local effects = {eval_card(scoring_hand[i], {cardarea = G.play, full_hand = G.play.cards, scoring_hand = scoring_hand, poker_hand = text})}
                    for k=1, #G.jokers.cards do
                        --calculate the joker individual card effects
                        if G.jokers.cards[k].ability.name ~= 'Vagabond' then
                            local eval = G.jokers.cards[k]:calculate_joker({cardarea = G.play, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, other_card = scoring_hand[i], individual = true, blueprint = 1, scouter = true})
                            if eval then 
                                table.insert(effects, eval)
                            end
                        end
                    end
                    scoring_hand[i].lucky_trigger = nil

                    for ii = 1, #effects do
                        --If chips added, do chip add event and add the chips to the total
                        if effects[ii].chips then 
                            hand_chips = mod_chips(hand_chips + effects[ii].chips)
                        end

                        --If mult added, do mult add event and add the mult to the total
                        if effects[ii].mult then 
                            mult = mod_mult(math.max(0, mult + effects[ii].mult))
                        end

                        --Any extra effects
                        if effects[ii].extra then 
                            local extras = {mult = false, hand_chips = false}
                            if effects[ii].extra.mult_mod then mult =mod_mult( mult + effects[ii].extra.mult_mod);extras.mult = true end
                            if effects[ii].extra.chip_mod then hand_chips = mod_chips(hand_chips + effects[ii].extra.chip_mod);extras.hand_chips = true end
                            if effects[ii].extra.swap then 
                                local old_mult = mult
                                mult = mod_mult(hand_chips)
                                hand_chips = mod_chips(old_mult)
                                extras.hand_chips = true; extras.mult = true
                            end
                        end

                        --If x_mult added, do mult add event and mult the mult to the total
                        if effects[ii].x_mult then 
                            mult = mod_mult(mult*effects[ii].x_mult)
                        end

                        --calculate the card edition effects
                        if effects[ii].edition then
                            hand_chips = mod_chips(hand_chips + (effects[ii].edition.chip_mod or 0))
                            mult = mult + (effects[ii].edition.mult_mod or 0)
                            mult = mod_mult(mult*(effects[ii].edition.x_mult_mod or 1))
                        end
                    end
                end
            end
        end

        delay(0.3)
        local mod_percent = false
            for i=1, #hand_scouter do
                if mod_percent then percent = percent + percent_delta end
                mod_percent = false

                --Check for hand doubling
                local reps = {1}
                local j = 1
                while j <= #reps do

                    --calculate the hand effects
                    local effects = {eval_card(hand_scouter[i], {cardarea = G.hand, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands})}

                    for k=1, #G.jokers.cards do
                        --calculate the joker individual card effects
                        if G.jokers.cards[k].ability.name ~= 'Vagabond' then
                            local eval = G.jokers.cards[k]:calculate_joker({cardarea = G.hand, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, other_card = hand_scouter[i], individual = true, blueprint=1, scouter=true})
                            if eval then 
                                mod_percent = true
                                table.insert(effects, eval)
                            end
                        end
                    end

                    if reps[j] == 1 then 
                        --Check for hand doubling

                        --From Red seal
                        local eval = eval_card(hand_scouter[i], {repetition_only = true,cardarea = G.hand, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, repetition = true, card_effects = effects})
                        if next(eval) and (next(effects[1]) or #effects > 1) then 
                            for h  = 1, eval.seals.repetitions do
                                reps[#reps+1] = eval
                            end
                        end

                        --From Joker
                        for j=1, #G.jokers.cards do
                            --calculate the joker effects
                            local eval = eval_card(G.jokers.cards[j], {cardarea = G.hand, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, other_card = hand_scouter[i], repetition = true, card_effects = effects})
                            if next(eval) then 
                                for h  = 1, eval.jokers.repetitions do
                                    reps[#reps+1] = eval
                                end
                            end
                        end
                    end
    
                    for ii = 1, #effects do
                        --if this effect came from a joker
                        if effects[ii].card then
                            mod_percent = true
                        end
                        
                        --If hold mult added, do hold mult add event and add the mult to the total
                        

                        if effects[ii].h_mult then
                            mod_percent = true
                            mult = mod_mult(mult + effects[ii].h_mult)
                        end

                        if effects[ii].h_bonus then
                            mod_percent = true
                            hand_chips = mod_chips(hand_chips + effects[ii].h_bonus)
                        end

                        if effects[ii].x_chips then
                            mod_percent = true
                            hand_chips = mod_chips(hand_chips*effects[ii].x_chips)
                        end

                        if effects[ii].x_mult then
                            mod_percent = true
                            mult = mod_mult(mult*effects[ii].x_mult)
                        end

                        if effects[ii].message then
                            mod_percent = true
                        end
                    end
                    j = j +1
                end
            end
        --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
        --Joker Effects
        --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
        percent = percent + percent_delta
        for i=1, #G.jokers.cards + #G.consumeables.cards do
            local _card = G.jokers.cards[i] or G.consumeables.cards[i - #G.jokers.cards]
            --calculate the joker edition effects
            local edition_effects = eval_card(_card, {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, edition = true})
            if edition_effects.jokers then
                edition_effects.jokers.edition = true
                if edition_effects.jokers.chip_mod then
                    hand_chips = mod_chips(hand_chips + edition_effects.jokers.chip_mod)
                end
                if edition_effects.jokers.mult_mod then
                    mult = mod_mult(mult + edition_effects.jokers.mult_mod)
                end
                percent = percent+percent_delta
            end

            --calculate the joker effects
            local effects = eval_card(_card, {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, joker_main = true})

            --Any Joker effects
            if effects.jokers then 
                local extras = {mult = false, hand_chips = false}
                if effects.jokers.mult_mod then mult = mod_mult(mult + effects.jokers.mult_mod);extras.mult = true end
                if effects.jokers.chip_mod then hand_chips = mod_chips(hand_chips + effects.jokers.chip_mod);extras.hand_chips = true end
                if effects.jokers.Xmult_mod then mult = mod_mult(mult*effects.jokers.Xmult_mod);extras.mult = true  end
                percent = percent+percent_delta
            end

            --Joker on Joker effects
            for _, v in ipairs(G.jokers.cards) do
                if v.ability.name ~= 'Vagabond' then
                    local effect = v:calculate_joker{full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, other_joker = _card}
                    if effect then
                        local extras = {mult = false, hand_chips = false}
                        if effect.mult_mod then mult = mod_mult(mult + effect.mult_mod);extras.mult = true end
                        if effect.chip_mod then hand_chips = mod_chips(hand_chips + effect.chip_mod);extras.hand_chips = true end
                        if effect.Xmult_mod then mult = mod_mult(mult*effect.Xmult_mod);extras.mult = true  end
                        percent = percent+percent_delta
                    end
                end
            end

            if edition_effects.jokers then
                if edition_effects.jokers.x_mult_mod then
                    mult = mod_mult(mult*edition_effects.jokers.x_mult_mod)
                end
                percent = percent+percent_delta
            end
        end
        G.GAME.consumeable_buffer = math.max(0, G.GAME.consumeable_buffer - G.consumeables.config.card_limit)
        local nu_chip, nu_mult = G.GAME.selected_back:trigger_effect{context = 'final_scoring_step', chips = hand_chips, mult = mult}
        mult = mod_mult(nu_mult or mult)
        hand_chips = mod_chips(nu_chip or hand_chips)
        return math.floor(hand_chips * mult)
    else
        return 0
    end
end

G.FUNCS.can_play = function(e)
    if #G.hand.highlighted <= 0 or G.GAME.blind.block_play or #G.hand.highlighted > 6 then 
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.BLUE
        e.config.button = 'play_cards_from_highlighted'
    end
  end

function G.UIDEF.view_deck(unplayed_only)
  local deck_tables = {}
  remove_nils(G.playing_cards)
  G.VIEWING_DECK = true
  table.sort(G.playing_cards, function (a, b) return a:get_nominal('suit') > b:get_nominal('suit') end )
  local SUITS = {
    Spades = {},
    Hearts = {},
    Clubs = {},
    Diamonds = {},
  }
  local suit_map = {'Spades', 'Hearts', 'Clubs', 'Diamonds'}
  for k, v in ipairs(G.playing_cards) do
    table.insert(SUITS[v.base.suit], v)
  end
  for j = 1, 4 do
    if SUITS[suit_map[j]][1] then
      local view_deck = CardArea(
        G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
        6.5*G.CARD_W,
        0.6*G.CARD_H,
        {card_limit = #SUITS[suit_map[j]], type = 'title', view_deck = true, highlight_limit = 0, card_w = G.CARD_W*0.7, draw_layers = {'card'}})
      table.insert(deck_tables, 
      {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
        {n=G.UIT.O, config={object = view_deck}}
      }}
      )

      for i = 1, #SUITS[suit_map[j]] do
        if SUITS[suit_map[j]][i] then
          local greyed, _scale = nil, 0.7
          if unplayed_only and not ((SUITS[suit_map[j]][i].area and SUITS[suit_map[j]][i].area == G.deck) or SUITS[suit_map[j]][i].ability.wheel_flipped) then
            greyed = true
          end
          local copy = copy_card(SUITS[suit_map[j]][i],nil, _scale)
          copy.greyed = greyed
          copy.T.x = view_deck.T.x + view_deck.T.w/2
          copy.T.y = view_deck.T.y

          copy:hard_set_T()
          view_deck:emplace(copy)
        end
      end
    end
  end

  local flip_col = G.C.WHITE

  local suit_tallies = {['Spades']  = 0, ['Hearts'] = 0, ['Clubs'] = 0, ['Diamonds'] = 0}
  local mod_suit_tallies = {['Spades']  = 0, ['Hearts'] = 0, ['Clubs'] = 0, ['Diamonds'] = 0}
  local rank_tallies = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  local mod_rank_tallies = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  local rank_name_mapping = {2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'}
  local face_tally = 0
  local mod_face_tally = 0
  local num_tally = 0
  local mod_num_tally = 0
  local ace_tally = 0
  local mod_ace_tally = 0
  local wheel_flipped = 0

  for k, v in ipairs(G.playing_cards) do
    if (v.ability.name ~= 'Stone Card' and v.ability.name ~= 'Coal Card' and v.ability.name ~= 'Blank Card') and (not unplayed_only or ((v.area and v.area == G.deck) or v.ability.wheel_flipped)) then 
      if v.ability.wheel_flipped and unplayed_only then wheel_flipped = wheel_flipped + 1 end
      --For the suits
      suit_tallies[v.base.suit] = (suit_tallies[v.base.suit] or 0) + 1
      mod_suit_tallies['Spades'] = (mod_suit_tallies['Spades'] or 0) + (v:is_suit('Spades') and 1 or 0)
      mod_suit_tallies['Hearts'] = (mod_suit_tallies['Hearts'] or 0) + (v:is_suit('Hearts') and 1 or 0)
      mod_suit_tallies['Clubs'] = (mod_suit_tallies['Clubs'] or 0) + (v:is_suit('Clubs') and 1 or 0)
      mod_suit_tallies['Diamonds'] = (mod_suit_tallies['Diamonds'] or 0) + (v:is_suit('Diamonds') and 1 or 0)

      --for face cards/numbered cards/aces
      local card_id = v:get_id()
      face_tally = face_tally + ((card_id ==11 or card_id ==12 or card_id ==13) and 1 or 0)
      mod_face_tally = mod_face_tally + (v:is_face() and 1 or 0)
      if card_id > 1 and card_id < 11 then
        num_tally = num_tally + 1
        if not v.debuff then mod_num_tally = mod_num_tally + 1 end 
      end
      if card_id == 14 then
        ace_tally = ace_tally + 1
        if not v.debuff then mod_ace_tally = mod_ace_tally + 1 end 
      end

      --ranks
      rank_tallies[card_id - 1] = rank_tallies[card_id - 1] + 1
      if not v.debuff then mod_rank_tallies[card_id - 1] = mod_rank_tallies[card_id - 1] + 1 end 
    end
  end

  local modded = (face_tally ~= mod_face_tally) or
    (mod_suit_tallies['Spades'] ~= suit_tallies['Spades']) or
    (mod_suit_tallies['Hearts'] ~= suit_tallies['Hearts']) or
    (mod_suit_tallies['Clubs'] ~= suit_tallies['Clubs']) or
    (mod_suit_tallies['Diamonds'] ~= suit_tallies['Diamonds'])

  if wheel_flipped > 0 then flip_col = mix_colours(G.C.FILTER, G.C.WHITE,0.7) end

  local rank_cols = {}
  for i = 13, 1, -1 do
    local mod_delta = mod_rank_tallies[i] ~= rank_tallies[i]
    rank_cols[#rank_cols+1] = {n=G.UIT.R, config={align = "cm", padding = 0.07}, nodes={
      {n=G.UIT.C, config={align = "cm", r = 0.1, padding = 0.04, emboss = 0.04, minw = 0.5, colour = G.C.L_BLACK}, nodes={
        {n=G.UIT.T, config={text = rank_name_mapping[i],colour = G.C.JOKER_GREY, scale = 0.35, shadow = true}},
      }},
      {n=G.UIT.C, config={align = "cr", minw = 0.4}, nodes={
        mod_delta and {n=G.UIT.O, config={object = DynaText({string = {{string = ''..rank_tallies[i], colour = flip_col},{string =''..mod_rank_tallies[i], colour = G.C.BLUE}}, colours = {G.C.RED}, scale = 0.4, y_offset = -2, silent = true, shadow = true, pop_in_rate = 10, pop_delay = 4})}} or
        {n=G.UIT.T, config={text = rank_tallies[i] or 'NIL',colour = flip_col, scale = 0.45, shadow = true}},
      }}
    }}
  end


  local t = 
  {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
    {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={}},
    {n=G.UIT.R, config={align = "cm"}, nodes={
      {n=G.UIT.C, config={align = "cm", minw = 1.5, minh = 2, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes={
        {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
          {n=G.UIT.R, config={align = "cm", r = 0.1, colour = G.C.L_BLACK, emboss = 0.05, padding = 0.15}, nodes={
            {n=G.UIT.R, config={align = "cm"}, nodes={
              {n=G.UIT.O, config={object = DynaText({string = G.GAME.selected_back.loc_name, colours = {G.C.WHITE}, bump = true, rotate = true, shadow = true, scale = 0.6 - string.len(G.GAME.selected_back.loc_name)*0.01})}},
            }},
            {n=G.UIT.R, config={align = "cm", r = 0.1, padding = 0.1, minw = 2.5, minh = 1.3, colour = G.C.WHITE, emboss = 0.05}, nodes={
              {n=G.UIT.O, config={object = UIBox{
                definition = G.GAME.selected_back:generate_UI(nil,0.7, 0.5, G.GAME.challenge),
                config = {offset = {x=0,y=0}}
              }}}
            }}
          }},
          {n=G.UIT.R, config={align = "cm", r = 0.1, outline_colour = G.C.L_BLACK, line_emboss = 0.05, outline = 1.5}, nodes={
            {n=G.UIT.R, config={align = "cm", minh = 0.05, padding = 0.07}, nodes={
                {n=G.UIT.O, config={object = DynaText({string = {{string = localize('k_base_cards'), colour = G.C.RED}, modded and {string = localize('k_effective'), colour = G.C.BLUE} or nil}, colours = {G.C.RED}, silent = true,scale = 0.4,pop_in_rate = 10, pop_delay = 4})}}
            }},
            {n=G.UIT.R, config={align = "cm", minh = 0.05, padding = 0.1}, nodes={
              tally_sprite({x=1,y=0},{{string = ''..ace_tally, colour = flip_col},{string =''..mod_ace_tally, colour = G.C.BLUE}}, {localize('k_aces')}),--Aces
              tally_sprite({x=2,y=0},{{string = ''..face_tally, colour = flip_col},{string =''..mod_face_tally, colour = G.C.BLUE}}, {localize('k_face_cards')}),--Face
              tally_sprite({x=3,y=0},{{string = ''..num_tally, colour = flip_col},{string =''..mod_num_tally, colour = G.C.BLUE}}, {localize('k_numbered_cards')}),--Numbers
            }},
            {n=G.UIT.R, config={align = "cm", minh = 0.05, padding = 0.1}, nodes={
              tally_sprite({x=3,y=1}, {{string = ''..suit_tallies['Spades'], colour = flip_col},{string =''..mod_suit_tallies['Spades'], colour = G.C.BLUE}}, {localize('Spades', 'suits_plural')}),
              tally_sprite({x=0,y=1}, {{string = ''..suit_tallies['Hearts'], colour = flip_col},{string =''..mod_suit_tallies['Hearts'], colour = G.C.BLUE}}, {localize('Hearts', 'suits_plural')}),
            }},
            {n=G.UIT.R, config={align = "cm", minh = 0.05, padding = 0.1}, nodes={
              tally_sprite({x=2,y=1}, {{string = ''..suit_tallies['Clubs'], colour = flip_col},{string =''..mod_suit_tallies['Clubs'], colour = G.C.BLUE}}, {localize('Clubs', 'suits_plural')}),
              tally_sprite({x=1,y=1}, {{string = ''..suit_tallies['Diamonds'], colour = flip_col},{string =''..mod_suit_tallies['Diamonds'], colour = G.C.BLUE}}, {localize('Diamonds', 'suits_plural')}),
            }},
          }}
        }},
        {n=G.UIT.C, config={align = "cm"}, nodes=rank_cols},
        {n=G.UIT.B, config={w = 0.1, h = 0.1}},
      }},
      {n=G.UIT.B, config={w = 0.2, h = 0.1}},
      {n=G.UIT.C, config={align = "cm", padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables}
    }},
    {n=G.UIT.R, config={align = "cm", minh = 0.8, padding = 0.05}, nodes={
      modded and {n=G.UIT.R, config={align = "cm"}, nodes={
        {n=G.UIT.C, config={padding = 0.3, r = 0.1, colour = mix_colours(G.C.BLUE, G.C.WHITE,0.7)}, nodes = {}},
        {n=G.UIT.T, config={text =' '..localize('ph_deck_preview_effective'),colour = G.C.WHITE, scale =0.3}},
      }} or nil,
      wheel_flipped > 0 and {n=G.UIT.R, config={align = "cm"}, nodes={
        {n=G.UIT.C, config={padding = 0.3, r = 0.1, colour = flip_col}, nodes = {}},
        {n=G.UIT.T, config={text =' '..(wheel_flipped > 1 and
          localize{type = 'variable', key = 'deck_preview_wheel_plural', vars = {wheel_flipped}} or
          localize{type = 'variable', key = 'deck_preview_wheel_singular', vars = {wheel_flipped}}),colour = G.C.WHITE, scale =0.3}},
      }} or nil,
    }}
  }}
  return t
end

function Card:draw(layer)
    layer = layer or 'both'

    self.hover_tilt = 1
    
    if not self.states.visible then return end
    
    if (layer == 'shadow' or layer == 'both') then
        self.ARGS.send_to_shader = self.ARGS.send_to_shader or {}
        self.ARGS.send_to_shader[1] = math.min(self.VT.r*3, 1) + G.TIMERS.REAL/(28) + (self.juice and self.juice.r*20 or 0) + self.tilt_var.amt
        self.ARGS.send_to_shader[2] = G.TIMERS.REAL

        for k, v in pairs(self.children) do
            v.VT.scale = self.VT.scale
        end
    end

    G.shared_shadow = self.sprite_facing == 'front' and self.children.center or self.children.back

    --Draw the shadow
    if not self.no_shadow and G.SETTINGS.GRAPHICS.shadows == 'On' and((layer == 'shadow' or layer == 'both') and (self.ability.effect ~= 'Glass Card' and not self.greyed) and ((self.area and self.area ~= G.discard and self.area.config.type ~= 'deck') or not self.area or self.states.drag.is)) then
        self.shadow_height = 0*(0.08 + 0.4*math.sqrt(self.velocity.x^2)) + ((((self.highlighted and self.area == G.play) or self.states.drag.is) and 0.35) or (self.area and self.area.config.type == 'title_2') and 0.04 or 0.1)
        G.shared_shadow:draw_shader('dissolve', self.shadow_height)
    end

    if (layer == 'card' or layer == 'both') and self.area ~= G.hand then 
        if self.children.focused_ui then self.children.focused_ui:draw() end
    end
    
    if (layer == 'card' or layer == 'both') then
        -- for all hover/tilting:
        self.tilt_var = self.overwrite_tilt_var or self.tilt_var or {mx = 0, my = 0, dx = self.tilt_var.dx or 0, dy = self.tilt_var.dy or 0, amt = 0}
        local tilt_factor = 0.3
        if not self.overwrite_tilt_var then 
            if self.states.focus.is then
                self.tilt_var.mx, self.tilt_var.my = G.CONTROLLER.cursor_position.x + self.tilt_var.dx*self.T.w*G.TILESCALE*G.TILESIZE, G.CONTROLLER.cursor_position.y + self.tilt_var.dy*self.T.h*G.TILESCALE*G.TILESIZE
                self.tilt_var.amt = math.abs(self.hover_offset.y + self.hover_offset.x - 1 + self.tilt_var.dx + self.tilt_var.dy - 1)*tilt_factor
            elseif self.states.hover.is then
                self.tilt_var.mx, self.tilt_var.my = G.CONTROLLER.cursor_position.x, G.CONTROLLER.cursor_position.y
                self.tilt_var.amt = math.abs(self.hover_offset.y + self.hover_offset.x - 1)*tilt_factor
            elseif self.ambient_tilt then
                local tilt_angle = G.TIMERS.REAL*(1.56 + (self.ID/1.14212)%1) + self.ID/1.35122
                self.tilt_var.mx = ((0.5 + 0.5*self.ambient_tilt*math.cos(tilt_angle))*self.VT.w+self.VT.x+G.ROOM.T.x)*G.TILESIZE*G.TILESCALE
                self.tilt_var.my = ((0.5 + 0.5*self.ambient_tilt*math.sin(tilt_angle))*self.VT.h+self.VT.y+G.ROOM.T.y)*G.TILESIZE*G.TILESCALE
                self.tilt_var.amt = self.ambient_tilt*(0.5+math.cos(tilt_angle))*tilt_factor
            end
        end
        --Any particles
        if self.children.particles then self.children.particles:draw() end

        --Draw any tags/buttons
        if self.children.price then self.children.price:draw() end
        if self.children.buy_button then
            if self.highlighted then
                self.children.buy_button.states.visible = true
                self.children.buy_button:draw()
                if self.children.buy_and_use_button then 
                    self.children.buy_and_use_button:draw()
                end
            else
                self.children.buy_button.states.visible = false
            end
        end
        if self.children.use_button and self.highlighted then self.children.use_button:draw() end

        if self.vortex then
            if self.facing == 'back' then 
                self.children.back:draw_shader('vortex')
            else
                self.children.center:draw_shader('vortex')
                if self.children.front then 
                    self.children.front:draw_shader('vortex')
                end
            end

            love.graphics.setShader()
        elseif self.sprite_facing == 'front' then 
            --Draw the main part of the card
            if (self.edition and self.edition.negative) or (self.ability.name == 'Antimatter' and (self.config.center.discovered or self.bypass_discovery_center)) then
                self.children.center:draw_shader('negative', nil, self.ARGS.send_to_shader)
                if self.children.front and self.ability.effect ~= 'Stone Card' and self.ability.effect ~= 'Coal Card' and self.ability.effect ~= 'Blank Card' then
                    self.children.front:draw_shader('negative', nil, self.ARGS.send_to_shader)
                end
            elseif not self.greyed then
                self.children.center:draw_shader('dissolve')
                --If the card has a front, draw that next
                if self.children.front and self.ability.effect ~= 'Stone Card' and self.ability.effect ~= 'Coal Card'  and self.ability.effect ~= 'Blank Card' then
                    self.children.front:draw_shader('dissolve')
                end
            end

            --If the card is not yet discovered
            if not self.config.center.discovered and (self.ability.consumeable or self.config.center.unlocked) and not self.config.center.demo and not self.bypass_discovery_center then
                local shared_sprite = (self.ability.set == 'Edition' or self.ability.set == 'Joker') and G.shared_undiscovered_joker or G.shared_undiscovered_tarot
                local scale_mod = -0.05 + 0.05*math.sin(1.8*G.TIMERS.REAL)
                local rotate_mod = 0.03*math.sin(1.219*G.TIMERS.REAL)

                shared_sprite.role.draw_major = self
                shared_sprite:draw_shader('dissolve', nil, nil, nil, self.children.center, scale_mod, rotate_mod)
            end

            if self.ability.name == 'Invisible Joker' and (self.config.center.discovered or self.bypass_discovery_center) then
                self.children.center:draw_shader('voucher', nil, self.ARGS.send_to_shader)
            end
            
            --If the card has any edition/seal, add that here
            if self.edition or self.seal or self.ability.eternal or self.sticker or self.ability.set == 'Spectral' or self.debuff or self.greyed or self.ability.name == 'The Soul' or self.ability.set == 'Voucher' or self.ability.set == 'Booster' or self.config.center.soul_pos or self.config.center.demo then
                if (self.ability.set == 'Voucher' or self.config.center.demo) and (self.ability.name ~= 'Antimatter' or not (self.config.center.discovered or self.bypass_discovery_center)) then
                    self.children.center:draw_shader('voucher', nil, self.ARGS.send_to_shader)
                end
                if self.ability.set == 'Booster' or self.ability.set == 'Spectral' then
                    self.children.center:draw_shader('booster', nil, self.ARGS.send_to_shader)
                end
                if self.edition and self.edition.holo then
                    self.children.center:draw_shader('holo', nil, self.ARGS.send_to_shader)
                    if self.children.front and self.ability.effect ~= 'Stone Card' and self.ability.effect ~= 'Coal Card' and self.ability.effect ~= 'Blank Card' then
                        self.children.front:draw_shader('holo', nil, self.ARGS.send_to_shader)
                    end
                end
                if self.edition and self.edition.foil then
                    self.children.center:draw_shader('foil', nil, self.ARGS.send_to_shader)
                    if self.children.front and self.ability.effect ~= 'Stone Card' and self.ability.effect ~= 'Coal Card' and self.ability.effect ~= 'Blank Card' then
                        self.children.front:draw_shader('foil', nil, self.ARGS.send_to_shader)
                    end
                end
                if self.edition and self.edition.polychrome then
                    self.children.center:draw_shader('polychrome', nil, self.ARGS.send_to_shader)
                    if self.children.front and self.ability.effect ~= 'Stone Card' and self.ability.effect ~= 'Coal Card' and self.ability.effect ~= 'Blank Card' then
                        self.children.front:draw_shader('polychrome', nil, self.ARGS.send_to_shader)
                    end
                end
                if (self.edition and self.edition.negative) or (self.ability.name == 'Antimatter' and (self.config.center.discovered or self.bypass_discovery_center)) then
                    self.children.center:draw_shader('negative_shine', nil, self.ARGS.send_to_shader)
                end
                if self.seal then
                    G.shared_seals[self.seal].role.draw_major = self
                    G.shared_seals[self.seal]:draw_shader('dissolve', nil, nil, nil, self.children.center)
                    if self.seal == 'Gold' then G.shared_seals[self.seal]:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil, self.children.center) end
                end
                if self.ability.eternal then
                    G.shared_sticker_eternal.role.draw_major = self
                    G.shared_sticker_eternal:draw_shader('dissolve', nil, nil, nil, self.children.center)
                    G.shared_sticker_eternal:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil, self.children.center)
                end
                if self.sticker and G.shared_stickers[self.sticker] then
                    G.shared_stickers[self.sticker].role.draw_major = self
                    G.shared_stickers[self.sticker]:draw_shader('dissolve', nil, nil, nil, self.children.center)
                    G.shared_stickers[self.sticker]:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil, self.children.center)
                end

                if self.ability.name == 'The Soul' and (self.config.center.discovered or self.bypass_discovery_center) then
                    local scale_mod = 0.05 + 0.05*math.sin(1.8*G.TIMERS.REAL) + 0.07*math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
                    local rotate_mod = 0.1*math.sin(1.219*G.TIMERS.REAL) + 0.07*math.sin((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2
    
                    G.shared_soul.role.draw_major = self
                    G.shared_soul:draw_shader('dissolve',0, nil, nil, self.children.center,scale_mod, rotate_mod,nil, 0.1 + 0.03*math.sin(1.8*G.TIMERS.REAL),nil, 0.6)
                    G.shared_soul:draw_shader('dissolve', nil, nil, nil, self.children.center, scale_mod, rotate_mod)
                end

                if self.config.center.soul_pos and (self.config.center.discovered or self.bypass_discovery_center) then
                    local scale_mod = 0.07 + 0.02*math.sin(1.8*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
                    local rotate_mod = 0.05*math.sin(1.219*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2
    
                    if self.ability.name == 'Hologram' then
                        self.hover_tilt = self.hover_tilt*1.5
                        self.children.floating_sprite:draw_shader('hologram', nil, self.ARGS.send_to_shader, nil, self.children.center, 2*scale_mod, 2*rotate_mod)
                        self.hover_tilt = self.hover_tilt/1.5
                    else
                        self.children.floating_sprite:draw_shader('dissolve',0, nil, nil, self.children.center,scale_mod, rotate_mod,nil, 0.1 + 0.03*math.sin(1.8*G.TIMERS.REAL),nil, 0.6)
                        self.children.floating_sprite:draw_shader('dissolve', nil, nil, nil, self.children.center, scale_mod, rotate_mod)
                    end
                    
                end
                if self.debuff then
                    self.children.center:draw_shader('debuff', nil, self.ARGS.send_to_shader)
                    if self.children.front and self.ability.effect ~= 'Stone Card' and self.ability.effect ~= 'Coal Card' and self.ability.effect ~= 'Blank Card' then
                        self.children.front:draw_shader('debuff', nil, self.ARGS.send_to_shader)
                    end
                end
                if self.greyed then
                    self.children.center:draw_shader('played', nil, self.ARGS.send_to_shader)
                    if self.children.front and self.ability.effect ~= 'Stone Card' and self.ability.effect ~= 'Coal Card' and self.ability.effect ~= 'Blank Card' then
                        self.children.front:draw_shader('played', nil, self.ARGS.send_to_shader)
                    end
                end
            end 
        elseif self.sprite_facing == 'back' then
            local overlay = G.C.WHITE
            if self.area and self.area.config.type == 'deck' and self.rank > 3 then
                overlay = {0.5 + ((#self.area.cards - self.rank)%7)/50, 0.5 + ((#self.area.cards - self.rank)%7)/50, 0.5 +((#self.area.cards - self.rank)%7)/50, 1}
            end

            if self.area and self.area.config.type == 'deck' then
                self.children.back:draw(overlay)
            else
                self.children.back:draw_shader('dissolve')
            end

            if self.sticker and G.shared_stickers[self.sticker] then
                G.shared_stickers[self.sticker].role.draw_major = self
                G.shared_stickers[self.sticker]:draw_shader('dissolve', nil, nil, true, self.children.center)
                if self.sticker == 'Gold' then G.shared_stickers[self.sticker]:draw_shader('voucher', nil, self.ARGS.send_to_shader, true, self.children.center) end
            end
        end

        if self.children.overwrite and self.tilt_var  then 

            self.children.overwrite.overwrite_tilt_var = copy_table(self.tilt_var)

        end

        for k, v in pairs(self.children) do
            if k ~= 'focused_ui' and k ~= "front" and k ~= "overwrite" and k ~= "back" and k ~= "soul_parts" and k ~= "center" and k ~= 'floating_sprite' and k~= "shadow" and k~= "use_button" and k ~= 'buy_button' and k ~= 'buy_and_use_button' and k~= "debuff" and k ~= 'price' and k~= 'particles' and k ~= 'h_popup' then v:draw() end
        end

        if self.children.overwrite then 
            love.graphics.push()
            love.graphics.setColor(G.C.BLUE)
            G.BRUTE_OVERLAY = {1,1,1,math.sin(5*G.TIMERS.REAL)}
            self.children.overwrite:draw('card')
            G.BRUTE_OVERLAY = nil
            love.graphics.pop()
        end

        if (layer == 'card' or layer == 'both') and self.area == G.hand then 
            if self.children.focused_ui then self.children.focused_ui:draw() end
        end

        add_to_drawhash(self)
        self:draw_boundingrect()
    end
end


function create_UIBox_your_collection_enhancements(exit)
  local deck_tables = {}

  G.your_collection = {}
  for j = 1, 2 do
    G.your_collection[j] = CardArea(
      G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
      4.25*G.CARD_W,
      1.03*G.CARD_H, 
      {card_limit = 8, type = 'title', highlight_limit = 0})
    table.insert(deck_tables, 
    {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true}, nodes={
      {n=G.UIT.O, config={object = G.your_collection[j]}}
    }}
    )
  end

  for i = 1, 8 do
    for j = 1, #G.your_collection do
      local center = G.P_CENTER_POOLS["Enhanced"][i+(j-1)*8]
      local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, center)
      G.your_collection[j]:emplace(card)
    end
  end
  
  local t = create_UIBox_generic_options({ infotip = localize('ml_edition_seal_enhancement_explanation'), back_func = exit or 'your_collection', snap_back = true, contents = {
            {n=G.UIT.R, config={align = "cm", minw = 2.5, padding = 0.1, r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables},
          }})
  return t
end

----------------------------------------------
------------MOD CODE END----------------------