--- STEAMODDED HEADER
--- MOD_NAME: Challenges
--- MOD_ID: JellyChallenges
--- MOD_AUTHOR: [JamesTheJellyfish]
--- MOD_DESCRIPTION: Adds 10 new challenges to the game that utilize the new tarots and jokers added.

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
                name = "Level Up",
                id = 'c_level_up_1',
                rules = {
                    custom = {
                        {id = 'no_shop_jokers'},
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
                        {id = 'j_pessimist'},
                        {id = 'j_stencil'},
                        {id = 'j_gros_michel'},
                        {id = 'j_popcorn'},
                        {id = 'j_turtle_bean'},
                        {id = 'j_brownie'},
                        {id = 'j_caviar'}
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
                        cards = {{s='D',r='2'},{s='D',r='2'},{s='D',r='2'},{s='D',r='2'},{s='C',r='2'},{s='C',r='2'},{s='C',r='2'},{s='C',r='2'},{s='S',r='K'},{s='S',r='K'},{s='S',r='K'},{s='S',r='K'},{s='H',r='K'},{s='H',r='K'},{s='H',r='K'},{s='H',r='K'},{s='C',r='K',e='m_wooden',g='Red',d='polychrome'},{s='S',r='2',e='m_bonus',g='Purple',d='holo'},{s='H',r='2',e='m_mult', g='Gold',d='foil'},{s='D',r='K',e='m_lucky', g='Blue'}},
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
                        {id = 'j_mime'},
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
            {
            name = 'Play Your Whole Deck',
                id = 'c_play_deck_challenge',
                rules = {
                    custom = {
                    },
                    modifiers = {
                        {id = 'joker_slots', value = 6},
                    }
                },
                jokers = {
                    {id = 'j_pierrot', eternal=true},
                    {id = 'j_pierrot', eternal=true},
                    {id = 'j_pierrot', eternal=true},
                    {id = 'j_greedy_pot', eternal=true},
                    {id = 'j_greedy_pot', eternal=true},
                },
                consumeables = {
                },
                vouchers = {
                },
                deck = {
                    cards = {{s='D',r='2',},{s='D',r='3',},{s='D',r='4',},{s='D',r='5',},{s='D',r='6',},{s='D',r='7',},{s='D',r='8',},{s='D',r='9',},{s='D',r='T',},{s='D',r='J',},{s='D',r='Q',},{s='D',r='K',},{s='D',r='A',},{s='C',r='2',},{s='C',r='3',},{s='C',r='4',},{s='C',r='5',},{s='C',r='6',},{s='C',r='7',},{s='C',r='8',},{s='C',r='9',},{s='C',r='T',},{s='C',r='J',},{s='C',r='Q',},{s='C',r='K',},{s='C',r='A',},{s='H',r='2',},{s='H',r='3',},{s='H',r='4',},{s='H',r='5',},{s='H',r='6',},{s='H',r='7',},{s='H',r='8',},{s='H',r='9',},{s='H',r='T',},{s='H',r='J',},{s='H',r='Q',},{s='H',r='K',},{s='H',r='A',},{s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',},{s='S',r='T',},{s='S',r='J',},{s='S',r='Q',},{s='S',r='K',},{s='S',r='A',},{s='D',r='2',},{s='D',r='3',},{s='D',r='4',},{s='D',r='5',},{s='D',r='6',},{s='D',r='7',},{s='D',r='8',},{s='D',r='9',},{s='D',r='T',},{s='D',r='J',},{s='D',r='Q',},{s='D',r='K',},{s='D',r='A',},{s='C',r='2',},{s='C',r='3',},{s='C',r='4',},{s='C',r='5',},{s='C',r='6',},{s='C',r='7',},{s='C',r='8',},{s='C',r='9',},{s='C',r='T',},{s='C',r='J',},{s='C',r='Q',},{s='C',r='K',},{s='C',r='A',},{s='H',r='2',},{s='H',r='3',},{s='H',r='4',},{s='H',r='5',},{s='H',r='6',},{s='H',r='7',},{s='H',r='8',},{s='H',r='9',},{s='H',r='T',},{s='H',r='J',},{s='H',r='Q',},{s='H',r='K',},{s='H',r='A',},{s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',},{s='S',r='T',},{s='S',r='J',},{s='S',r='Q',},{s='S',r='K',},{s='S',r='A',},{s='D',r='2',},{s='D',r='3',},{s='D',r='4',},{s='D',r='5',},{s='D',r='6',},{s='D',r='7',},{s='D',r='8',},{s='D',r='9',},{s='D',r='T',},{s='D',r='J',},{s='D',r='Q',},{s='D',r='K',},{s='D',r='A',},{s='C',r='2',},{s='C',r='3',},{s='C',r='4',},{s='C',r='5',},{s='C',r='6',},{s='C',r='7',},{s='C',r='8',},{s='C',r='9',},{s='C',r='T',},{s='C',r='J',},{s='C',r='Q',},{s='C',r='K',},{s='C',r='A',},{s='H',r='2',},{s='H',r='3',},{s='H',r='4',},{s='H',r='5',},{s='H',r='6',},{s='H',r='7',},{s='H',r='8',},{s='H',r='9',},{s='H',r='T',},{s='H',r='J',},{s='H',r='Q',},{s='H',r='K',},{s='H',r='A',},{s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',},{s='S',r='T',},{s='S',r='J',},{s='S',r='Q',},{s='S',r='K',},{s='S',r='A',},{s='D',r='2',},{s='D',r='3',},{s='D',r='4',},{s='D',r='5',},{s='D',r='6',},{s='D',r='7',},{s='D',r='8',},{s='D',r='9',},{s='D',r='T',},{s='D',r='J',},{s='D',r='Q',},{s='D',r='K',},{s='D',r='A',},{s='C',r='2',},{s='C',r='3',},{s='C',r='4',},{s='C',r='5',},{s='C',r='6',},{s='C',r='7',},{s='C',r='8',},{s='C',r='9',},{s='C',r='T',},{s='C',r='J',},{s='C',r='Q',},{s='C',r='K',},{s='C',r='A',},{s='H',r='2',},{s='H',r='3',},{s='H',r='4',},{s='H',r='5',},{s='H',r='6',},{s='H',r='7',},{s='H',r='8',},{s='H',r='9',},{s='H',r='T',},{s='H',r='J',},{s='H',r='Q',},{s='H',r='K',},{s='H',r='A',},{s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',},{s='S',r='T',},{s='S',r='J',},{s='S',r='Q',},{s='S',r='K',},{s='S',r='A',},},
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
                name = "Editions Go Bye-Bye",
                id = 'c_edition_eater_1',
                rules = {
                    custom = {
                    },
                    modifiers = {
                        {id = 'consumable_slots', value = 1},
                    }
                },
                jokers = {
                    {id = 'j_edition_eater'}
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
            name = "Cold Christmas Morning",
                id = 'c_winter_1',
                rules = {
                    custom = {
                    },
                    modifiers = {
                    }
                },
                jokers = {
                    {id = 'j_krampus', eternal = true},
                    {id = 'j_furnace', eternal = true},

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
            name = "Insatiable Hunger",
                id = 'c_hungry_1',
                rules = {
                    custom = {
                    },
                    modifiers = {
                    }
                },
                jokers = {
                    {id = 'j_pink_menace', eternal = true},
                    {id = 'j_chef_joker', eternal = true},

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
            name = "Kept it Cold For You",
                id = 'c_cold_1',
                rules = {
                    custom = {
                    },
                    modifiers = {
                    }
                },
                jokers = {
                    {id = 'j_fridge', eternal = true},
                    {id = 'j_ice_cream'},
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
                name = "Miner",
                id = 'c_miner_1',
                rules = {
                    custom = {
                    },
                    modifiers = {
                    }
                },
                jokers = {
                    {id = 'j_mineral_deposit', eternal = true},
                },
                consumeables = {
                },
                vouchers = {
                },
                deck = {
                    cards = {{s='D',r='2',e='m_stone'},{s='D',r='3',e='m_stone'},{s='D',r='4',e='m_stone'},{s='D',r='5',e='m_stone'},{s='D',r='6',e='m_stone'},{s='D',r='7',e='m_stone'},{s='D',r='8',e='m_stone'},{s='D',r='9',e='m_stone'},{s='D',r='T',e='m_stone'},{s='D',r='J',e='m_stone'},{s='D',r='Q',e='m_stone'},{s='D',r='K',e='m_stone'},{s='D',r='A',e='m_stone'},{s='C',r='2',e='m_coal'},{s='C',r='3',e='m_coal'},{s='C',r='4',e='m_coal'},{s='C',r='5',e='m_coal'},{s='C',r='6',e='m_coal'},{s='C',r='7',e='m_coal'},{s='C',r='8',e='m_coal'},{s='C',r='9',e='m_coal'},{s='C',r='T',e='m_coal'},{s='C',r='J',e='m_coal'},{s='C',r='Q',e='m_coal'},{s='C',r='K',e='m_coal'},{s='C',r='A',e='m_coal'},{s='H',r='2',e='m_stone'},{s='H',r='3',e='m_stone'},{s='H',r='4',e='m_stone'},{s='H',r='5',e='m_stone'},{s='H',r='6',e='m_stone'},{s='H',r='7',e='m_stone'},{s='H',r='8',e='m_stone'},{s='H',r='9',e='m_stone'},{s='H',r='T',e='m_stone'},{s='H',r='J',e='m_stone'},{s='H',r='Q',e='m_stone'},{s='H',r='K',e='m_stone'},{s='H',r='A',e='m_stone'},{s='S',r='2',e='m_coal'},{s='S',r='3',e='m_coal'},{s='S',r='4',e='m_coal'},{s='S',r='5',e='m_coal'},{s='S',r='6',e='m_coal'},{s='S',r='7',e='m_coal'},{s='S',r='8',e='m_coal'},{s='S',r='9',e='m_coal'},{s='S',r='T',e='m_coal'},{s='S',r='J',e='m_coal'},{s='S',r='Q',e='m_coal'},{s='S',r='K',e='m_coal'},{s='S',r='A',e='m_coal'},},
                    type = 'Challenge Deck'
                },
                restrictions = {
                    banned_cards = {
                        {id = 'j_vampire'},
                        {id = 'j_midas_mask'},
                    },
                    banned_tags = {
                    },
                    banned_other = {
                    }
                }
            },

            {
                name = "Terrible Fruit",
                    id = 'c_bad_apple',
                    rules = {
                        custom = {
                        },
                        modifiers = {
                        }
                    },
                    jokers = {
                        {id = 'j_bad_apple_joker', eternal = true},
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
                name = "Garden of Eden",
                    id = 'c_garden_of_eden',
                    rules = {
                        custom = {
                        },
                        modifiers = {
                            {id = 'joker_slots', value = 6},
                        }
                    },
                    jokers = {
                        {id = 'j_greener_pastures', eternal = true},
                        {id = 'j_greener_pastures', eternal = true},
                        {id = 'j_greener_pastures', eternal = true},
                        {id = 'j_greener_pastures', eternal = true},
                        {id = 'j_greener_pastures', eternal = true},
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
                    name = "Well Dressed",
                    id = 'c_well_dressed_1',
                    rules = {
                        custom = {
                            {id = 'gold_stake'},
                        },
                        modifiers = {
                        }
                    },
                    jokers = {
                        {id = 'j_magnate', eternal = true},
                    },
                    consumeables = {
                    },
                    vouchers = {
                        {id = 'v_directors_cut'},
                    },
                    deck = {
                        cards = {{s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',},{s='S',r='T',},{s='S',r='J',},{s='S',r='Q',},{s='S',r='K',},{s='S',r='A',},{s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',},{s='S',r='T',},{s='S',r='J',},{s='S',r='Q',},{s='S',r='K',},{s='S',r='A',},{s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',},{s='S',r='T',},{s='S',r='J',},{s='S',r='Q',},{s='S',r='K',},{s='S',r='A',},{s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',},{s='S',r='T',},{s='S',r='J',},{s='S',r='Q',},{s='S',r='K',},{s='S',r='A',},},
                        type = 'Challenge Deck'
                    },
                    restrictions = {
                        banned_cards = {
                            {id = 'c_star'},
                            {id = 'c_moon'},
                            {id = 'c_sun'},
                            {id = 'c_world'},
                            {id = 'c_world_rev'},
                            {id = 'c_sun_rev'},
                            {id = 'c_moon_rev'},
                            {id = 'c_star_rev'},
                            {id = 'c_hanged_man_rev'},
                            {id = 'j_certificate'},
                            {id = 'j_bloodstone'},
                            {id = 'j_rough_gem'},
                            {id = 'j_onyx_agate'},
                            {id = 'j_lusty_joker'},
                            {id = 'j_greedy_joker'},
                            {id = 'j_gluttenous_joker'},
                            {id = 'j_smeared'},
                            {id = 'j_seeing_double'},
                            {id = 'j_flower_pot'},
                            {id = 'j_safari'},
                            {id = 'c_familiar'},
                            {id = 'c_grim'},
                            {id = 'c_incantation'},
                            {id = 'c_sigil'},

                        },
                        banned_tags = {
                        },
                        banned_other = {
                        }
                    }
                },

                {
                    name = "Pica",
                    id = 'c_pica_1',
                    rules = {
                        custom = {
                            {id = 'pica'},
                            {id = 'reduce'},
                            {id = 'eat'},
                        },
                        modifiers = {
                        }
                    },
                    jokers = {
                        {id = 'j_chef_joker', eternal = true},
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
                            {id = 'j_pink_menace'},
                        },
                        banned_tags = {
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
    G.localization.misc.v_text.ch_c_gold_stake = {
        "Apply {C:attention}Gold Stake{} rules",
    }
    G.localization.misc.v_text.ch_c_pica = {
        "All jokers are considered {C:attention}Food Jokers{}."
    }
    G.localization.misc.v_text.ch_c_reduce = {
        "Jokers decrease in potency by {C:green}25%{} each round,"
    }
    G.localization.misc.v_text.ch_c_eat = {
        "Jokers are eaten after {C:red}3{} rounds"
    }

    
    -- Update localization
    init_localization()
end

local start_runref = Game.start_run
function Game.start_run(self, args)
	start_runref(self, args)
    if args.challenge then
        if self.GAME.modifiers["gold_stake"] then
            self.GAME.modifiers.no_blind_reward = self.GAME.modifiers.no_blind_reward or {}
            self.GAME.modifiers.no_blind_reward.Small = true
            self.GAME.modifiers.scaling = 3
            self.GAME.modifiers.enable_eternals_in_shop = true
            self.GAME.modifiers.booster_ante_scaling = true
            self.GAME.stake = 8
        end
        if self.GAME.modifiers["pica"] then
            G.GAME.food_jokers_list = {}
            for k, v in pairs(G.P_CENTER_POOLS['Joker']) do
                G.GAME.food_jokers_list[v.name] = v.key
            end
        end
    end
end

-- this is heavily taken from Mika's mod's Dagonet joker code.
local attributes = {
    mult = { key = 'mult_pica', min = 0 },
    mult_mod = { key = 'mult_mod_pica', min = 0 },
    chips = { key = 'chips_pica', min = 0 },
    chip_mod = { key = 'chip_mod_pica', min = 0 },
    Xmult = { key = 'Xmult_pica', min = 1 },
    Xmult_mod = { key = 'Xmult_mod_pica', min = 0 },
    x_mult = { key = 'x_mult_pica', min = 1 },
    t_mult = { key = 't_mult_pica', min = 0 },
    t_chips = { key = 't_chips_pica', min = 0 },
    s_mult = { key = 's_mult_pica', min = 0 },
    dollars = { key = 'dollars_pica', min = 0, int_only = true},
    hand_add = { key = 'hand_add_pica', min = 0 , int_only = true},
    discard_sub = { key = 'discard_sub_pica', min = 0 , int_only = true},
    odds = { key = 'odds_pica', min = 0 },
    faces = { key = 'faces_pica', min = 0, int_only = true },
    max = { key = 'max_pica', min = 0 },
    min = { key = 'min_pica', min = 0 },
    every = { key = 'every_pica', min = 0 ,int_only = true},
    increase = { key = 'increase_pica', min = 0 , int_only = true},
    h_size = { key = 'h_size_pica', min = 0 , int_only = true},
    d_size = { key = 'd_size_pica', min = 0 , int_only = true},
    h_mod = { key = 'h_mod_pica', min = 0 },
    h_plays = { key = 'h_plays_pica', min = 0 , int_only = true},
    discards = { key = 'discards_pica', min = 0, int_only = true},
    old = { key = 'old_pica', min = 0 },
    req = { key = 'req_pica', min = 0 },
    percentage = { key = 'percentage_pica', min = 0 },
    base = { key = 'base_pica', min = 0 },
    dollar_gain_one = { key = 'dollar_gain_one_pica', min = 0 , int_only = true},
    dollar_gain_two = { key = 'dollar_gain_two_pica', min = 0 , int_only = true},
    dollar_gain_three = { key = 'dollar_gain_three_pica', min = 0 , int_only = true},
    dollar_gain_four = { key = 'dollar_gain_four_pica', min = 0 , int_only = true},
    dollar_gain_five = { key = 'dollar_gain_five_pica', min = 0, int_only = true},
    extra = { key = 'extra_pica', min = 0 }
}

-- Increase base attributes
local function multiply_attributes(k, v, place, multiplier)
    sendDebugMessage("Entered New multiply_attributes with key " .. k  .. " and place " .. tostring(place))
    local attr = attributes[k]

    if not attr or type(v) == "string" then
        return
    end

    -- Handle extra seperately
    if type(v) == "table" then
        for k2, v2 in pairs(place.extra) do
            sendDebugMessage("updating: " .. k2)
            multiply_attributes(k2, v2, place.extra, multiplier)
        end
    else
        if place[attr.key] and attr.int_only then
            v = place[attr.key]
        end
        local new_val = v * multiplier
        place[attr.key] = new_val
        if attr.int_only then
            new_val = math.floor(0.5 +  new_val)
        else
            new_val = tonumber(string.format("%.3f", new_val))
        end
        sendDebugMessage(k .. " is now updated to " .. tostring(new_val))
        place[k] = math.max(new_val, attr.min)
    sendDebugMessage("Left multiply_attributes with key " .. k  .. " and place " .. tostring(place))
    end
end

card_durations = {}
local reset_mail_rank_ref = reset_mail_rank
function reset_mail_rank()
    reset_mail_rank_ref()
    if G.GAME.modifiers["reduce"] then
        local multipliers = {[1] = 3/4, [2] = 2/3, [3] = 1/2, [4] = 0}
        for _, v in ipairs(G.jokers.cards) do
            if not v.ability.eternal and (not next(find_joker("Fridge")) or v.ability.name == "Fridge") then
                card_durations[v] = card_durations[v] and card_durations[v] + 1 or 1
                -- Increase all numbers
                for k2, v2 in pairs(v.ability) do
                    multiply_attributes(k2, v2, v.ability, multipliers[card_durations[v]])
                end
                card_eval_status_text(v, 'extra', nil, nil, nil, {message = "-25%", colour = G.C.RED})
            end
        end
    end
    if G.GAME.modifiers["eat"] then
        for _, v in ipairs(G.jokers.cards) do
            if card_durations[v] == 3 then
                local sliced_card = v
                sliced_card.getting_sliced = true
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                card_eval_status_text(sliced_card, 'extra', nil, nil, nil, {message = localize('k_eaten_ex'), colour = G.C.RED})
                G.E_MANAGER:add_event(Event({func = function()
                    G.GAME.joker_buffer = 0
                    sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
                    G.GAME.foods_eaten = G.GAME.foods_eaten + 1
                    play_sound('slice1', 0.96+math.random()*0.08)
                    card_durations[v] = nil
                return true end }))
            end
        end
    end
end

-- Init variables
----------------------------------------------
------------MOD CODE END----------------------