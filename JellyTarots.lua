--- STEAMODDED HEADER
--- MOD_NAME: Jelly Tarots
--- MOD_ID: JellyTarots
--- MOD_AUTHOR: [JamesTheJellyfish]
--- MOD_DESCRIPTION: Adds reverse tarot cards to the game.

----------------------------------------------
------------MOD CODE -------------------------


function SMODS.INIT.JellyTarots()
    sendDebugMessage("Loaded JellyTarots~")
    local tarot_localization = {
        c_empress_rev = {
            name = "The Reverse Empress",
                text = {
                   "Enhances {C:attention}#1#",
                   "selected cards to",
                   "{C:attention}#2#s",
       },
       },
       c_star_rev = {
            name = "The Reverse Star",
                text = {
                   "Converts up to",
                   "{C:attention}#1#{} selected {V:1}#2#{} cards",
                   "to a random suit that isn't {V:1}#2#{}",
       },
       },
       c_moon_rev = {
            name = "The Reverse Moon",
                text = {
                   "Converts up to",
                   "{C:attention}#1#{} selected {V:1}#2#{} cards",
                   "to a random suit that isn't {V:1}#2#{}",
       },
       },
       c_sun_rev = {
            name = "The Reverse Sun",
                text = {
                   "Converts up to",
                   "{C:attention}#1#{} selected {V:1}#2#{} cards",
                   "to a random suit that isn't {V:1}#2#{}",
       },
       },
       c_world_rev = {
            name = "The Reverse World",
                text = {
                   "Converts up to",
                   "{C:attention}#1#{} selected {V:1}#2#{} cards",
                   "to a random suit that isn't {V:1}#2#{}",
       },
       },
       c_judgement_rev = {
            name = "Reverse Judgement",
                text = {
                   "Replaces a random {C:attention}Joker{}",
                   "with one of {C:green}equal{} or {C:red}greater{} rarity",
                   "{C:inactive}(keeps edition of original)",
       },
       },
       c_death_rev = {
            name = "Reverse Death",
                text = {
                   "Select {C:attention}#1#{} cards,",
                   "the {C:attention}Enhancements{},  {C:attention}Seals{}, and {C:attention}Editions{}",
                   "are copied from the {C:attention}left{} card to the {C:attention}right{} card",
                   "{C:inactive}(Drag to rearrange)",
       },
       },
       c_wheel_of_fortune_rev = {
            name = "The Reverse Wheel of Fortune",
                text = {
                   "{C:green}#1# in #2#{} chance to add",
                   "{C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or",
                   "{C:dark_edition}Polychrome{} edition",
                   "to the selected card",
       },
       },
       c_heirophant_rev = {
            name = "The Reverse Hierophant",
                text = {
                   "Enhances {C:attention}#1#",
                   "selected cards to",
                   "{C:attention}#2#s",
       },
       },
       c_fool_rev = {
            name = "The Reverse Fool",
                text = {
                   "{C:green}#2# in #3#{} chance to do nothing.",
                   "Otherwise, create a {C:dark_edition}Negative{} copy",
                   "of the last {C:tarot}Tarot{} or {C:planet}Planet{} card",
                   "used during this run",
                   "{s:0.8,C:tarot}The Reverse Fool{s:0.8} excluded",
       },
       },
       c_high_priestess_rev = {
            name = "The Reverse High Priestess",
                text = {
                   "{C:green}upgrades{} {C:attention}#1#",
                   "random poker hands,",
                   "but {C:red}downgrades{} {C:attention}#2#{}",
                   "{C:inactive}(min level 1){}",
       },
       },
       c_chariot_rev = {
            name = "The Reverse Chariot",
                text = {
                   "Enhances {C:attention}#1#{} selected",
                   "card into a",
                   "{C:attention}#2#",
       },
       },
       c_lovers_rev = {
            name = "The Reverse Lovers",
                text = {
                   "Enhances {C:attention}#1#{} selected",
                   "card into a",
                   "{C:attention}#2#",
       },
       },
       c_hanged_man_rev = {
            name = "The Reverse Hanged Man",
                text = {
                   "Adds {C:attention}#1#{}",
                   "random cards to your hand",
                   "{C:inactive}(may be enhanced)"
       },
       },
       c_strength_rev = {
            name = "Reverse Strength",
                text = {
                   "Decreases rank of",
                   "up to {C:attention}#1#{} selected",
                   "cards by {C:attention}1",
       },
       },
       c_hermit_rev = {
            name = "The Reverse Hermit",
                text = {
                   "Halves money",
                   "and gives you a random {C:attention}Tag{}",
                   "{C:inactive}(Max of {C:money}$#1#{C:inactive})",
       },
       },
       c_devil_rev = {
            name = "The Reverse Devil",
                text = {
                   "Enhances {C:attention}#1#{} selected",
                   "card into a",
                   "{C:attention}#2#",
       },
       },
       c_magician_rev = {
            name = "The Reverse Magician",
                text = {
                   "Enhances {C:attention}#1#{} selected",
                   "card into a",
                   "{C:attention}#2#",
       },
       },
       c_emperor_rev = {
            name = "The Reverse Emperor",
                text = {
                   "Uses up to {C:attention}#1#",
                   "random {C:tarot}Tarot{} cards",
                   "{C:inactive}(targets will be selected randomly from hand)",
       },
       },
       c_temperance_rev = {
            name = "Reverse Temperance",
                text = {
                   "Gives {C:money}$#1#{}",
                   "for each {C:attention}consumeable{}",
                   "you have {C:inactive}(Max of {C:money}$#2#{C:inactive})",
                   "{C:inactive}(Currently {C:money}$#3#{C:inactive})",
       },
       },
       c_tower_rev = {
            name = "The Reverse Tower",
                text = {
                   "Enhances {C:attention}#1#{} selected",
                   "card into a",
                   "{C:attention}#2#",
       },
       },
       c_justice_rev = {
            name = "Reverse Justice",
                text = {
                   "Enhances {C:attention}#1#{} selected",
                   "card into a",
                   "{C:attention}#2#",
       },
       },
    }
    local enhance_localization = {
        m_coal = {
            name = "Coal Card",
                text = {
                   "{C:chips}#1#{} Chips and {C:mult}#2#{} Mult",
                   "Upgrades by {C:chips}+#3#{} Chips and",
                   "{C:mult}+#4#{} mult each time scored",
                   "no rank or suit",
       },
       },
       m_blank = {
            name = "Blank Card",
                text = {
                   "Copies the {C:attention}rank{} and {C:attention}suit{}",
                   "of the card to its right",
       },
       },
       m_wooden = {
            name = "Wooden Card",
                text = {
                   "{X:mult,C:white} X#1# {} Mult",
                   "{C:green}#2# in #3#{} chance to",
                   "not give any {C:mult}Mult{} or {C:chips}Chips{}",
                   "when scored."
       },
       },
       m_brass = {
            name = "Brass Card",
                text = {
                   "{X:chips,C:white} X#1# {} Chips",
                   "while this card",
                   "stays in hand",
       },
       },
       m_bonus_rev = {
            name = "Hand Bonus Card",
                text = {
                   "{C:chips}+#1#{}",
                   "while this card",
                   "stays in hand",
       },
       },
       m_mult_rev = {
            name = "Hand Mult Card",
                text = {
                   "{C:mult}+#1#{} Mult",
                   "while this card",
                   "stays in hand",
       },
       },
       m_fools_gold = {
            name = "Fool's Gold Card",
                text = {
                   "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
                   "while this card",
                   "stays in hand, but",
                   "{C:money}$#3#{} if this",
                   "card is held in hand",
                   "at end of round",
       },
       },
       m_unlucky = {
            name = "Unlucky Card",
                text = {
                   "{X:mult,C:white} X#6# {} Mult",
                   "{C:green}#1# in #3#{} chance",
                   "for {C:mult}#2#{} Mult",
                   "{C:green}#1# in #5#{} chance",
                   "to lose {C:money}$#4#",
       },
       },
    }

    G.localization.misc.v_dictionary.a_xchips = "X#1# Chips"
    init_localization()
    updateLocalizationJelly(tarot_localization, "Tarot")
    updateLocalizationJelly(enhance_localization, "Enhanced")

    local tarots = {
        c_world_rev=        {order = 23,    discovered = true, cost = 3, consumeable = true, name = "The Reverse World", pos = {x=8,y=5}, set = "Tarot", effect = "Suit Conversion", cost_mult = 1.0, config = {no_suit = 'Spades', max_highlighted = 3}},
        c_judgement_rev=    {order = 24,    discovered = true, cost = 3, consumeable = true, name = "Reverse Judgement", pos = {x=9,y=5}, set = "Tarot", effect = "Random Joker", cost_mult = 1.0, config = {}},
        c_sun_rev=          {order = 25,    discovered = true, cost = 3, consumeable = true, name = "The Reverse Sun", pos = {x=0,y=6}, set = "Tarot", effect = "Suit Conversion", cost_mult = 1.0, config = {no_suit = 'Hearts', max_highlighted = 3}},
        c_moon_rev=         {order = 26,    discovered = true, cost = 3, consumeable = true, name = "The Reverse Moon", pos = {x=1,y=6}, set = "Tarot", effect = "Suit Conversion", cost_mult = 1.0, config = {no_suit = 'Clubs', max_highlighted = 3}},
        c_star_rev=         {order = 27,    discovered = true, cost = 3, consumeable = true, name = "The Reverse Star", pos = {x=2,y=6}, set = "Tarot", effect = "Suit Conversion", cost_mult = 1.0, config = {no_suit = 'Diamonds', max_highlighted = 3}},
        c_tower_rev=        {order = 28,    discovered = true, cost = 3, consumeable = true, name = "The Reverse Tower", pos = {x=3,y=6}, set = "Tarot", effect = "Enhance", cost_mult = 1.0, config = {mod_conv = 'm_coal', max_highlighted = 1}},
        c_devil_rev=        {order = 29,    discovered = true, cost = 3, consumeable = true, name = "The Reverse Devil", pos = {x=4,y=6}, set = "Tarot", effect = "Enhance", cost_mult = 1.0, config = {mod_conv = 'm_fools_gold', max_highlighted = 1}},
        c_temperance_rev=   {order = 30,    discovered = true, cost = 3, consumeable = true, name = "Reverse Temperance", pos = {x=5,y=6}, set = "Tarot", effect = "Consumable Payout", cost_mult = 1.0, config = {extra = 50, payout_mult = 5}},
        c_death_rev=        {order = 31,    discovered = true, cost = 3, consumeable = true, name = "Reverse Death", pos = {x=6,y=6}, set = "Tarot", effect = "Enhance", cost_mult = 1.0, config = {mod_conv='card', max_highlighted = 2}},
        c_hanged_man_rev=   {order = 32,    discovered = true, cost = 3, consumeable = true, name = "The Reverse Hanged Man", pos = {x=7,y=6}, set = "Tarot", effect = "Card Addition", cost_mult = 1.0, config = {extra = 2}},
        c_strength_rev=     {order = 33,    discovered = true, cost = 3, consumeable = true, name = "Reverse Strength", pos = {x=8,y=6}, set = "Tarot", effect = "Round Bonus", cost_mult = 1.0, config = {mod_conv = 'down_rank', max_highlighted = 2}},
        c_wheel_of_fortune_rev={order=34,   discovered = true, cost = 3, consumeable = true, name = "The Reverse Wheel of Fortune", pos = {x=9,y=6}, set = "Tarot", effect = "Round Bonus", cost_mult = 1.0, config = {extra = 4, max_highlighted = 1}},
        c_hermit_rev=       {order = 35,    discovered = true, cost = 3, consumeable = true, name = "The Reverse Hermit", pos = {x=0,y=7}, set = "Tarot", effect = "Dollar Halver", cost_mult = 1.0, config = {extra = 20}},
        c_justice_rev=      {order = 36,    discovered = true, cost = 3, consumeable = true, name = "Reverse Justice", pos = {x=1,y=7}, set = "Tarot", effect = "Enhance", cost_mult = 1.0, config = {mod_conv = 'm_wooden', max_highlighted = 1}},
        c_chariot_rev=      {order = 37,    discovered = true, cost = 3, consumeable = true, name = "The Reverse Chariot", pos = {x=2,y=7}, set = "Tarot", effect = "Enhance", cost_mult = 1.0, config = {mod_conv = 'm_brass', max_highlighted = 1}},
        c_lovers_rev=       {order = 38,    discovered = true, cost = 3, consumeable = true, name = "The Reverse Lovers", pos = {x=3,y=7}, set = "Tarot", effect = "Enhance", cost_mult = 1.0, config = {mod_conv = 'm_blank', max_highlighted = 1}},
        c_heirophant_rev=   {order = 39,    discovered = true, cost = 3, consumeable = true, name = "The Reverse Hierophant", pos = {x=4,y=7}, set = "Tarot", effect = "Enhance", cost_mult = 1.0, config = {mod_conv = 'm_bonus_rev', max_highlighted = 2}},
        c_emperor_rev=      {order = 40,    discovered = true, cost = 3, consumeable = true, name = "The Reverse Emperor", pos = {x=5,y=7}, set = "Tarot", effect = "Round Bonus", cost_mult = 1.0, config = {tarots = 3}},
        c_empress_rev=      {order = 41,    discovered = true, cost = 3, consumeable = true, name = "The Reverse Empress", pos = {x=6,y=7}, set = "Tarot", effect = "Enhance", cost_mult = 1.0, config = {mod_conv = 'm_mult_rev', max_highlighted = 2}},
        c_high_priestess_rev={order =42,    discovered = true, cost = 3, consumeable = true, name = "The Reverse High Priestess", pos = {x=7,y=7}, set = "Tarot", effect = "Round Bonus", cost_mult = 1.0, config = {planets = 3, downgrade = 1}},
        c_magician_rev=     {order = 43,    discovered = true, cost = 3, consumeable = true, name = "The Reverse Magician", pos = {x=8,y=7}, set = "Tarot", effect = "Enhance", cost_mult = 1.0, config = {mod_conv = 'm_unlucky', max_highlighted = 1}},
        c_fool_rev=         {order = 44,    discovered = true, cost = 3, consumeable = true, name = "The Reverse Fool", pos = {x=9,y=7}, set = "Tarot", effect = "Disable Blind Effect", cost_mult = 1.0, config = {}},       
    }

    local enhancements = {
        m_bonus_rev={max = 500, order = 10,name = "Hand Bonus", set = "Enhanced", pos = {x=2, y=5}, effect = "Hand Bonus Card", label = "Hand Bonus Card", config = {extra = {h_bonus = 20}}},
        m_brass =   {max = 500, order = 10,name = "Brass Card", set = "Enhanced", pos = {x=4, y=5}, effect = "Brass Card", label = "Brass Card", config = {extra = {h_x_chips = 1.5}}},
        m_fools_gold={max = 500,order = 11,name = "Fool's Gold Card", set = "Enhanced", pos = {x=0, y=5}, effect = "Fool's Gold Card", label = "Fool's Gold Card", config = {extra = {h_bonus = 10}, h_mult = 4, h_dollars = -1}},
        m_mult_rev= {max = 500,order = 12,name = "Hand Mult", set = "Enhanced", pos = {x=3, y=5}, effect = "Hand Mult Card", label = "Hand Mult Card", config = {h_mult = 2}},
        m_blank =   {max = 500,order = 13,name = "Blank Card", set = "Enhanced", pos = {x=1, y=0}, effect = "Blank Card", label = "Blank Card", config = {}},
        m_unlucky = {max = 500, order = 14, name = "Unlucky Card", set = "Enhanced", pos = {x=5,y=5}, effect = "Unlucky Card", label = "Unlucky Card", config = {Xmult = 1.5, mult = -20, p_dollars = -15}},
        m_wooden =  {max = 500, order = 15, name = "Wooden Card", set = "Enhanced", pos = {x=1,y=5}, effect = "Wooden Card", label = "Wooden Card", config = {Xmult = 2, extra = 2}},
        m_coal   =  {max = 500, order = 16, name = "Coal Card", set = "Enhanced", pos = {x=6,y=5}, effect = "Coal Card", label = "Coal Card", config = {extra = {sub_chips = -10, sub_mult = -2, add_chips = 5, add_mult = 1, current = 0}}},
    }

    SMODS.Sprite:new("JellyTarots", SMODS.findModByID("JellyTarots").path, "Tarots_JellyMod.png", 71, 95, "asset_atli")
      :register()
    SMODS.Sprite:new("JellyEnhancers", SMODS.findModByID("JellyTarots").path, "Enhancers_JellyMod.png", 71, 95, "asset_atli")
    :register()
    addTarotsToPools(tarots, "JellyTarots")
    addEnhancementsToPools(enhancements, "JellyEnhancers")
end



local get_nominal_ref = Card.get_nominal
function Card.get_nominal(self, mod)
    if (self.ability.effect == 'Coal Card') then 
        mult = -1000 
        return self.base.nominal + self.base.suit_nominal*mult + (self.base.suit_nominal_original or 0)*0.0001*mult + self.base.face_nominal + 0.000001*self.unique_val
    end
    return get_nominal_ref(self, mod)
end


local generate_UIBox_ability_tableref = Card.generate_UIBox_ability_table
function Card.generate_UIBox_ability_table(self)
    local card_type, hide_desc = self.ability.set or "None", nil
    local loc_vars = nil
    local main_start, main_end = nil,nil
    local no_badge = nil
    if self.ability.effect == 'Coal Card' then
        loc_vars = { playing_card = not not self.base.colour, value = self.base.value, suit = self.base.suit, colour = self.base.colour,
                    nominal_chips = self.base.nominal > 0 and self.base.nominal or nil,
                    bonus_chips = (self.ability.bonus + (self.ability.perma_bonus or 0)) > 0 and (self.ability.bonus + (self.ability.perma_bonus or 0)) or nil,
                    current = self.ability.extra.current,
                }
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
    return generate_UIBox_ability_tableref(self)
end



function Card.get_blank_card_target(self)
    if self.area == G.play then
        for i=1,#G.play.cards do
            if G.play.cards[i] == self then
                local current_target = i < #G.play.cards and G.play.cards[i+1] or nil
                if current_target and current_target.ability.name == 'Blank Card' then return current_target:get_blank_card_target() end
                return current_target
            end
        end
    end
    if self.area == G.hand then
        local hand_list = self.highlighted and G.hand.highlighted or G.hand.cards
        for i=1, #hand_list do
            if hand_list[i] == self then
                return i < #hand_list and hand_list[i+1] or nil
            end
        end
    end
end

local get_id_ref = Card.get_id
function Card.get_id(self)
    if (self.ability.effect == 'Coal Card') and not self.vampired then
        return -math.random(100, 1000000)
    end
    if self.ability.effect == 'Blank Card' and not self.vampired then
        local target_card = self:get_blank_card_target()
        return target_card and target_card:get_id() or -math.random(100, 1000000)
    end
    return get_id_ref(self)
end


local get_chip_bonus_ref = Card.get_chip_bonus
function Card.get_chip_bonus(self)
    if self.ability.effect == 'Coal Card' and not self.debuff then
        return self.ability.extra.sub_chips + self.ability.extra.add_chips * self.ability.extra.current
    end
    if self.ability.effect == 'Blank Card' and not self.debuff then
        local target_card = self:get_blank_card_target()
        return target_card and (target_card.base.nominal + self.ability.bonus + (self.ability.perma_bonus or 0)) or (self.ability.bonus + (self.ability.perma_bonus or 0))
    end
    return get_chip_bonus_ref(self)
end

function Card.get_chip_h_bonus(self)
    if self.debuff then return 0 end
    if type(self.ability.extra) == "table" and self.ability.extra.h_bonus then
        return self.ability.extra.h_bonus end
    return 0
end

function Card.get_chip_h_x_chips(self)
    if self.debuff then return 0 end
    sendDebugMessage("checking xChips")
    if type(self.ability.extra) == "table" and self.ability.extra.h_x_chips then
        return self.ability.extra.h_x_chips end
    return 0
end

local get_chip_mult_ref = Card.get_chip_mult
function Card.get_chip_mult(self)
    if self.debuff then return 0 end
    if self.ability.set == 'Joker' then return 0 end
    if self.ability.effect == 'Coal Card' then
        return self.ability.extra.sub_mult + self.ability.extra.add_mult * self.ability.extra.current
    elseif self.ability.effect == "Unlucky Card" then
        if pseudorandom('unlucky_mult') < G.GAME.probabilities.normal/5 then
            self.lucky_trigger = true
            return self.ability.mult
        else
            return 0
        end
    else
        return get_chip_mult_ref(self)
    end
end

local get_end_of_round_effect_ref = Card.get_end_of_round_effect
function Card.get_end_of_round_effect(self, context)
    if self.debuff then return {} end
    local ret = get_end_of_round_effect_ref(self,context)
    if self.ability.h_dollars < 0 then
        ret.h_dollars = self.ability.h_dollars
        ret.card = self
    end
    return ret
end

local get_p_dollars_ref = Card.get_p_dollars
function Card.get_p_dollars(self)
    if self.debuff then return 0 end
    local ret = get_p_dollars_ref(self)
    if self.ability.effect == "Unlucky Card" then
        if pseudorandom('unlucky_money') < G.GAME.probabilities.normal/15 then
            self.lucky_trigger = true
            ret = ret + self.ability.p_dollars
        end
    end
    if ret < 0 then 
        G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + ret
        G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
    end
    return ret
end

function get_next_hermit_key(append)
    if G.FORCE_TAG then return G.FORCE_TAG end
    local _pool, _pool_key = get_current_pool('Tag', nil, nil, append)
    _pool_key = 'hermit_rev_tag'
    local _tag = pseudorandom_element(_pool, pseudoseed(_pool_key))
    local it = 1
    while _tag == 'UNAVAILABLE' do
        it = it + 1
        _tag = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..it))
    end

    return _tag
end



local use_consumeable_ref = Card.use_consumeable
function Card.use_consumeable(self, area, copier)
    local base_consumeable = true
    used_tarot = copier or self
    if self.ability.consumeable.mod_conv or self.ability.consumeable.suit_conv then
        if self.ability.name == 'Reverse Death' then
            base_consumeable = false
            local leftmost = G.hand.highlighted[1]
            for i=1, #G.hand.highlighted do if G.hand.highlighted[i].T.x < leftmost.T.x then leftmost = G.hand.highlighted[i] end end
            for i=1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                    if G.hand.highlighted[i] ~= leftmost then
                        G.hand.highlighted[i]:set_ability(leftmost.config.center, nil, true)
                        G.hand.highlighted[i]:set_seal(leftmost.seal, nil, true)
                        G.hand.highlighted[i]:set_edition(leftmost.edition, true, nil)
                    end
                    return true end }))
            end
        elseif self.ability.name == 'Reverse Strength' then
            base_consumeable = false
            for i=1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                    local card = G.hand.highlighted[i]
                    local suit_prefix = string.sub(card.base.suit, 1, 1)..'_'
                    local rank_suffix = card.base.id == 2 and 14 or math.max(card.base.id-1, 2)
                    if rank_suffix < 10 then rank_suffix = tostring(rank_suffix)
                    elseif rank_suffix == 10 then rank_suffix = 'T'
                    elseif rank_suffix == 11 then rank_suffix = 'J'
                    elseif rank_suffix == 12 then rank_suffix = 'Q'
                    elseif rank_suffix == 13 then rank_suffix = 'K'
                    elseif rank_suffix == 14 then rank_suffix = 'A'
                    end
                    card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
                return true end }))
            end      
        end
    end
    if self.ability.consumeable.no_suit then
        sendDebugMessage("no_suit!")
        base_consumeable = false
        local suits = {"Hearts", "Spades", "Clubs", "Diamonds"}
        local proper_suits = {}
        for i=1, #suits do
            if suits[i] ~= self.ability.consumeable.no_suit then proper_suits[#proper_suits + 1] = suits[i] end
        end
        for i=1, #G.hand.highlighted do
            local suit = pseudorandom_element(proper_suits, pseudoseed("rev_" .. self.ability.consumeable.no_suit))
            sendDebugMessage(tostring(self.ability.consumeable.no_suit))
            if G.hand.highlighted[i]:is_suit(self.ability.consumeable.no_suit, true) then 
                sendDebugMessage("Card was " .. tostring(self.ability.consumeable.no_suit))
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() G.hand.highlighted[i]:change_suit(suit);return true end })) 
            end
        end  
    end

    if self.ability.name == 'The Reverse High Priestess' then
        base_consumeable = false
        local levelled_hands = {}
        for k,v in pairs(G.GAME.hands) do
            if v.level > 1 and v.visible then levelled_hands[#levelled_hands + 1] = k end
        end
        local downgrade_hand = nil
        if #levelled_hands > 0 then
            downgrade_hand = pseudorandom_element(levelled_hands, pseudoseed('high_priest_rev_down'))
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(downgrade_hand, 'poker_hands'),chips = G.GAME.hands[downgrade_hand].chips, mult = G.GAME.hands[downgrade_hand].mult, level=G.GAME.hands[downgrade_hand].level})
            level_up_hand(used_tarot, downgrade_hand, nil, -1)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
        end
        local non_downgraded_hands = {}
        for k,v in pairs(G.GAME.hands) do
            if k ~= downgrade_hand and v.visible then non_downgraded_hands[#non_downgraded_hands + 1] = k end
        end
        for i=1,self.ability.consumeable.planets do
            local upgrade_hand = pseudorandom_element(non_downgraded_hands, pseudoseed('high_priest_rev_up'))
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(upgrade_hand, 'poker_hands'),chips = G.GAME.hands[upgrade_hand].chips, mult = G.GAME.hands[upgrade_hand].mult, level=G.GAME.hands[upgrade_hand].level})
            level_up_hand(used_tarot, upgrade_hand)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
        end
    end

    if self.ability.name == 'The Reverse Fool' then
        base_consumeable = false
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if pseudorandom(pseudoseed('rev_fool')) > G.GAME.probabilities.normal/2 then
                play_sound('timpani')
                local card = create_card('Tarot_Planet', G.consumeables, nil, nil, nil, nil, G.GAME.last_tarot_planet, 'fool')
                card:set_edition({negative = true}, true)
                card:add_to_deck()
                G.consumeables:emplace(card)
                used_tarot:juice_up(0.3, 0.5)
            end
            return true end }))
        delay(0.6)
    end

    if self.ability.name == 'The Reverse Hermit' then
        base_consumeable = false
        local visible_hands = {}
        for k,v in pairs(G.GAME.hands) do
            if v.visible then visible_hands[#visible_hands + 1] = k end
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            used_tarot:juice_up(0.3, 0.5)
            ease_dollars(-math.max(0,math.min(math.floor(G.GAME.dollars/2), self.ability.extra)), true)
            return true end }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            func = (function()
                G.orbital_hand = pseudorandom_element(visible_hands, pseudoseed("orbital_hand_hermit_rev"))
                add_tag(Tag(get_next_hermit_key()))
                G.orbital_hand = nil
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                return true
            end)
        }))
    end

    if self.ability.name == 'Reverse Temperance' then
        base_consumeable = false
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            used_tarot:juice_up(0.3, 0.5)
            ease_dollars(self.ability.money, true)
            return true end }))
        delay(0.6)
    end

    if self.ability.name == 'The Reverse Emperor' then
        base_consumeable = false
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_tarot_cards(self.ability.consumeable.tarots)
        return true end }))
    end

    if self.ability.name == 'Reverse Judgement' then
        base_consumeable = false
        local deletable_jokers = {}
        for k, v in pairs(G.jokers.cards) do
            if not v.ability.eternal then deletable_jokers[#deletable_jokers + 1] = v end
        end
        local chosen_joker = pseudorandom_element(deletable_jokers, pseudoseed('judgement_rev_choice'))
        local rarity = chosen_joker.config.center.rarity
        rarity = math.max(pseudorandom('rev_jud_rarity'), ((rarity == 3 and 0.99) or (rarity == 2 and 0.75) or 0.1))
        if chosen_joker.config.center.rarity == 4 then rarity = nil end
        
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            local card = create_card('Joker', G.jokers, chosen_joker.config.center.rarity == 4, rarity, nil, nil, nil, 'rev_jud')
            sendDebugMessage(tostring(chosen_joker.edition))
            if chosen_joker.edition ~= nil then card:set_edition(chosen_joker.edition, true) end
            chosen_joker:start_dissolve()
            card:add_to_deck()
            G.jokers:emplace(card)
            if self.ability.name == 'The Soul' then check_for_unlock{type = 'spawn_legendary'} end
            used_tarot:juice_up(0.3, 0.5)
            return true end }))
        delay(0.6)
        
    end
    if self.ability.name == "The Reverse Hanged Man" then
        base_consumeable = false
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            used_tarot:juice_up(0.3, 0.5)
            return true end }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function() 
                local cards = {}
                for i=1, self.ability.extra do
                    cards[i] = true
                    card = create_card((pseudorandom(pseudoseed('stdset')) > 0.6) and "Enhanced" or "Base", G.pack_cards, nil, nil, nil, true, nil, 'rev_han')
                    table.insert(G.playing_cards, card)
                    card.playing_card = G.playing_card
                
                    if G.hand then G.hand:emplace(card) end
                end
                playing_card_joker_effects(cards)
                return true end }))
    end
    if self.ability.name == 'The Reverse Wheel of Fortune' then
        base_consumeable = false
        if pseudorandom('wheel_of_fortune_rev') < G.GAME.probabilities.normal/self.ability.extra then 
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                local over = false
                local eligible_card = G.hand.highlighted[1]
                local edition = poll_edition('wheel_of_fortune', nil, true, true)
                eligible_card:set_edition(edition, true)
                check_for_unlock({type = 'have_edition'})
                used_tarot:juice_up(0.3, 0.5)
            return true end }))
        else
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                attention_text({
                    text = localize('k_nope_ex'),
                    scale = 1.3, 
                    hold = 1.4,
                    major = used_tarot,
                    backdrop_colour = G.C.SECONDARY_SET.Tarot,
                    align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                    offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                    silent = true
                    })
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                        play_sound('tarot2', 0.76, 0.4);return true end}))
                    play_sound('tarot2', 1, 0.4)
                    used_tarot:juice_up(0.3, 0.5)
            return true end }))
        end
        delay(0.6)
    end
    if base_consumeable then
        use_consumeable_ref(self, area, copier)
    else
        if not copier then set_consumeable_usage(self) end
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
    end
end


can_use_consumeable_ref = Card.can_use_consumeable
function Card.can_use_consumeable(self, any_state, skip_check)
    if not skip_check and ((G.play and #G.play.cards > 0) or
    (G.CONTROLLER.locked) or
    (G.GAME.STOP_USE and G.GAME.STOP_USE > 0))
    then  return false end
    if G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT or any_state then
        if self.ability.name == 'The Reverse Hermit' or self.ability.name == 'The Reverse High Priestess' or self.ability.name == 'Reverse Temperance' or self.ability.name == 'The Reverse Emperor' then
            return true
        end
        if self.ability.name == 'The Reverse Fool' and G.GAME.last_tarot_planet and G.GAME.last_tarot_planet ~= 'c_fool_rev' then return true end
        if self.ability.name == 'Reverse Judgement' then -- check that there is at least one deleteable joker
            for k, v in pairs(G.jokers.cards) do
                if v.ability.set == 'Joker' and not v.ability.eternal then 
                    return true
                end
            end
            return false
        end
        if G.STATE == G.STATES.SELECTING_HAND or G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.PLANET_PACK then
            if (self.ability.name == 'The Reverse Hanged Man') and #G.hand.cards > 1 then
                return true
            end
        end
    end
    return can_use_consumeable_ref(self, any_state, skip_check)
end


local is_suit_ref = Card.is_suit
function Card.is_suit(self, suit, bypass_debuff, flush_calc)
  if flush_calc then
      if self.ability.effect == 'Coal Card' then
          return false
      end
      if self.ability.effect == 'Blank Card' then
          local target_card = self:get_blank_card_target()
          return target_card and target_card:is_suit(suit, bypass_debuff, flush_calc) or false 
      end
  else
      if self.debuff and not bypass_debuff then return end
      if self.ability.effect == 'Coal Card' then
          return false
      end
      if self.ability.effect == 'Blank Card' then
          local target_card = self:get_blank_card_target()
          return target_card and target_card:is_suit(suit, bypass_debuff, flush_calc) or false 
      end
  end
  return is_suit_ref(self, suit, bypass_debuff, flush_calc)
end


local update_ref = Card.update
function Card.update(self, dt)
    update_ref(self, dt)
    if G.STAGE == G.STAGES.RUN then
        if self.ability.name == 'Reverse Temperance' then
            self.ability.money = math.min(#G.consumeables.cards*self.ability.consumeable.payout_mult, self.ability.extra)
        end
    end
end


function addTarotsToPools(tarotTable, atlas)
    -- Add Jokers to center
    for k, v in pairsByOrder(tarotTable) do
        v.key = k
        if atlas then v.atlas = atlas end
        v.order = table_length(G.P_CENTER_POOLS['Tarot']) + v.order
        G.P_CENTERS[k] = v
        table.insert(G.P_CENTER_POOLS['Tarot'], v)
    end
  
    table.sort(G.P_CENTER_POOLS["Tarot"], function(a, b)
        return a.order < b.order
    end)
end

function addEnhancementsToPools(enhanceTable, atlas)
    -- Add Jokers to center
    for k, v in pairs(enhanceTable) do
        v.key = k
        if atlas then v.atlas = atlas end
        v.order = table_length(G.P_CENTER_POOLS['Enhanced']) + v.order
        G.P_CENTERS[k] = v
        table.insert(G.P_CENTER_POOLS['Enhanced'], v)
    end
  
    table.sort(G.P_CENTER_POOLS["Enhanced"], function(a, b)
        return a.order < b.order
    end)
end


local eval_card_ref = eval_card
function eval_card(card, context)
    local ret = eval_card_ref(card, context) 
    if context.cardarea == G.play and not context.repetition_only then
        if card.ability.name == "Wooden Card" and pseudorandom('wood') < G.GAME.probabilities.normal/card.ability.extra then
            return {wooden = true}
        end
        if card.ability.name == "Coal Card" then
            ret.coal = true
            ret.card = card
        end

        local chips = card:get_chip_bonus()
        if chips < 0 then 
            ret.chips = chips
        end

        local mult = card:get_chip_mult()
        if mult < 0 then 
            ret.mult = mult
        end
        local p_dollars = card:get_p_dollars()
        if p_dollars < 0 then 
            ret.p_dollars = p_dollars
        end
        local h_bonus = card:get_chip_h_bonus()
        if h_bonus > 0 then
            ret.h_bonus = h_bonus
        end

        local h_x_chips = card:get_chip_h_x_chips()
        if h_x_chips > 0 then 
            ret.x_chips = h_x_chips
        end
    end

    if context.cardarea == G.hand and not context.repetition_only then
        local h_bonus = card:get_chip_h_bonus()
        if h_bonus > 0 then
            ret.h_bonus = h_bonus
        end

        local h_x_chips = card:get_chip_h_x_chips()
        if h_x_chips > 0 then 
            ret.x_chips = h_x_chips
        end
    end

    return ret
end


function play_tarot_cards(n, i)
    if not i then i = 1 end
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = (function() 
        if i <= n then 
          local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'emp')
          print(card.ability.name)
          while (card.ability.name == "The Reverse Emperor") do
            if card.area then card.area:remove_card(card) end
            card:remove()
            card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'emp')
            print(card.ability.name)
            G.GAME.consumeable_buffer = 0
          end
          G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = (function()
          G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = (function() 
                  G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = (function() 
                    G.hand:unhighlight_all()
                    if card.ability.consumeable.max_highlighted and #G.hand.cards > 0 then
                        for j = 1, math.min(#G.hand.cards, card.ability.consumeable.max_highlighted) do
                            local hand_card = pseudorandom_element(G.hand.cards, pseudoseed('emp_rev_add'))
                            while hand_card.highlighted do hand_card = pseudorandom_element(G.hand.cards, pseudoseed('emp_rev_add')) end
                            G.hand:add_to_highlighted(hand_card)
                        end
                    elseif not card:can_use_consumeable(true, true) then
                      if card.area then card.area:remove_card(card) end
                        card:remove()
                        print("Could not play " .. card.ability.name .. ". Trying again...")
                        play_tarot_cards(n, i)
                        return true
                    end
                    card:use_consumeable(card.area)
                    for i = 1, #G.jokers.cards do
                      G.jokers.cards[i]:calculate_joker({using_consumeable = true, consumeable = card})
                    end
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.8,
                    func = (function() 
                      card:start_dissolve()
                      play_tarot_cards(n, i+1)
                    return true end)}))
                  return true end)}))
          return true end)}))
          return true end)}))
        end 
        return true end)}))
end


card_eval_status_text_ref = card_eval_status_text
function card_eval_status_text(card, eval_type, amt, percent, dir, extra)
    percent = percent or (0.9 + 0.2*math.random())
    if dir == 'down' then 
        percent = 1-percent
    end

    if extra and extra.focus then card = extra.focus end

    local text = ''
    local sound = nil
    local volume = 1
    local card_aligned = 'bm'
    local y_off = 0.15*G.CARD_H
    if card.area == G.jokers or card.area == G.consumeables then
        y_off = 0.05*card.T.h
    elseif card.area == G.hand then
        y_off = -0.05*G.CARD_H
        card_aligned = 'tm'
    elseif card.area == G.play then
        y_off = -0.05*G.CARD_H
        card_aligned = 'tm'
    elseif card.jimbo  then
        y_off = -0.05*G.CARD_H
        card_aligned = 'tm'
    end
    local config = {}
    local delay = 0.65
    local colour = config.colour or (extra and extra.colour) or ( G.C.FILTER )
    local extrafunc = nil

    if eval_type == 'chips' then 
        sound = 'chips1'
        amt = amt
        colour = G.C.CHIPS
        if amt < 0 then text = localize{type='variable',key='a_chips_minus',vars={-amt}} end
        if amt > 0 then text = localize{type='variable',key='a_chips',vars={amt}} end
        delay = 0.6
    elseif (eval_type == 'x_chips') or (eval_type == 'h_x_chips') then 
        sound = 'multhit2'
        volume = 0.7
        amt = amt
        text = localize{type='variable',key='a_xchips',vars={amt}}
        colour = G.C.CHIPS
        config.type = 'fade'
        config.scale = 0.7
    else
        return card_eval_status_text_ref(card, eval_type, amt, percent, dir, extra)
    end

    if amt ~= 0 then
        if extra and extra.instant then
            if extrafunc then extrafunc() end
            attention_text({
                text = text,
                scale = config.scale or 1, 
                hold = delay - 0.2,
                backdrop_colour = colour,
                align = card_aligned,
                major = card,
                offset = {x = 0, y = y_off}
            })
            play_sound(sound, 0.8+percent*0.2, volume)
            if not extra or not extra.no_juice then
                card:juice_up(0.6, 0.1)
                G.ROOM.jiggle = G.ROOM.jiggle + 0.7
            end
        else
            G.E_MANAGER:add_event(Event({ --Add bonus chips from this card
                    trigger = 'before',
                    delay = delay,
                    func = function()
                    if extrafunc then extrafunc() end
                    attention_text({
                        text = text,
                        scale = config.scale or 1, 
                        hold = delay - 0.2,
                        backdrop_colour = colour,
                        align = card_aligned,
                        major = card,
                        offset = {x = 0, y = y_off}
                    })
                    play_sound(sound, 0.8+percent*0.2, volume)
                    if not extra or not extra.no_juice then
                        card:juice_up(0.6, 0.1)
                        G.ROOM.jiggle = G.ROOM.jiggle + 0.7
                    end
                    return true
                    end
            }))
        end
    end
    if extra and extra.playing_cards_created then 
        playing_card_joker_effects(extra.playing_cards_created)
    end
end


local generate_card_ui_ref = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
    local customCard = false
    if _c.name == 'The Reverse Fool' or _c.name == 'The Reverse Magician' or _c.name == 'The Reverse High Priestess' or _c.name == 'The Reverse Emperor' or _c.name == 'The Reverse Empress' or _c.name == 'The Reverse Hierophant' or _c.name == 'The Reverse Lovers' or _c.name == 'The Reverse Chariot' or _c.name == 'Reverse Justice' or _c.name == 'The Reverse Hermit' or _c.name == 'The Reverse Wheel of Fortune' or _c.name == 'Reverse Strength' or _c.name == 'The Reverse Hanged Man' or _c.name == 'Reverse Death' or _c.name == 'Reverse Temperance' or _c.name == 'The Reverse Devil' or _c.name == 'The Reverse Tower' or _c.name == 'The Reverse Star' or _c.name == 'The Reverse Moon' or _c.name == 'The Reverse Sun' or _c.name == 'The Reverse Judgement' or _c.name == 'The Reverse World' then
        customCard = true
    end
    if _c.name == 'Coal Card' or _c.name == 'Blank Card' or _c.effect == 'Wooden Card' or _c.effect == 'Brass Card' or _c.effect == 'Hand Mult Card' or _c.effect == 'Hand Bonus Card' or _c.effect == "Fool's Gold Card" or _c.effect == 'Unlucky Card' then
        customCard = true
    end
    if not customCard then return generate_card_ui_ref(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end) end
    local first_pass = nil
    if not full_UI_table then 
        first_pass = true
        full_UI_table = {
            main = {},
            info = {},
            type = {},
            name = nil,
            badges = badges or {}
        }
    end

    local desc_nodes = (not full_UI_table.name and full_UI_table.main) or full_UI_table.info
    local name_override = nil
    local info_queue = {}

    if full_UI_table.name then
        full_UI_table.info[#full_UI_table.info+1] = {}
        desc_nodes = full_UI_table.info[#full_UI_table.info]
    end

    if not full_UI_table.name then
        if specific_vars and specific_vars.no_name then
            full_UI_table.name = true
        elseif card_type == 'Locked' then
            full_UI_table.name = localize{type = 'name', set = 'Other', key = 'locked', nodes = {}}
        elseif card_type == 'Undiscovered' then 
            full_UI_table.name = localize{type = 'name', set = 'Other', key = 'undiscovered_'..(string.lower(_c.set)), name_nodes = {}}
        elseif specific_vars and (card_type == 'Default' or card_type == 'Enhanced') then
            if (_c.name == 'Coal Card' or _c.name == 'Stone Card' or _c.name == 'Blank Card') then full_UI_table.name = true end
            if (specific_vars.playing_card and (_c.name ~= 'Coal Card' and _c.name ~= 'Stone Card' and _c.name ~= 'Blank Card')) then
                full_UI_table.name = {}
                localize{type = 'other', key = 'playing_card', set = 'Other', nodes = full_UI_table.name, vars = {localize(specific_vars.value, 'ranks'), localize(specific_vars.suit, 'suits_plural'), colours = {specific_vars.colour}}}
                full_UI_table.name = full_UI_table.name[1]
            end
        elseif card_type == 'Booster' then
            
        else
            full_UI_table.name = localize{type = 'name', set = _c.set, key = _c.key, nodes = full_UI_table.name}
        end
        full_UI_table.card_type = card_type or _c.set
    end 

    local loc_vars = {}
    if main_start then 
        desc_nodes[#desc_nodes+1] = main_start 
    end

    if _c.set == 'Other' then
        localize{type = 'other', key = _c.key, nodes = desc_nodes, vars = specific_vars}
    elseif card_type == 'Locked' then
    elseif hide_desc then
        localize{type = 'other', key = 'undiscovered_'..(string.lower(_c.set)), set = _c.set, nodes = desc_nodes}
    elseif specific_vars and specific_vars.debuffed then
        localize{type = 'other', key = 'debuffed_'..(specific_vars.playing_card and 'playing_card' or 'default'), nodes = desc_nodes}
    elseif _c.set == 'Joker' then
    elseif _c.set == 'Tag' then
    elseif _c.set == 'Voucher' then
    elseif _c.set == 'Edition' then
        loc_vars = {_c.config.extra}
        localize{type = 'descriptions', key = _c.key, set = _c.set, nodes = desc_nodes, vars = loc_vars}
    elseif _c.set == 'Default' and specific_vars then 
        if specific_vars.nominal_chips then 
            localize{type = 'other', key = 'card_chips', nodes = desc_nodes, vars = {specific_vars.nominal_chips}}
        end
        if specific_vars.bonus_chips then
            localize{type = 'other', key = 'card_extra_chips', nodes = desc_nodes, vars = {specific_vars.bonus_chips}}
        end
    elseif _c.set == 'Enhanced' then 
        if specific_vars and (_c.name ~= 'Stone Card' and _c.name ~= 'Blank Card' and _c.name ~= 'Coal Card') and specific_vars.nominal_chips then
            localize{type = 'other', key = 'card_chips', nodes = desc_nodes, vars = {specific_vars.nominal_chips}}
        end
        if _c.effect == 'Coal Card' then 
            local current_chips =  _c.config.extra.sub_chips + _c.config.extra.add_chips * (specific_vars and specific_vars.current or 0) + (specific_vars and specific_vars.bonus_chips or 0)
            local current_mult =  _c.config.extra.sub_mult + _c.config.extra.add_mult * (specific_vars and specific_vars.current or 0)
            local plus_chips = current_chips > 0 and "+" or ""
            local plus_mult = current_mult > 0 and "+" or "" 
            loc_vars = {plus_chips .. current_chips, plus_mult .. current_mult, _c.config.extra.add_chips, _c.config.extra.add_mult}
        elseif _c.effect == 'Wooden Card' then loc_vars = {_c.config.Xmult, G.GAME.probabilities.normal, _c.config.extra}
        elseif _c.effect == 'Hand Bonus Card' then loc_vars = {_c.config.extra.h_bonus}
        elseif _c.effect == 'Hand Mult Card' then loc_vars = {_c.config.h_mult}
        elseif _c.effect == 'Brass Card' then loc_vars = {_c.config.extra.h_x_chips}
        elseif _c.effect == "Fool's Gold Card" then loc_vars = {_c.config.extra.h_bonus, _c.config.h_mult, _c.config.h_dollars}
        elseif _c.effect == 'Unlucky Card' then loc_vars = {G.GAME.probabilities.normal, _c.config.mult, 5, -_c.config.p_dollars, 15, _c.config.Xmult}
        end
        localize{type = 'descriptions', key = _c.key, set = _c.set, nodes = desc_nodes, vars = loc_vars}
        if (_c.name ~= 'Stone Card' and _c.name ~= 'Coal Card') and ((specific_vars and specific_vars.bonus_chips) or _c.config.bonus) then
            localize{type = 'other', key = 'card_extra_chips', nodes = desc_nodes, vars = {((specific_vars and specific_vars.bonus_chips) or _c.config.bonus)}}
        end
    elseif _c.set == 'Booster' then 
    elseif _c.set == 'Spectral' then 
    elseif _c.set == 'Planet' then
    elseif _c.set == 'Tarot' then
        if _c.name == "The Reverse Fool" then
            local fool_c = G.GAME.last_tarot_planet and G.P_CENTERS[G.GAME.last_tarot_planet] or nil
            local last_tarot_planet = fool_c and localize{type = 'name_text', key = fool_c.key, set = fool_c.set} or localize('k_none')
            local colour = (not fool_c or fool_c.name == 'The Reverse Fool') and G.C.RED or G.C.GREEN
            main_end = {
                {n=G.UIT.C, config={align = "bm", padding = 0.02}, nodes={
                    {n=G.UIT.C, config={align = "m", colour = colour, r = 0.05, padding = 0.05}, nodes={
                        {n=G.UIT.T, config={text = ' '..last_tarot_planet..' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true}},
                    }}
                }}
            }
           loc_vars = {last_tarot_planet, G.GAME.probabilities.normal, 2}
           if not (not fool_c or fool_c.name == 'The Reverse Fool') then
                info_queue[#info_queue+1] = fool_c
           end
       elseif _c.name == "The Reverse High Priestess" then loc_vars = {_c.config.planets, _c.config.downgrade}
       elseif _c.name == "The Reverse Emperor" then loc_vars = {_c.config.tarots}
       elseif _c.name == "The Reverse Hermit" then loc_vars = {_c.config.extra}
       elseif _c.name == "The Reverse Wheel of Fortune" then loc_vars = {G.GAME.probabilities.normal, _c.config.extra};  info_queue[#info_queue+1] = G.P_CENTERS.e_foil; info_queue[#info_queue+1] = G.P_CENTERS.e_holo; info_queue[#info_queue+1] = G.P_CENTERS.e_polychrome; 
       elseif _c.name == "Reverse Strength" then loc_vars = {_c.config.max_highlighted}
       elseif _c.name == "The Reverse Hanged Man" then loc_vars = {_c.config.extra}
       elseif _c.name == "Reverse Temperance" then 
        local _money = 0
        if G.consumeables then
            for i = 1, #G.consumeables.cards do
                if G.consumeables.cards[i] ~= _c then _money = _money + _c.config.payout_mult end
            end
        end
        loc_vars = {_c.config.payout_mult, _c.config.extra, math.min(_c.config.extra, _money)}
       elseif _c.name == "The Reverse World" then loc_vars = {_c.config.max_highlighted, localize(_c.config.no_suit, 'suits_plural'), colours = {G.C.SUITS[_c.config.no_suit]}}
       elseif _c.name == "The Reverse Star" then loc_vars = {_c.config.max_highlighted, localize(_c.config.no_suit, 'suits_plural'), colours = {G.C.SUITS[_c.config.no_suit]}}
       elseif _c.name == "The Reverse Sun" then loc_vars = {_c.config.max_highlighted, localize(_c.config.no_suit, 'suits_plural'), colours = {G.C.SUITS[_c.config.no_suit]}}
       elseif _c.name == "The Reverse Moon" then loc_vars = {_c.config.max_highlighted, localize(_c.config.no_suit, 'suits_plural'), colours = {G.C.SUITS[_c.config.no_suit]}}
       elseif _c.name == "Reverse Death" then loc_vars = {_c.config.max_highlighted}
       elseif _c.name == "The Reverse Hierophant" then loc_vars = {_c.config.max_highlighted, localize{type = 'name_text', set = 'Enhanced', key = _c.config.mod_conv}}; info_queue[#info_queue+1] = G.P_CENTERS[_c.config.mod_conv]
       elseif _c.name == "The Reverse Chariot" then loc_vars = {_c.config.max_highlighted, localize{type = 'name_text', set = 'Enhanced', key = _c.config.mod_conv}}; info_queue[#info_queue+1] = G.P_CENTERS[_c.config.mod_conv]
       elseif _c.name == "The Reverse Devil" then loc_vars = {_c.config.max_highlighted, localize{type = 'name_text', set = 'Enhanced', key = _c.config.mod_conv}}; info_queue[#info_queue+1] = G.P_CENTERS[_c.config.mod_conv]
       elseif _c.name == "The Reverse Empress" then loc_vars = {_c.config.max_highlighted, localize{type = 'name_text', set = 'Enhanced', key = _c.config.mod_conv}}; info_queue[#info_queue+1] = G.P_CENTERS[_c.config.mod_conv]
       elseif _c.name == "The Reverse Lovers" then loc_vars = {_c.config.max_highlighted, localize{type = 'name_text', set = 'Enhanced', key = _c.config.mod_conv}}; info_queue[#info_queue+1] = G.P_CENTERS[_c.config.mod_conv]
       elseif _c.name == "The Reverse Magician" then loc_vars = {_c.config.max_highlighted, localize{type = 'name_text', set = 'Enhanced', key = _c.config.mod_conv}}; info_queue[#info_queue+1] = G.P_CENTERS[_c.config.mod_conv]
       elseif _c.name == "Reverse Justice" then loc_vars = {_c.config.max_highlighted, localize{type = 'name_text', set = 'Enhanced', key = _c.config.mod_conv}}; info_queue[#info_queue+1] = G.P_CENTERS[_c.config.mod_conv]
       elseif _c.name == "The Reverse Tower" then loc_vars = {_c.config.max_highlighted, localize{type = 'name_text', set = 'Enhanced', key = _c.config.mod_conv}}; info_queue[#info_queue+1] = G.P_CENTERS[_c.config.mod_conv]
       elseif _c.name == "The Reverse Judgement" then
       end
       localize{type = 'descriptions', key = _c.key, set = _c.set, nodes = desc_nodes, vars = loc_vars}
   end

    if main_end then 
        desc_nodes[#desc_nodes+1] = main_end 
    end

   --Fill all remaining info if this is the main desc
    if not ((specific_vars and not specific_vars.sticker) and (card_type == 'Default' or card_type == 'Enhanced')) then
        if desc_nodes == full_UI_table.main and not full_UI_table.name then
            localize{type = 'name', key = _c.key, set = _c.set, nodes = full_UI_table.name} 
            if not full_UI_table.name then full_UI_table.name = {} end
        elseif desc_nodes ~= full_UI_table.main then 
            desc_nodes.name = localize{type = 'name_text', key = name_override or _c.key, set = name_override and 'Other' or _c.set} 
        end
    end

    if first_pass and not (_c.set == 'Edition') and badges then
        for k, v in ipairs(badges) do
            if v == 'foil' then info_queue[#info_queue+1] = G.P_CENTERS['e_foil'] end
            if v == 'holographic' then info_queue[#info_queue+1] = G.P_CENTERS['e_holo'] end
            if v == 'polychrome' then info_queue[#info_queue+1] = G.P_CENTERS['e_polychrome'] end
            if v == 'negative' then info_queue[#info_queue+1] = G.P_CENTERS['e_negative'] end
            if v == 'negative_consumable' then info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}} end
            if v == 'gold_seal' then info_queue[#info_queue+1] = {key = 'gold_seal', set = 'Other'} end
            if v == 'blue_seal' then info_queue[#info_queue+1] = {key = 'blue_seal', set = 'Other'} end
            if v == 'red_seal' then info_queue[#info_queue+1] = {key = 'red_seal', set = 'Other'} end
            if v == 'purple_seal' then info_queue[#info_queue+1] = {key = 'purple_seal', set = 'Other'} end
            if v == 'eternal' then info_queue[#info_queue+1] = {key = 'eternal', set = 'Other'} end
            if v == 'pinned_left' then info_queue[#info_queue+1] = {key = 'pinned_left', set = 'Other'} end
        end
    end

    for _, v in ipairs(info_queue) do
        generate_card_ui(v, full_UI_table)
    end

    return full_UI_table
end



----------------------------------------------
------------MOD CODE END----------------------