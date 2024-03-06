j_copycat=          {order = 156,  unlocked = true, discovered = true, blueprint_compat = true, eternal_compat = true, rarity = 3, cost = 10, name = "Copycat", pos = {x=0,y=16}, set = "Joker", effect = "Copycat", cost_mult = 1.0, config = {},unlock_condition = {type = 'win_custom'}},
j_tarlton=          {order = 151,  unlocked = true, discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 4, cost = 20, name = "Tarlton", pos = {x=1,y=16}, soul_pos = {x=1, y=9}, set = "Joker", effect = "Copycat", cost_mult = 1.0, config = {},unlock_condition = {type = '', extra = '', hidden = true}}, 
j_lipographic_jokr= {order = 153,  unlocked = true, discovered = true, blueprint_compat = true, eternal_compat = true, rarity = 2, cost = 5, name = "Lipographic Jokr", pos = {x=2,y=16}, set = "Joker", config = {extra = {mult = 10, sub = 5}}},
j_oops_1s=          {order = 154,  unlocked = true, discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 1, cost = 4, name = "Oops! All 1s", pos = {x=3,y=16}, set = "Joker", effect = "", config = {}, unlock_condition = {type = 'chip_score', chips = 10000}},
j_safari=           {order = 155,  unlocked = true, discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 3, cost = 7, name = "Safari Joker", pos = {x=4,y=16}, set = "Joker", effect = "", config = {}, unlock_condition = {type = 'modify_deck', extra = {count = 3, enhancement = 'Wild Card', e_key = 'm_wild'}}},
j_pierrot=          {order = 152,  unlocked = true, discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 4, cost = 20, name = "Pierrot", pos = {x=5,y=16}, soul_pos = {x=0, y=9}, set = "Joker", effect = "", config = {}, unlock_condition = {type = '', extra = '', hidden = true}},
j_pessimist=        {order = 157,  unlocked = true, discovered = true, blueprint_compat = false, eternal_compat = false, rarity = 3, cost = 10, name = "Pessimist", pos = {x=6,y=16}, set = "Joker", effect = "", config = {extra = 2}, unlock_condition = {type = 'win_custom'}},
j_prosopagnosia=    {order = 158,  unlocked = true,  discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 1, cost = 5, name = "Prosopagnosia", pos = {x=7,y=16}, set = "Joker", effect = "All face cards", cost_mult = 1.0, config = {}},
j_double_vision=    {order = 159,  unlocked = true,  discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 3, cost = 10, name = "Double Vision", pos = {x=8,y=16}, set = "Joker", effect = "", cost_mult = 1.0, config = {}},
j_scouter=          {order = 160,  unlocked = true,  discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 1, cost = 4, name = "Scouter Joker", pos = {x=9,y=16}, set = "Joker", effect = "", cost_mult = 1.0, config = {extra = 0}},
j_zeno=             {order = 161,  unlocked = true,  discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 3, cost = 8, name = "Zeno's Joker", pos = {x = 0, y = 17}, set = 'Joker', config = {}},
j_one_more=         {order = 162,  unlocked = true,  discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 1, cost = 8, name = "One More Time!", pos = {x = 1, y = 17}, set = 'Joker', config = {extra = {score=0, old_chips=0}}},
j_collector=        {order = 163,  unlocked = true,  discovered = true, blueprint_compat = true, eternal_compat = true, rarity = 3, cost = 7, name = "The Collector", pos = {x=2,y=17}, set = "Joker", effect = "Card Buff", cost_mult = 1.0, config = {extra = 2}},
j_buckleswasher=    {order = 164,  unlocked = true,  discovered = true, blueprint_compat = true, eternal_compat = true, rarity = 2, cost = 4, name = "Buckleswasher", pos = {x=3,y=17}, set = "Joker", effect = "Set Mult", cost_mult = 1.0, config = {mult = 1},unlock_condition = {type = 'c_jokers_sold', extra = 20}},
j_hatter=           {order = 165,  unlocked = true,  discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 2, cost = 7, name = "Mad Hatter",set = "Joker", config = {},  pos = {x=4,y=17}},
j_greener_pastures= {order = 166,  unlocked = true,  discovered = true, blueprint_compat = false, eternal_compat = true, rarity = 2, cost = 8, name = "Greener Pastures",set = "Joker", config = {extra = nil},  pos = {x=5,y=17}},
j_special_snowflake={order = 167,  unlocked = true,  discovered = true, blueprint_compat = true, eternal_compat = true, rarity = 2, cost = 6, name = "Special Snowflake",set = "Joker", config = {extra = 0.2},  pos = {x=6,y=17}, soul_pos={x=7, y=17}},

--[[SMODS.Joker:new(
        name, slug,
        config,
        spritePos, loc_txt,
        rarity, cost, unlocked, discovered, blueprint_compat, eternal_compat,
        atlas
    )
    ]]
       --
special_snowflake = SMODS.Joker:new(
"Special Snowflake", "",
{extra = 0.2},
{ x = 6, y = 17 }, "",
2, 6, true, true, true, true,
"JellyJokers"
),