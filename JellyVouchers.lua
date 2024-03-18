--- STEAMODDED HEADER
--- MOD_NAME: Jelly's Vouchers
--- MOD_ID: JellyVouchers
--- MOD_AUTHOR: [JamesTheJellyfish]
--- MOD_DESCRIPTION: A set of Vouchers

----------------------------------------------
------------MOD CODE -------------------------
function SMODS.INIT.JellyVouchers()
  sendDebugMessage("Loaded JellyVouchers~")

  local localization = {
          v_dumbell = {
               name = "Dumbell",
                   text = {
                      "Debuffed cards instead score",
                      "at {X:chips,C:white}X#1#{} chips",
              },
          },

          v_barbell = {
               name = "Barbell",
                   text = {
                      "Debuffed cards insteaad score",
                      "at {X:chips,C:white}X#1#{} chips",
              },
          },

  }
 

  init_localization()
  updateLocalizationJelly(localization, "Voucher")

  local vouchers = {
    v_dumbell        =   {order = 1,     discovered = true, unlocked = true, available = true, cost = 10, name = "Dumbell", pos = {x=0,y=0}, set = "Voucher", config = {extra = 0.125}},
    v_barbell        =   {order = 2,     discovered = true, unlocked = true, available = true, cost = 10, name = "Barbell", pos = {x=0,y=1}, set = "Voucher", config = {extra = 0.25}, requires = {'v_dumbell'}},
  }

  -- Add sprites
  SMODS.Sprite:new("JellyVouchers", SMODS.findModByID("JellyVouchers").path, "Vouchers_JellyMod.png", 71, 95, "asset_atli")
      :register()
  addVouchersToPools(vouchers, "JellyVouchers")
end


local init_game_objectobjref = Game.init_game_object
function Game.init_game_object(self)
    local gameObj = init_game_objectobjref(self)
    gameObj.debuff_factor = 0
    gameObj.rebuffed_cards = {}
    return gameObj
end


local chip_bonus_ref = Card.get_chip_bonus
function Card:get_chip_bonus()
  if G.GAME.debuff_factor ~= 0 then
    sendDebugMessage("rebuffed_size: " .. #G.GAME.rebuffed_cards)
    for i = 1,#G.GAME.rebuffed_cards do
        if G.GAME.rebuffed_cards[i] == self then return G.GAME.debuff_factor * chip_bonus_ref(self) end
    end
  end
  return chip_bonus_ref(self)
end

-- this is definitely the incorrect way to do this, but it works.
local calculate_joker_ref = Card.calculate_joker
function Card.calculate_joker(self, context)
  local calc_ref = calculate_joker_ref(self, context)
  if G.GAME.debuff_factor ~= 0 then 
    if context.before and not context.blueprint then
      for _, v in ipairs(context.full_hand) do
          if v.debuff then
              v.debuff = false
              G.GAME.rebuffed_cards[#G.GAME.rebuffed_cards+1] = v
              G.E_MANAGER:add_event(Event({
                  func = function()
                      v:juice_up()
                      return true
                  end
              }))
          end
        end
      end
    if context.after and not context.blueprint then
      G.GAME.rebuffed_cards = {}
    end
    end
  return calc_ref
end

local apply_to_run_ref = Card.apply_to_run
function Card:apply_to_run(center)
  local center_table = {
      name = center and center.name or self and self.ability.name,
      extra = center and center.config.extra or self and self.ability.extra
  }
  if center_table.name == 'Dumbell' or center_table.name == 'Barbell' then
    G.E_MANAGER:add_event(Event({func = function()
        G.GAME.debuff_factor = center_table.extra
        return true end }))
  end
  apply_to_run_ref(self, center)
end

local generate_card_ui_ref = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
    local customCard = false
    if _c.name == 'Barbell' or _c.name == 'Dumbell' then
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
      if _c.name == 'Barbell' then loc_vars = {_c.config.extra}
      elseif _c.name == 'Dumbell' then loc_vars = {_c.config.extra}
      end
      localize{type = 'descriptions', key = _c.key, set = _c.set, nodes = desc_nodes, vars = loc_vars}
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
    elseif _c.set == 'Booster' then 
    elseif _c.set == 'Spectral' then 
    elseif _c.set == 'Planet' then
    elseif _c.set == 'Tarot' then
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




function addVouchersToPools(voucherTable, atlas)
  -- Add Jokers to center
  for k, v in pairsByOrder(voucherTable) do
      v.key = k
      if atlas then v.atlas = atlas end
      v.order = table_length(G.P_CENTER_POOLS['Voucher']) + v.order
      G.P_CENTERS[k] = v
      table.insert(G.P_CENTER_POOLS['Voucher'], v)
  end

  table.sort(G.P_CENTER_POOLS["Voucher"], function(a, b)
      return a.order < b.order
  end)
end


----------------------------------------------
------------MOD CODE END----------------------