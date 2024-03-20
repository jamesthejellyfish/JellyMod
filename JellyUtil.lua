--- STEAMODDED HEADER
--- MOD_NAME: JellyUtil
--- MOD_ID: JellyUtil
--- MOD_AUTHOR: [JamesTheJellyfish]
--- MOD_DESCRIPTION: Utility mod to help the JellyTarots and JellyJokers mods function.
----------------------------------------------
------------MOD CODE -------------------------

function sortByOrder(t, arg1, arg2)
  if t[arg2].order == nil then return true
  elseif t[arg1].order == nil then return false
  else
    if t[arg1].order < t[arg2].order then return true
    elseif t[arg1].order == t[arg2].order then return true
    elseif t[arg1].order > t[arg2].order then return false
    end
  end
end

function pairsByOrder(t, f)
  local a = {}
  for n in pairs(t) do table.insert(a, n) end
  table.sort(a, function(a, b) return sortByOrder(t, a, b) end)
  local i = 0      -- iterator variable
  local iter = function ()   -- iterator function
    i = i + 1
    if a[i] == nil then return nil
    else return a[i], t[a[i]]
    end
  end
  return iter
end

function updateLocalizationJelly(localizationTable, cardType)
  for k, v in pairs(localizationTable) do
    G.localization.descriptions[cardType][k] = v
  end
  
  -- Update localization
  for g_k, group in pairs(G.localization) do
      if g_k == 'descriptions' then
          for _, set in pairs(group) do
              for _, center in pairs(set) do
                  center.text_parsed = {}
                  for _, line in ipairs(center.text) do
                      center.text_parsed[#center.text_parsed + 1] = loc_parse_string(line)
                  end
                  center.name_parsed = {}
                  for _, line in ipairs(type(center.name) == 'table' and center.name or {center.name}) do
                      center.name_parsed[#center.name_parsed + 1] = loc_parse_string(line)
                  end
                  if center.unlock then
                      center.unlock_parsed = {}
                      for _, line in ipairs(center.unlock) do
                          center.unlock_parsed[#center.unlock_parsed + 1] = loc_parse_string(line)
                      end
                  end
              end
          end
      end
  end
end

----------------------------------------------
------------MOD CODE END----------------------