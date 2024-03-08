--- STEAMODDED HEADER
--- MOD_NAME: Jelly's Jokers
--- MOD_ID: JellyJokers
--- MOD_AUTHOR: [JamesTheJellyfish]
--- MOD_DESCRIPTION: A pack of Jokers

----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.JellyJokers()
  sendDebugMessage("Loaded JellyJokers~")

  local localization = {
          j_tarlton = {
               name = "Tarlton",
                   text = {
                      "Copies the effects of",
                      "all other {C:attention}Jokers{}",
              },
          },
          j_pierrot = {
               name = "Pierrot",
                   text = {
                      "Allows for {C:attention}6{}",
                      "cards to be selected and played,",
                      "instead of 5.",
              },
          },
          j_prosopagnosia = {
               name = "Prosopagnosia",
                   text = {
                      "{C:red}NO{} cards are",
                      "considered",
                      "{C:attention}face{} cards",
              },
          },
          j_double_vision = {
               name = "Double Vision",
                   text = {
                      "All cards are",
                      "considered",
                      "{C:attention}2s{}",
              },
          },
          j_scouter = {
               name = "Scouter Joker",
                   text = {
                      "Tells you what a given hand",
                      "would score, including all bonuses",
                      "Current hand would score:",
                      "{C:blue,E:1,S:0.8}#1#{}",
              },
          },
          j_special_snowflake = {
               name = "Special Snowflake",
                   text = {
                      "This Joker gains {X:mult,C:white} X#1# {} Mult",
                      "for each {C:attention}Uniquely enhanced card",
                      "in your full deck",
                      "{C:inactive}(ex: {C:green}gold, gold with red seal, steel, etc.{}{C:inactive})",
                      "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
              },
          },
          j_collector = {
               name = "The Collector",
                   text = {
                      "This Joker gains {X:mult,C:white} X#1# {} Mult",
                      "for each {C:attention}non-base edition Joker",
                      "you have.",
                      "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
              },
          },
          j_copycat = {
               name = "Copycat",
                   text = {
                      "Copies ability of",
                      "a random {C:attention}Joker{} in your possession",
                      "(currently copying {C:green}#1#{})",
              },
          },
          j_greener_pastures = {
               name = "Greener Pastures",
                   text = {
                      "When blind is selected, creates a random",
                      "{C:dark_edition}negative{} Joker that can't be sold.",
                      "The joker is replaced every round and",
                      "is destroyed if this card is destroyed.",
              },
          },
          j_one_more = {
               name = "One More Time!",
                   text = {
                      "Sell this card to",
                      "Add your previous hand to current score",
                      "(Currently {C:blue,E:1,S:1}#1#{})",
              },
          },
          j_pessimist = {
               name = "Pessimist",
                   text = {
                      "sell this card to apply",
                      "{C:dark_edition}negative{} to a random Joker.",
                      "Permanent {C:blue}-#1#{} hands.",
              },
          },
          j_lipographic_jokr = {
               name = "Lipographic Jokr",
                   text = {
                      "will grant {C:mult}+#1#{} mult according to",
                      "all scoring cards. Grants {C:mult}-#2#{} mult",
                      "for all {C:attention}fifth symbol{}",
                      "in alias of scoring card.",
              },
          },
          j_buckleswasher = {
               name = "Buckleswasher",
                   text = {
                      "Adds the sell value of",
                      "all owned {C:attention}Jokers{} {C:red,E:1,S:0.3}RIGHT{}",
                      "of this card to Mult",
                      "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
              },
          },
          j_hatter = {
               name = "Mad Hatter",
                   text = {
                      "{C:green,E:1,S:0.7}shuffles{} the {C:attention}Enhancements{},",
                      "{C:attention}Seals{}, and {C:attention}Editions{}",
                      "of played hand",
              },
          },
          j_safari = {
               name = "Safari Joker",
                   text = {
                      "{C:attention}All cards{} will now",
                      "count as the same suit",
              },
          },
          j_oops_1s = {
               name = "Oops! All 1s",
                   text = {
                      "Halves all {C:attention}listed",
                      "{C:green,E:1,S:1.1}probabilities",
                      "{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}1 in 6{C:inactive})",
              },
          },
          j_zeno = {
               name = "Zeno's Joker",
                   text = {
                      "if you draw at least 50% of your deck",
                      "during the round, a {C:attention}random{} card",
                      "in your deck will be {C:red}destroyed{}",
                      "and a {C:spectral}Spectral{} card will be created",
          
                   },
          }
  }
  
  -- Misc localization
  G.localization.misc.dictionary.k_no_you = "Reversed!"
  G.localization.misc.dictionary.k_hatter = "CHANGE PLACES!"
  G.localization.misc.dictionary.k_zeno = "Halfway!"

  

  init_localization()
  updateLocalization(localization, "Joker")

  --[[SMODS.Joker:new(
      name, slug,
      config,
      spritePos, loc_txt,
      rarity, cost, unlocked, discovered, blueprint_compat, eternal_compat,
      atlas
  )
  ]]
     --
  local jokers = {
    j_tarlton=          {order = 1,  unlocked = true, discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 4, cost = 20, name = "Tarlton", pos = {x=1,y=16}, soul_pos = {x=1, y=9}, set = "Joker", effect = "Copycat", cost_mult = 1.0, config = {},unlock_condition = {type = '', extra = '', hidden = true}}, 
    j_pierrot=          {order = 2,  unlocked = true, discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 4, cost = 20, name = "Pierrot", pos = {x=5,y=16}, soul_pos = {x=0, y=9}, set = "Joker", effect = "", config = {}, unlock_condition = {type = '', extra = '', hidden = true}},
    j_lipographic_jokr= {order = 3,  unlocked = true, discovered = true, blueprint_compat = true, eternal_compat = true, rarity = 2, cost = 5, name = "Lipographic Jokr", pos = {x=2,y=16}, set = "Joker", config = {extra = {mult = 10, sub = 5}}},
    j_oops_1s=          {order = 4,  unlocked = true, discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 1, cost = 4, name = "Oops! All 1s", pos = {x=3,y=16}, set = "Joker", effect = "", config = {}, unlock_condition = {type = 'chip_score', chips = 10000}},
    j_safari=           {order = 5,  unlocked = true, discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 3, cost = 7, name = "Safari Joker", pos = {x=4,y=16}, set = "Joker", effect = "", config = {}, unlock_condition = {type = 'modify_deck', extra = {count = 3, enhancement = 'Wild Card', e_key = 'm_wild'}}},
    j_copycat=          {order = 6,  unlocked = true, discovered = true, blueprint_compat = true, eternal_compat = true, rarity = 3, cost = 10, name = "Copycat", pos = {x=0,y=16}, set = "Joker", effect = "Copycat", cost_mult = 1.0, config = {},unlock_condition = {type = 'win_custom'}},
    j_pessimist=        {order = 7,  unlocked = true, discovered = true, blueprint_compat = false, eternal_compat = false, rarity = 3, cost = 10, name = "Pessimist", pos = {x=6,y=16}, set = "Joker", effect = "", config = {extra = 2}, unlock_condition = {type = 'win_custom'}},
    j_prosopagnosia=    {order = 8,  unlocked = true,  discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 1, cost = 5, name = "Prosopagnosia", pos = {x=7,y=16}, set = "Joker", effect = "All face cards", cost_mult = 1.0, config = {}},
    j_double_vision=    {order = 9,  unlocked = true,  discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 3, cost = 10, name = "Double Vision", pos = {x=8,y=16}, set = "Joker", effect = "", cost_mult = 1.0, config = {}},
    j_scouter=          {order = 10,  unlocked = true,  discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 1, cost = 4, name = "Scouter Joker", pos = {x=9,y=16}, set = "Joker", effect = "", cost_mult = 1.0, config = {extra = 0}},
    j_zeno=             {order = 11,  unlocked = true,  discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 3, cost = 8, name = "Zeno's Joker", pos = {x = 0, y = 17}, set = 'Joker', config = {}},
    j_one_more=         {order = 12,  unlocked = true,  discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 1, cost = 8, name = "One More Time!", pos = {x = 1, y = 17}, set = 'Joker', config = {extra = {score=0, old_chips=0}}},
    j_collector=        {order = 13,  unlocked = true,  discovered = true, blueprint_compat = true, eternal_compat = true, rarity = 3, cost = 7, name = "The Collector", pos = {x=2,y=17}, set = "Joker", effect = "Card Buff", cost_mult = 1.0, config = {extra = 2}},
    j_buckleswasher=    {order = 14,  unlocked = true,  discovered = true, blueprint_compat = true, eternal_compat = true, rarity = 2, cost = 4, name = "Buckleswasher", pos = {x=3,y=17}, set = "Joker", effect = "Set Mult", cost_mult = 1.0, config = {mult = 1},unlock_condition = {type = 'c_jokers_sold', extra = 20}},
    j_hatter=           {order = 15,  unlocked = true,  discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 2, cost = 7, name = "Mad Hatter",set = "Joker", config = {},  pos = {x=4,y=17}},
    j_greener_pastures= {order = 16,  unlocked = true,  discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 2, cost = 8, name = "Greener Pastures",set = "Joker", config = {extra = nil},  pos = {x=5,y=17}},
    j_special_snowflake={order = 17,  unlocked = true,  discovered = true, blueprint_compat = true, eternal_compat = true, rarity = 2, cost = 6, name = "Special Snowflake",set = "Joker", config = {extra = 0.2},  pos = {x=6,y=17}, soul_pos={x=7, y=17}},
  }

  -- Blacklist individual Jokers here
  addJokersToPools(jokers)
  -- Add sprites
  SMODS.Sprite:new("Joker", SMODS.findModByID("JellyJokers").path, "Jokers_JellyMod.png", 71, 95, "asset_atli")
      :register()

end

local calculate_jokerref = Card.calculate_joker
function Card.calculate_joker(self, context)
  local calc_ref = calculate_jokerref(self, context)

  if self.ability.set == "Joker" and not self.debuff then
      if self.ability.name == "Blueprint" then
          local other_joker = nil
          for i = 1, #G.jokers.cards do
              if G.jokers.cards[i] == self then
                  other_joker = G.jokers.cards[i + 1]
              end
          end
          if other_joker and other_joker ~= self then
              context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
              context.blueprint_card = context.blueprint_card or self
              if context.blueprint > #G.jokers.cards + 1 then
                  return
              end
              local other_joker_ret = other_joker:calculate_joker(context)
              if other_joker_ret then
                  other_joker_ret.card = context.blueprint_card or self
                  other_joker_ret.colour = G.C.BLUE
                  return other_joker_ret
              end
          end
      end
      if self.ability.name == "Brainstorm" then
          local other_joker = G.jokers.cards[1]
          if other_joker and other_joker ~= self then
              context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
              context.blueprint_card = context.blueprint_card or self
              if context.blueprint > #G.jokers.cards + 1 then
                  return
              end
              local other_joker_ret = other_joker:calculate_joker(context)
              if other_joker_ret then
                  other_joker_ret.card = context.blueprint_card or self
                  other_joker_ret.colour = G.C.RED
                  return other_joker_ret
              end
          end
      end
      if self.ability.name == "Tarlton" then
        local other_joker = nil
        local final_ret = nil
        for i=1,#G.jokers.cards do
            other_joker = G.jokers.cards[i]
            if other_joker and other_joker ~= self and other_joker.config.center.blueprint_compat then
                context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
                context.blueprint_card = context.blueprint_card or self
                if context.blueprint > #G.jokers.cards + 1 then return end
                local other_joker_ret = other_joker:calculate_joker(context)
                if other_joker_ret then
                    print("new joker ret: " .. other_joker.ability.name)
                end
                if final_ret == nil and other_joker_ret ~= nil then 
                    print("new return value: " .. other_joker.ability.name)
                    final_ret = other_joker_ret
                    final_ret.card = context.blueprint_card or self
                    final_ret.colour = G.C.RED
                elseif other_joker_ret then
                    print("beginning fusion:")
                    for k, val in pairs(other_joker_ret) do
                        print("current key: " .. k )
                        print("current value: " .. tostring(val))
                        if not final_ret[k] then
                            final_ret[k] = val
                        end
                        if final_ret[k] and k == "x_mult" then 
                            final_ret[k] = final_ret[k] * val
                        end
                        if final_ret[k] and k == "mult" then
                            final_ret[k] = final_ret[k] + val 
                        end
                        if final_ret[k] and k == "chips" then 
                            final_ret[k] = final_ret[k] + val 
                        end
                        if final_ret[k] and k == "dollars" then 
                            final_ret[k] = final_ret[k] + val 
                        end
                        if final_ret[k] and k == "message" then
                            final_ret[k] = final_ret[k] .. " " .. val
                        end
                        print("new value: " .. tostring(final_ret[k]))
                    end
                end
            end
        end
        if final_ret then
            return final_ret
        end
    end

    if self.ability.name == "Copycat" then
        local other_joker = nil
        local joker_name = G.GAME.current_round.copycat_joker_name
        for i= 1, #G.jokers.cards do
            if G.jokers.cards[i].ability.name == joker_name then other_joker = G.jokers.cards[i] end
        end
        if other_joker and other_joker ~= self and other_joker.config.center.blueprint_compat then
            context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
            context.blueprint_card = context.blueprint_card or self
            if context.blueprint > #G.jokers.cards + 1 then return end
            local other_joker_ret = other_joker:calculate_joker(context)
            if other_joker_ret then 
                other_joker_ret.card = context.blueprint_card or self
                other_joker_ret.colour = G.C.RED
                return other_joker_ret
            end
        end
    end

      if context.open_booster then
      elseif context.buying_card then
      elseif context.selling_self then

        if self.ability.name == 'One More Time!' and not context.blueprint and G.GAME.blind:get_type() then
          G.E_MANAGER:add_event(Event({
              trigger = 'after',delay = 0.4,
              func = (function()  update_hand_text({delay = 0, immediate = true}, {mult = 0, chips = 0, chip_total = math.floor(self.ability.extra.score), level = '', handname = ''});play_sound('button', 0.9, 0.6);return true end)
            }))               
          if self.ability.extra.score > 0 then 
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
            ease_to = G.GAME.chips + math.floor(self.ability.extra.score),
            delay =  0.5,
            func = (function(t) return math.floor(t) end)
          }))
          percent = 0.8
          percent_delta = 0.3
          for i=1, #G.jokers.cards do
              --calculate the joker after hand played effects
              local effects = eval_card(G.jokers.cards[i], {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, after = true})
              if effects.jokers then
                  card_eval_status_text(G.jokers.cards[i], 'jokers', nil, percent, nil, effects.jokers)
                  percent = percent + percent_delta
              end
          end
          G.E_MANAGER:add_event(Event({
              trigger = 'ease',
              blocking = true,
              ref_table = G.GAME.current_round.current_hand,
              ref_value = 'chip_total',
              ease_to = 0,
              delay =  0.5,
              func = (function(t) return math.floor(t) end)
          }))

          return {
              message = "+ " .. number_format(self.ability.score),
              colour = G.C.CHIPS
          } 
      end

      if self.ability.name == 'Pessimist' and not context.blueprint then
        local temp_pool = {}
        for k, v in pairs(G.jokers.cards) do
            if v.ability.set == 'Joker' and (not v.edition) and v ~= self then
                table.insert(temp_pool, v)
            end
        end
        local eligible_card = pseudorandom_element(temp_pool, pseudoseed('Pessimist'))
        local edition = {negative = true}
        eligible_card:set_edition(edition, true)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - self.ability.extra
        ease_hands_played(-self.ability.extra)

      end

      elseif context.selling_card then
      elseif context.reroll_shop then
      elseif context.ending_shop then
      elseif context.skip_blind then
      elseif context.skipping_booster then
      elseif context.playing_card_added and not self.getting_sliced then
      elseif context.first_hand_drawn then
      elseif context.setting_blind and not self.getting_sliced and not self.gettin_rerolled then
        if self.ability.name == 'Greener Pastures' and not (context.blueprint_card or self).getting_sliced then
          local is_dissolved = false
          for i=1,#G.jokers.cards do
              if G.jokers.cards[i].ability.name == self.ability.extra and G.jokers.cards[i].edition.negative then
                  G.jokers.cards[i]:start_dissolve()
                  is_dissolved = true
                  break
              end
          end
          if not is_dissolved and self.ability.extra then 
              self:start_dissolve()
              return
          end
          G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
              play_sound('timpani')
              local card = create_card('Joker', G.jokers, false, nil, nil, nil, nil, 'green')
              card.states.click.can = false
              card:set_edition({negative = true})
              self.ability.extra = card.ability.name
              card:add_to_deck()
              G.jokers:emplace(card)
              return true end }))
          delay(0.6)
        end
      elseif context.destroying_card then
      elseif context.cards_destroyed then
      elseif context.remove_playing_cards then
      elseif context.using_consumeable then
      elseif context.debuffed_hand then 
      elseif context.pre_discard then
      elseif context.discard then
      elseif context.end_of_round then
        if context.individual then
          if self.ability.name == 'Scouter Joker' then self.ability.extra = 0 end
        elseif not context.blueprint then
          if self.ability.name == "Zeno's Joker" and #G.deck.cards / #G.playing_cards < 0.5 and #G.deck.cards > 0 then
            local card = pseudorandom_element(G.playing_cards, pseudoseed("Zeno's Joker"))
            card:remove()
            
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                            local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'sixth')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                        return true
                    end)}))
                card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
            end

            return {
                message = localize('k_zeno'),
                colour = G.C.RED
            }
          end
        end
      elseif context.repetition then
      elseif context.other_joker then
      elseif context.adding_to_deck then
      elseif context.individual then
        if self.ability.name == 'Lipographic Jokr' then
          local curr_mult = self.ability.extra.mult
          local mult_sub = self.ability.extra.sub
          print("acting on: " .. tostring(context.other_card:get_id()))
          if context.other_card:get_id() == 14 then curr_mult = curr_mult - mult_sub end
          if context.other_card:get_id() == 3 then curr_mult = curr_mult - mult_sub*2 end
          if context.other_card:get_id() == 5 then curr_mult = curr_mult - mult_sub end
          if context.other_card:get_id() == 7 then curr_mult = curr_mult - mult_sub*2 end
          if context.other_card:get_id() == 8 then curr_mult = curr_mult - mult_sub end
          if context.other_card:get_id() == 9 then curr_mult = curr_mult - mult_sub end
          if context.other_card:get_id() == 10 then curr_mult = curr_mult - mult_sub end
          if context.other_card:get_id() == 12 then curr_mult = curr_mult - mult_sub*2 end
          if context.other_card:is_suit("Spades") then curr_mult = curr_mult - mult_sub end
          if context.other_card:is_suit("Hearts") then curr_mult = curr_mult - mult_sub end
          
          if context.other_card.config.center == G.P_CENTERS.m_steel then curr_mult = curr_mult - mult_sub*2 end
          if context.other_card.config.center == G.P_CENTERS.m_stone then curr_mult = self.ability.extra.mult - mult_sub end
          if context.other_card.config.center == G.P_CENTERS.e_polychrome then curr_mult = curr_mult - mult_sub end
          if context.other_card.config.center == G.P_CENTERS.e_negative then curr_mult = curr_mult - mult_sub end
          if context.other_card.seal == 'Gold' then curr_mult = curr_mult - mult_sub end
          if context.other_card.seal == 'Red' then curr_mult = curr_mult - mult_sub*2 end
          if context.other_card.seal == 'Blue' then curr_mult = curr_mult - mult_sub*2 end
          if context.other_card.seal == 'Purple' then curr_mult = curr_mult - mult_sub*2 end
          print(curr_mult)


          return {
              mult = math.max(0, curr_mult),
              card = self
          }
        end
      else
          if context.cardarea == G.jokers then
            if context.before then
              if self.ability.name == 'Mad Hatter' and not context.blueprint then
                local enhanced = {}
                local viable_cards = {}
                for k, v in ipairs(context.full_hand) do
                    if not v.debuff then
                        viable_cards[#viable_cards+1] = v
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                v:juice_up()
                                return true
                            end
                        })) 
                    end
                    if v.config.center ~= G.P_CENTERS.c_base and not v.debuff then
                        enhanced[#enhanced+1] = {enhancement = v.config.center}
                        v:set_ability(G.P_CENTERS.c_base, nil, true)
                    end
                    if v.edition and not v.debuff then
                        enhanced[#enhanced+1] = {edition = v.edition}
                        v:set_edition(nil, true, nil)
                    end
                    if v.seal and not v.debuff then
                        enhanced[#enhanced+1] = {seal = v.seal}
                        v:set_seal(nil, nil, true)
                    end
                    
                end

                if #enhanced > 0 then 
                    for i=1,#enhanced do
                        local enhancement = enhanced[i]
                        local card = pseudorandom_element(viable_cards, pseudoseed('Mad Hatter'))
                        while (enhancement.enhancement and card.config.center ~= G.P_CENTERS.c_base) or (enhancement.edition and card.edition) or (enhancement.seal and card.seal) do
                            card = pseudorandom_element(viable_cards, pseudoseed('Mad Hatter'))
                        end
                        if enhancement.enhancement then
                            card:set_ability(enhancement.enhancement, nil, true)
                        end
                        if enhancement.seal then
                            card:set_seal(enhancement.seal, nil, true)
                        end
                        if enhancement.edition then
                            card:set_edition(enhancement.edition, true, nil)
                        end
                    end
                    return {
                        message = localize("k_hatter"),
                        card = self
                    }
                end
              end
            elseif context.after then
              if self.ability.name == 'One More Time!' and not context.blueprint then
                return {
                    message = tostring(number_format(self.ability.extra.score)),
                    colour = G.C.CHIPS
                }
              end
            else
              if self.ability.name == 'Special Snowflake' and self.ability.unique_tally > 0 then
                return {
                    message = localize{type='variable',key='a_xmult',vars={1 + self.ability.extra*self.ability.unique_tally}},
                    Xmult_mod = 1 + self.ability.extra*self.ability.unique_tally, 
                    colour = G.C.MULT
                }
              end
              if self.ability.name == 'The Collector' and self.ability.edition_tally > 0 then
                  return {
                      message = localize{type='variable',key='a_xmult',vars={1 + self.ability.extra*self.ability.edition_tally}},
                      Xmult_mod = 1 + self.ability.extra*self.ability.edition_tally, 
                      colour = G.C.MULT
                  }
              end
              if self.ability.name == 'Buckleswasher' and self.ability.mult > 0 then
                return {
                    message = localize{type='variable',key='a_mult',vars={self.ability.mult}},
                    mult_mod = self.ability.mult
                }
              end
            end
          end
      end
  end

  return calc_ref
end
--- the good shit ---

-- Init variables
local init_game_objectobjref = Game.init_game_object;
function Game.init_game_object(self)
  local gameObj = init_game_objectobjref(self)

  gameObj.extra_gacha_pulls = 0
  gameObj.used_rkey = false

  return gameObj
end

-- UIBox garbage / Copied from LushMod. Thanks luscious!
local generate_UIBox_ability_tableref = Card.generate_UIBox_ability_table
function Card.generate_UIBox_ability_table(self)
  local card_type, hide_desc = self.ability.set or "None", nil
  local loc_vars = nil
  local main_start, main_end = nil, nil
  local no_badge = nil

  if self.config.center.unlocked == false and not self.bypass_lock then    -- For everyting that is locked
  elseif card_type == 'Undiscovered' and not self.bypass_discovery_ui then -- Any Joker or tarot/planet/voucher that is not yet discovered
  elseif self.debuff then
  elseif card_type == 'Default' or card_type == 'Enhanced' then
  elseif self.ability.set == 'Joker' then
      local customJoker = false

      if self.ability.name == 'Polydactyly' then
        customJoker = true
      elseif self.ability.name == 'Special Snowflake' then
        customJoker = true 
        loc_vars = {self.ability.extra, 1 + self.ability.extra*(self.ability.unique_tally or 0)}
      elseif self.ability.name == 'The Collector' then
        customJoker = true 
        loc_vars = {self.ability.extra, 1 + self.ability.extra*(self.ability.edition_tally or 0)}
      elseif self.ability.name == 'Buckleswasher' then 
        customJoker = true 
        loc_vars = {self.ability.mult}
      elseif self.ability.name == 'Copycat' then
        customJoker = true 
        if G.GAME.current_round.copycat_joker_name then loc_vars = {localize{type = 'name_text', key = G.GAME.current_round.copycat_joker_key, set = 'Joker'}} else loc_vars = {"None"}end
      elseif self.ability.name == 'Lipographic Jokr' then 
        customJoker = true 
        loc_vars = {self.ability.extra.mult, self.ability.extra.sub}
      elseif self.ability.name == 'One More Time!' then 
        customJoker = true 
        loc_vars = {number_format(self.ability.extra.score)}
      elseif self.ability.name == 'Pessimist' then 
        customJoker = true 
        loc_vars = {self.ability.extra}    
      elseif self.ability.name == 'Scouter Joker' then 
        loc_vars = {number_format(self.ability.extra)}
        customJoker = true
      end

      if customJoker then
          local badges = {}
          if (card_type ~= 'Locked' and card_type ~= 'Undiscovered' and card_type ~= 'Default') or self.debuff then
              badges.card_type = card_type
          end
          if self.ability.set == 'Joker' and self.bypass_discovery_ui and (not no_badge) then
              badges.force_rarity = true
          end
          if self.edition then
              if self.edition.type == 'negative' and self.ability.consumeable then
                  badges[#badges + 1] = 'negative_consumable'
              else
                  badges[#badges + 1] = (self.edition.type == 'holo' and 'holographic' or self.edition.type)
              end
          end
          if self.seal then
              badges[#badges + 1] = string.lower(self.seal) .. '_seal'
          end
          if self.ability.eternal then
              badges[#badges + 1] = 'eternal'
          end
          if self.pinned then
              badges[#badges + 1] = 'pinned_left'
          end

          if self.sticker then
              loc_vars = loc_vars or {};
              loc_vars.sticker = self.sticker
          end

          local center = self.config.center
          return generate_card_ui(center, nil, loc_vars, card_type, badges, hide_desc, main_start, main_end)
      end
  end
  return generate_UIBox_ability_tableref(self)
end

-- Card updates
local card_updateref = Card.update
function Card.update(self, dt)
  if G.STAGE == G.STAGES.RUN then
    if self.ability.name == 'Buckleswasher' then
      local sell_cost = 0
      for i = #G.jokers.cards,1,-1 do
          if G.jokers.cards[i] == self or (self.area and (self.area ~= G.jokers)) then break end
          sell_cost = sell_cost + G.jokers.cards[i].sell_cost
      end
      self.ability.mult = sell_cost
    end
    if self.ability.name == "Special Snowflake" then 
      self.ability.unique_tally = 0
      local unique_cards = {}
      for k, v in pairs(G.playing_cards) do
          if v.config.center ~= G.P_CENTERS.c_base or v.edition or v.seal then
              unique = true
              for i=1,#unique_cards do
                  candidate_card = unique_cards[i]
                  if candidate_card.config.center == v.config.center and candidate_card.seal == v.seal and candidate_card.edition == v.edition then
                      unique = false
                      break
                  end
              end
              if unique then unique_cards[#unique_cards + 1] = v end
          end
      end
      self.ability.unique_tally = #unique_cards
    end
    if self.ability.name == "The Collector" then 
      self.ability.edition_tally = 0
      for k, v in pairs(G.jokers.cards) do
          if v.ability.set == 'Joker' and (v.edition) then
              self.ability.edition_tally = self.ability.edition_tally + 1
          end
      end
    end
  else
    if self.ability.name == 'Reverse Temperance' then
      self.ability.money = 0
    end
  end
  card_updateref(self, dt)
end

-- Polydactyly
local add_to_deckref = Card.add_to_deck
function Card.add_to_deck(self, from_debuff)
  if not self.added_to_deck then
    if self.ability.name == 'Oops! All 1s' then
      for k, v in pairs(G.GAME.probabilities) do 
          G.GAME.probabilities[k] = v/2
      end
    end
  end
  add_to_deckref(self, from_debuff)
end

local remove_from_deckref = Card.remove_from_deck
function Card.remove_from_deck(self, from_debuff)
  if self.added_to_deck then
      if self.ability.name == 'Oops! All 1s' then
        for k, v in pairs(G.GAME.probabilities) do 
            G.GAME.probabilities[k] = v*2
        end
      end
      if self.ability.name == 'Greener Pastures' then
        for i=1,#G.jokers.cards do
            if G.jokers.cards[i].ability.name == self.ability.extra and G.jokers.cards[i].edition.negative then
                G.jokers.cards[i]:start_dissolve()
                break
            end
        end
      end
  end
  remove_from_deckref(self, from_debuff)
end

local get_id_ref = Card.get_id
function Card.get_id(self)
    if next(find_joker("Double Vision")) then return 2 end
    return get_id_ref(self)
end

local is_suit_ref = Card.is_suit
function Card.is_suit(self, suit, bypass_debuff, flush_calc)
  if flush_calc then
      if (next(find_joker('Safari Joker')))and not self.debuff then
          return true
      end
  else
      if next(find_joker('Safari Joker')) then
          return true
      end
  end
  return is_suit_ref(self, suit, bypass_debuff, flush_calc)
end

local is_face_ref = Card.is_face
function Card.is_face(self, from_boss)
  if (next(find_joker("Prosopagnosia"))) then return end
  return is_face_ref(self, from_boss)
end

function addJokersToPools(jokerTable)
  -- Add Jokers to center
  for k, v in pairsByOrder(jokerTable) do
      v.key = k
      v.order = table_length(G.P_CENTER_POOLS['Joker']) + v.order
      G.P_CENTERS[k] = v
      table.insert(G.P_CENTER_POOLS['Joker'], v)
      if v.rarity and v.set == 'Joker' and not v.demo then
          table.insert(G.P_JOKER_RARITY_POOLS[v.rarity], v)
      end
  end

  table.sort(G.P_CENTER_POOLS["Joker"], function(a, b)
      return a.order < b.order
  end)
end

function reset_copycat_card()
  G.GAME.current_round.copycat_joker_name = 'None'
  G.GAME.current_round.copycat_joker_key = nil
  local compat_jokers = {}
  for i = 1, #G.jokers.cards do
      if G.jokers.cards[i].config.center.blueprint_compat and G.jokers.cards[i].ability.name ~= "Copycat" then compat_jokers[#compat_jokers+1] = G.jokers.cards[i] end
  end
  if #compat_jokers < 1 then return end
  
  local other_joker = pseudorandom_element(compat_jokers, pseudoseed('cop'..G.GAME.round_resets.ante))
  G.GAME.current_round.copycat_joker_name = other_joker.ability.name
  G.GAME.current_round.copycat_joker_key = other_joker.config.center.key
end

local reset_idol_card_ref = reset_idol_card
function reset_idol_card()
    reset_idol_card_ref()
    reset_copycat_card()
end

----------------------------------------------
------------MOD CODE END----------------------
