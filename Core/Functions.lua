local addon, ns = ...
local T = {}
ns.T = T

--------------------------------------------------------------------------------
-- # CORE > FUNCTIONS
--------------------------------------------------------------------------------

-- ## FORMAT
--------------------------------------------------------------------------------

T.Backdrop = {
  bgFile = 'Interface\\Buttons\\WHITE8x8',
  edgeFile = 'Interface\\Buttons\\WHITE8x8',
  tileEdge = false,
  edgeSize = 1,
  insets = { left = 1, right = 1, top = 1, bottom = 1 },
}

T.ClassColor = RAID_CLASS_COLORS[select(2, UnitClass('player'))]

local function colorDurabilityPercent(perc)
  perc = perc > 1 and 1 or perc < 0 and 0 or perc
  local seg, relperc = math.modf(perc*2)
  local r1, g1, b1, r2, g2, b2 = select(seg*3+1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0)
  local r, g, b = r1+(r2-r1)*relperc, g1+(g2-g1)*relperc, b1+(b2-b1)*relperc
  return format('|cff%02x%02x%02x', r*255, g*255, b*255), r, g, b
end

-- ## MODULES
--------------------------------------------------------------------------------

T.GetLootSpec = function()
  local lootSpecID = GetLootSpecialization()
  local currentSpec = GetSpecialization()
  local currentSpecName = currentSpec and select(2,GetSpecializationInfo(currentSpec)) or 'None'

  if lootSpecID ~= 0 then
    return '|cnWHITE_FONT_COLOR:Loot:|r '..select(2, GetSpecializationInfoByID(lootSpecID))..'    '
  else
    return '|cnWHITE_FONT_COLOR:Loot:|r '..currentSpecName..'    '
  end
end

T.GetLatency = function()
  return '|cnWHITE_FONT_COLOR:'..select(3, GetNetStats())..' / '..select(4, GetNetStats())..'|r ms    '
end

T.GetFPS = function()
  return '|cnWHITE_FONT_COLOR:'..floor(GetFramerate())..'|r fps    '
end

local SLOTS = {}
for _, slot in pairs({
  'Head',
  'Shoulder',
  'Chest',
  'Waist',
  'Legs',
  'Feet',
  'Wrist',
  'Hands',
  'MainHand',
  'SecondaryHand'
}) do
  SLOTS[slot] = GetInventorySlotInfo(slot..'Slot')
end

T.GetDurability = function()
  local l = 1
  for slot, id in pairs(SLOTS) do
    local d, md = GetInventoryItemDurability(id)
    if d and md and md ~= 0 then
      l = math.min(d/md, l)
    end
  end
  return format('%s%d|r dur    ', colorDurabilityPercent(l), l*100)
end

T.GetTime = function()
  -- return 24-hour notation
  -- local time = date('%H:%M')
  -- return '|cnWHITE_FONT_COLOR:'..time..'|r '
  -- return 12-hour notation with AM/PM
  local time = date('|cnWHITE_FONT_COLOR:%I:%M|r %p')
  return time
end
