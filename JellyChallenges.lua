--- STEAMODDED HEADER
--- MOD_NAME: Challenges
--- MOD_ID: JellyChallenges
--- MOD_AUTHOR: [JamesTheJellyfish]
--- MOD_DESCRIPTION: Yellow

----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.JellyChallenges() 
    --[[
    "Golden" Challenge:
    - Gold Stake
    - Start with a deck full of Gold Cards with Gold Seals
    - All cards are five times as expensive
    - Banned cards:
      - Vampire
      - Clearance Sale, Liquidation
      - Magician, Empress, Hierophant, Chariot, Devil, Tower, Lovers
      - Incanation, Grim, Familiar, Talisman, Deja Vu, Trance, Medium
    ]]--
    local challenges = {
        {
            name = 'Pirate Duel',
                id = 'c_pirate_duel_1',
                rules = {
                    custom = {
                    },
                    modifiers = {
                    }
                },
                jokers = {
                    {id = 'j_buckleswasher', eternal = true},
                    {id = 'j_swashbuckler', eternal = true},
                },
                consumeables = {
    
                },
                vouchers = {
                },
                deck = {
                    type = 'Challenge Deck'
                },
                restrictions = {
                    banned_cards = {
                    },
                    banned_tags = {
                    },
                    banned_other = {
                    }
                }
            },


            {
                name = "Sturdy",
                id = 'c_sturdy_1',
                rules = {
                    custom = {
                    },
                    modifiers = {
                    }
                },
                jokers = {
                    {id = 'j_oops_1s', eternal = true, edition = 'negative'},
                    {id = 'j_oops_1s', eternal = true, edition = 'negative'},
                },
                consumeables = {
                    {id = 'c_magician_rev'},
                    {id = 'c_fool_rev'}
                },
                vouchers = {
                },
                deck = {
                    cards = {{s='D',r='2',},{s='D',r='3',},{s='D',r='4',},{s='D',r='5',},{s='D',r='6',},{s='D',r='7',},{s='D',r='8',},{s='D',r='9',},{s='D',r='T',},{s='D',r='J',e='m_glass',},{s='D',r='Q',e='m_glass',},{s='D',r='K',e='m_glass',},{s='D',r='A',e='m_wooden'},{s='C',r='2',},{s='C',r='3',},{s='C',r='4',},{s='C',r='5',},{s='C',r='6',},{s='C',r='7',},{s='C',r='8',},{s='C',r='9',},{s='C',r='T',},{s='C',r='J',e='m_glass',},{s='C',r='Q',e='m_glass',},{s='C',r='K',e='m_glass',},{s='C',r='A',e='m_wooden'},{s='H',r='2',},{s='H',r='3',},{s='H',r='4',},{s='H',r='5',},{s='H',r='6',},{s='H',r='7',},{s='H',r='8',},{s='H',r='9',},{s='H',r='T',},{s='H',r='J',e='m_glass',},{s='H',r='Q',e='m_glass',},{s='H',r='K',e='m_glass',},{s='H',r='A',e='m_wooden'},{s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',},{s='S',r='T',},{s='S',r='J',e='m_glass',},{s='S',r='Q',e='m_glass',},{s='S',r='K',e='m_glass',},{s='S',r='A',e='m_wooden'},},
                    type = 'Challenge Deck'
                },
                restrictions = {
                    banned_cards = {
                        {id = 'c_magician'},
                        {id = 'c_empress'},
                        {id = 'c_heirophant'},
                        {id = 'c_chariot'},
                        {id = 'c_devil'},
                        {id = 'c_tower'},
                        {id = 'c_lovers'},
                        {id = 'c_incantation'},
                        {id = 'c_grim'},
                        {id = 'c_familiar'},
                        {id = 'p_standard_normal_1', ids = {
                            'p_standard_normal_1','p_standard_normal_2','p_standard_normal_3','p_standard_normal_4','p_standard_jumbo_1','p_standard_jumbo_2','p_standard_mega_1','p_standard_mega_2',
                        }},
                        {id = 'j_marble'},
                        {id = 'j_vampire'},
                        {id = 'j_midas_mask'},
                        {id = 'j_certificate'},
                        {id = 'v_magic_trick'},
                        {id = 'v_illusion'},
                    },
                    banned_tags = {
                        {id = 'tag_standard'},
                    },
                    banned_other = {
                    }
                }
            },

            {
                name = "Ill Omen",
                id = 'c_ill_omen_1',
                rules = {
                    custom = {
                    },
                    modifiers = {
                    }
                },
                jokers = {
                    {id = 'j_fortune_teller', eternal = true},
                    {id = 'j_cartomancer'},
                },
                consumeables = {
                },
                vouchers = {
                },
                deck = {
                    type = 'Challenge Deck'
                },
                restrictions = {
                    banned_cards = {
                        {id = 'c_fool'},
                        {id = 'c_magician'},
                        {id = 'c_high_priestess'},
                        {id = 'c_emperor'},
                        {id = 'c_empress'},
                        {id = 'c_justice'},
                        {id = 'c_world'},
                        {id = 'c_wheel_of_fortune'},
                        {id = 'c_sun'},
                        {id = 'c_moon'},
                        {id = 'c_star'},
                        {id = 'c_death'},
                        {id = 'c_hanged_man'},
                        {id = 'c_hermit'},
                        {id = 'c_temperance'},
                        {id = 'c_heirophant'},
                        {id = 'c_judgement'},
                        {id = 'c_strength'},
                        {id = 'c_chariot'},
                        {id = 'c_devil'},
                        {id = 'c_tower'},
                        {id = 'c_lovers'},
                    },
                    banned_tags = {
                    },
                    banned_other = {
                    }
                }
            },


            {
                name = "Black Cat",
                id = 'c_black_cat_1',
                rules = {
                    custom = {
                    },
                    modifiers = {
                    }
                },
                jokers = {
                    {id = 'j_lucky_cat', eternal = true},
                },
                consumeables = {
                },
                vouchers = {
                },
                deck = {
                    cards = {{s='D',r='2',e='m_lucky'},{s='D',r='3',e='m_lucky'},{s='D',r='4',e='m_lucky'},{s='D',r='5',e='m_lucky'},{s='D',r='6',e='m_lucky'},{s='D',r='7',e='m_lucky'},{s='D',r='8',e='m_lucky'},{s='D',r='9',e='m_lucky'},{s='D',r='T',e='m_lucky'},{s='D',r='J',e='m_lucky'},{s='D',r='Q',e='m_lucky'},{s='D',r='K',e='m_lucky'},{s='D',r='A',e='m_lucky'},{s='C',r='2',e='m_unlucky'},{s='C',r='3',e='m_unlucky'},{s='C',r='4',e='m_unlucky'},{s='C',r='5',e='m_unlucky'},{s='C',r='6',e='m_unlucky'},{s='C',r='7',e='m_unlucky'},{s='C',r='8',e='m_unlucky'},{s='C',r='9',e='m_unlucky'},{s='C',r='T',e='m_unlucky'},{s='C',r='J',e='m_unlucky'},{s='C',r='Q',e='m_unlucky'},{s='C',r='K',e='m_unlucky'},{s='C',r='A',e='m_unlucky'},{s='H',r='2',e='m_lucky'},{s='H',r='3',e='m_lucky'},{s='H',r='4',e='m_lucky'},{s='H',r='5',e='m_lucky'},{s='H',r='6',e='m_lucky'},{s='H',r='7',e='m_lucky'},{s='H',r='8',e='m_lucky'},{s='H',r='9',e='m_lucky'},{s='H',r='T',e='m_lucky'},{s='H',r='J',e='m_lucky'},{s='H',r='Q',e='m_lucky'},{s='H',r='K',e='m_lucky'},{s='H',r='A',e='m_lucky'},{s='S',r='2',e='m_unlucky'},{s='S',r='3',e='m_unlucky'},{s='S',r='4',e='m_unlucky'},{s='S',r='5',e='m_unlucky'},{s='S',r='6',e='m_unlucky'},{s='S',r='7',e='m_unlucky'},{s='S',r='8',e='m_unlucky'},{s='S',r='9',e='m_unlucky'},{s='S',r='T',e='m_unlucky'},{s='S',r='J',e='m_unlucky'},{s='S',r='Q',e='m_unlucky'},{s='S',r='K',e='m_unlucky'},{s='S',r='A',e='m_unlucky'},},
                    type = 'Challenge Deck'
                },
                restrictions = {
                    banned_cards = {
                    },
                    banned_tags = {
                    },
                    banned_other = {
                    }
                }
            },
        
            {
                name = "Level up",
                id = 'c_level_up_1',
                rules = {
                    custom = {
                    },
                    modifiers = {
                        {id = 'joker_slots', value = 0},
                        {id = 'consumable_slots', value = 1},
                    }
                },
                jokers = {
                    {id = 'j_perkeo', eternal = true, neative = true},
                    {id = 'j_perkeo', eternal = true, neative = true},
                    {id = 'j_joker'},
                    {id = 'j_joker'},
                    {id = 'j_joker'},
                    {id = 'j_joker'},
                    {id = 'j_joker'},
                },
                consumeables = {
                    {id = 'c_judgement_rev'}
                },
                vouchers = {
                },
                deck = {
                    type = 'Challenge Deck'
                },
                restrictions = {
                    banned_cards = {
                        {id = 'c_fool'},
                        {id = 'c_magician'},
                        {id = 'c_high_priestess'},
                        {id = 'c_emperor'},
                        {id = 'c_empress'},
                        {id = 'c_justice'},
                        {id = 'c_world'},
                        {id = 'c_wheel_of_fortune'},
                        {id = 'c_sun'},
                        {id = 'c_moon'},
                        {id = 'c_star'},
                        {id = 'c_death'},
                        {id = 'c_hanged_man'},
                        {id = 'c_hermit'},
                        {id = 'c_temperance'},
                        {id = 'c_heirophant'},
                        {id = 'c_judgement'},
                        {id = 'c_strength'},
                        {id = 'c_chariot'},
                        {id = 'c_devil'},
                        {id = 'c_tower'},
                        {id = 'c_lovers'},
                        {id = 'c_fool_rev'},
                        {id = 'c_magician_rev'},
                        {id = 'c_high_priestess_rev'},
                        {id = 'c_emperor_rev'},
                        {id = 'c_empress_rev'},
                        {id = 'c_justice_rev'},
                        {id = 'c_world_rev'},
                        {id = 'c_wheel_of_fortune_rev'},
                        {id = 'c_sun_rev'},
                        {id = 'c_moon_rev'},
                        {id = 'c_star_rev'},
                        {id = 'c_death_rev'},
                        {id = 'c_hanged_man_rev'},
                        {id = 'c_hermit_rev'},
                        {id = 'c_temperance_rev'},
                        {id = 'c_heirophant_rev'},
                        {id = 'c_strength_rev'},
                        {id = 'c_chariot_rev'},
                        {id = 'c_devil_rev'},
                        {id = 'c_tower_rev'},
                        {id = 'c_lovers_rev'},
                    },
                    banned_tags = {
                    },
                    banned_other = {
                    }
                }
            },

            {
                name = 'Promotion',
                    id = 'c_promotion_1',
                    rules = {
                        custom = {
                        },
                        modifiers = {
                            {id = 'hand_size', value = 7},
                        }
                    },
                    jokers = {
                        {id = 'j_hatter', eternal=true, negative=true},
                    },
                    consumeables = {
                    },
                    vouchers = {
                    },
                    deck = {
                        cards = {{s='D',r='2'},{s='C',r='2'},{s='S',r='K'},{s='H',r='K'},{s='C',r='K',e='m_wooden',g='Red',d='polychrome'},{s='S',r='2',e='m_bonus',g='Purple',d='holo'},{s='H',r='2',e='m_mult', g='Gold',d='foil'},{s='D',r='K',e='m_lucky', g='Blue'}},
                        type = 'Challenge Deck'
                    },
                    restrictions = {
                        banned_cards = {
                        },
                        banned_tags = {
                            {id = 'tag_garbage'},
                            {id = 'tag_handy'},
                        },
                        banned_other = {
                        }
                    }
                },

                {
                    name = "Rare Edition",
                    id = 'c_rare_edition_1',
                    rules = {
                        custom = {
                        },
                        modifiers = {
                            {id = 'consumable_slots', value = 1},
                        }
                    },
                    jokers = {
                        {id = 'j_collector'}
                    },
                    consumeables = {
                        {id = 'c_wheel_of_fortune'}
                    },
                    vouchers = {
                    },
                    deck = {
                        type = 'Challenge Deck'
                    },
                    restrictions = {
                        banned_cards = {
                            {id = 'c_fool'},
                            {id = 'c_magician'},
                            {id = 'c_high_priestess'},
                            {id = 'c_emperor'},
                            {id = 'c_empress'},
                            {id = 'c_justice'},
                            {id = 'c_world'},
                            {id = 'c_judgement_rev'},
                            {id = 'c_sun'},
                            {id = 'c_moon'},
                            {id = 'c_star'},
                            {id = 'c_death'},
                            {id = 'c_hanged_man'},
                            {id = 'c_hermit'},
                            {id = 'c_temperance'},
                            {id = 'c_heirophant'},
                            {id = 'c_judgement'},
                            {id = 'c_strength'},
                            {id = 'c_chariot'},
                            {id = 'c_devil'},
                            {id = 'c_tower'},
                            {id = 'c_lovers'},
                            {id = 'c_fool_rev'},
                            {id = 'c_magician_rev'},
                            {id = 'c_high_priestess_rev'},
                            {id = 'c_emperor_rev'},
                            {id = 'c_empress_rev'},
                            {id = 'c_justice_rev'},
                            {id = 'c_world_rev'},
                            {id = 'c_wheel_of_fortune_rev'},
                            {id = 'c_sun_rev'},
                            {id = 'c_moon_rev'},
                            {id = 'c_star_rev'},
                            {id = 'c_death_rev'},
                            {id = 'c_hanged_man_rev'},
                            {id = 'c_hermit_rev'},
                            {id = 'c_temperance_rev'},
                            {id = 'c_heirophant_rev'},
                            {id = 'c_strength_rev'},
                            {id = 'c_chariot_rev'},
                            {id = 'c_devil_rev'},
                            {id = 'c_tower_rev'},
                            {id = 'c_lovers_rev'},
                        },
                        banned_tags = {
                        },
                        banned_other = {
                        }
                    }
                },

                {
                    name = "Dark Forest",
                    id = 'c_dark_forest_1',
                    rules = {
                        custom = {
                        },
                        modifiers = {
                        }
                    },
                    jokers = {
                        {id = 'j_dusk', eternal = true},
                    },
                    consumeables = {
                    },
                    vouchers = {
                    },
                    deck = {
                        cards = {{s='D',r='2',e='m_wooden',},{s='D',r='3',e='m_wooden',},{s='D',r='4',e='m_wooden',},{s='D',r='5',e='m_wooden',},{s='D',r='6',e='m_wooden',},{s='D',r='7',e='m_wooden',},{s='D',r='8',e='m_wooden',},{s='D',r='9',e='m_wooden',},{s='D',r='T',e='m_wooden',},{s='D',r='J',e='m_wooden',},{s='D',r='Q',e='m_wooden',},{s='D',r='K',e='m_wooden',},{s='D',r='A',e='m_wooden',},{s='C',r='2',e='m_wooden',},{s='C',r='3',e='m_wooden',},{s='C',r='4',e='m_wooden',},{s='C',r='5',e='m_wooden',},{s='C',r='6',e='m_wooden',},{s='C',r='7',e='m_wooden',},{s='C',r='8',e='m_wooden',},{s='C',r='9',e='m_wooden',},{s='C',r='T',e='m_wooden',},{s='C',r='J',e='m_wooden',},{s='C',r='Q',e='m_wooden',},{s='C',r='K',e='m_wooden',},{s='C',r='A',e='m_wooden',},{s='H',r='2',e='m_wooden',},{s='H',r='3',e='m_wooden',},{s='H',r='4',e='m_wooden',},{s='H',r='5',e='m_wooden',},{s='H',r='6',e='m_wooden',},{s='H',r='7',e='m_wooden',},{s='H',r='8',e='m_wooden',},{s='H',r='9',e='m_wooden',},{s='H',r='T',e='m_wooden',},{s='H',r='J',e='m_wooden',},{s='H',r='Q',e='m_wooden',},{s='H',r='K',e='m_wooden',},{s='H',r='A',e='m_wooden',},{s='S',r='2',e='m_wooden',},{s='S',r='3',e='m_wooden',},{s='S',r='4',e='m_wooden',},{s='S',r='5',e='m_wooden',},{s='S',r='6',e='m_wooden',},{s='S',r='7',e='m_wooden',},{s='S',r='8',e='m_wooden',},{s='S',r='9',e='m_wooden',},{s='S',r='T',e='m_wooden',},{s='S',r='J',e='m_wooden',},{s='S',r='Q',e='m_wooden',},{s='S',r='K',e='m_wooden',},{s='S',r='A',e='m_wooden',},},
                        type = 'Challenge Deck'
                    },
                    restrictions = {
                        banned_cards = {
                        },
                        banned_tags = {
                        },
                        banned_other = {
                        }
                    }
                },

                {
                    name = "Nothing up my sleeves",
                    id = 'c_nothing_sleeves_1',
                    rules = {
                        custom = {
                        },
                        modifiers = {
                        }
                    },
                    jokers = {
                        {id = 'j_mime'}
                    },
                    consumeables = {
                    },
                    vouchers = {
                    },
                    deck = {
                        cards = {{s='D',r='2',e='m_steel'},{s='D',r='3',},{s='D',r='4',},{s='D',r='5',},{s='D',r='6',},{s='D',r='7',},{s='D',r='8',e='m_mult_rev'},{s='D',r='9',},{s='D',r='T',},{s='D',r='J',},{s='D',r='Q',e='m_fools_gold'},{s='D',r='K',e='m_bonus_rev'},{s='D',r='A',e='m_brass'},{s='C',r='2',e='m_steel'},{s='C',r='3',},{s='C',r='4',},{s='C',r='5',},{s='C',r='6',},{s='C',r='7',},{s='C',r='8',e='m_mult_rev'},{s='C',r='9',},{s='C',r='T',},{s='C',r='J',},{s='C',r='Q',e='m_fools_gold'},{s='C',r='K',e='m_bonus_rev'},{s='C',r='A',e='m_brass'},{s='H',r='2',e='m_steel'},{s='H',r='3',},{s='H',r='4',},{s='H',r='5',},{s='H',r='6',},{s='H',r='7',},{s='H',r='8',e='m_mult_rev'},{s='H',r='9',},{s='H',r='T',},{s='H',r='J',},{s='H',r='Q',e='m_fools_gold'},{s='H',r='K',e='m_bonus_rev'},{s='H',r='A',e='m_brass'},{s='S',r='2',e='m_steel'},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',e='m_mult_rev'},{s='S',r='9',},{s='S',r='T',},{s='S',r='J',},{s='S',r='Q',e='m_fools_gold'},{s='S',r='K',e='m_bonus_rev'},{s='S',r='A',e='m_brass'},},
                        type = 'Challenge Deck'
                    },
                    restrictions = {
                        banned_cards = {
                        },
                        banned_tags = {
                        },
                        banned_other = {
                        }
                    }
                },


                {
                    name = 'Midas Contagion',
                        id = 'midas_contagion_1',
                        rules = {
                            custom = {
                            },
                            modifiers = {
                            }
                        },
                        jokers = {
                            {id = 'j_midas_mask', eternal=true},
                            {id = 'j_special_snowflake'}
                        },
                        consumeables = {
                        },
                        vouchers = {
                        },
                        deck = {
                            -- wooden, glass, lucky, unlucky, wild, fools gold, mult rev, mult, bonus rev, bonus, brass, steel
                            cards = {{s='C',r='K',e='m_wooden'}, {s='S',r='K',e='m_glass'},{s='H',r='K',e='m_lucky'}, {s='D',r='K',e='m_unlucky'}, {s='D',r='Q',e='m_wild'}, {s='C',r='Q',e='m_fools_gold'}, {s='H',r='Q',e='m_mult_rev'}, {s='S',r='Q',e='m_mult'}, {s='D',r='J',e='m_bonus'}, {s='C',r='J',e='m_bonus_rev'}, {s='H',r='J',e='m_brass'}, {s='S',r='J',e='m_steel'}},
                            type = 'Challenge Deck'
                        },
                        restrictions = {
                            banned_cards = {
                            },
                            banned_tags = {
                                {id = 'tag_garbage'},
                                {id = 'tag_handy'},
                            },
                            banned_other = {
                            }
                        }
                    },
    }

    


    for i=1, #challenges do
        table.insert(G.CHALLENGES, #G.CHALLENGES+1,challenges[i])
        G.localization.misc.challenge_names[challenges[i].id] = challenges[i].name
    end

    -- Update localization
    init_localization()
end

-- Init variables
----------------------------------------------
------------MOD CODE END----------------------