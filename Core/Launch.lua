local addon, ns = ...
local C = {}
ns.C = C

--------------------------------------------------------------------------------
-- # CORE > LAUNCH
--------------------------------------------------------------------------------

C.Settings = {
  Position = {'TOP', 'TOP', 0, 0},
  UserPlaced = true,
  Font = {
    Family = STANDARD_TEXT_FONT,
    Size = 12,
    Style = 'OUTLINE',
    Align = 'CENTER',
  },
}

local loader = CreateFrame('Frame')
loader:RegisterEvent('ADDON_LOADED')
loader:SetScript('OnEvent', function(self, addon)
  if addon ~= KlazStats then
    local function initDB(db, defaults)
      if type(db) ~= 'table' then db = {} end
      if type(defaults) ~= 'table' then return db end

      for k, v in pairs(defaults) do
        if type(v) == 'table' then
          db[k] = initDB(db[k], v)
        elseif type(v) ~= type(db[k]) then
          db[k] = v
        end
      end

      return db
    end

    KlazStatsDB = initDB(KlazStatsDB, C.Settings)
    C.Settings = KlazStatsDB

    self:UnregisterEvent('ADDON_LOADED')
  end
end)
