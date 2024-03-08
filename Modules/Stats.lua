local addon, ns = ...
local L = ns.L
local T = ns.T

--------------------------------------------------------------------------------
-- # MODULES > STATS
--------------------------------------------------------------------------------

local fontFamily = STANDARD_TEXT_FONT
local fontSize = 12
local fontOutline = 'OUTLINE'
local fontAlign = 'CENTER'

local stats = CreateFrame('Frame', 'KlazStats', UIParent)
stats:SetAllPoints(T.Anchor)

stats.text = stats:CreateFontString(nil, 'BACKGROUND')
stats.text:SetPoint(fontAlign, stats)
stats.text:SetJustifyH(fontAlign)
stats.text:SetFont(fontFamily, fontSize, fontOutline)
stats.text:SetTextColor(T.ClassColor.r, T.ClassColor.g, T.ClassColor.b)

-- ## UPDATE
--------------------------------------------------------------------------------

local lastUpdate = 0
local function UpdateStats(self, elapsed)
  lastUpdate = lastUpdate + elapsed

  if lastUpdate > 1 then
    lastUpdate = 0
    stats.text:SetText(T.GetLootSpec()..T.GetFPS()..T.GetLatency()..T.GetDurability()..T.GetTime())
  end
end

stats:RegisterEvent('PLAYER_LOGIN')
stats:RegisterEvent('PLAYER_ENTERING_WORLD')
stats:RegisterEvent('UPDATE_INVENTORY_DURABILITY')
stats:RegisterEvent('PLAYER_LOOT_SPEC_UPDATED')
stats:RegisterEvent('PLAYER_SPECIALIZATION_CHANGED')
stats:SetScript('OnEvent', function(self, event)
  self:SetScript('OnUpdate', UpdateStats)
end)
