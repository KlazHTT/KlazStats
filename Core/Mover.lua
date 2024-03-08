local addon, ns = ...
local T = ns.T

--------------------------------------------------------------------------------
-- # CORE > MOVER
--------------------------------------------------------------------------------

T.Anchor = CreateFrame('Frame', 'KlazStatsAnchor', UIParent)
T.Anchor:SetSize(400, 25)
if not T.Anchor.SetBackdrop then Mixin(T.Anchor, BackdropTemplateMixin) end
T.Anchor:SetBackdrop(T.Backdrop)
T.Anchor:SetBackdropColor(0.02, 0.02, 0.02, 0.8)
T.Anchor:SetBackdropBorderColor(T.ClassColor.r, T.ClassColor.g, T.ClassColor.b, 1)
T.Anchor:SetFrameStrata('HIGH')
T.Anchor:EnableMouse(true)
T.Anchor:SetMovable(true)
T.Anchor:SetUserPlaced(true)
T.Anchor:SetClampedToScreen(true)
T.Anchor:RegisterForDrag('LeftButton')
T.Anchor:RegisterEvent('PLAYER_LOGIN')
T.Anchor:SetScript('OnEvent', function(self, event)
  self:ClearAllPoints()
  self:SetPoint(KlazStatsDB.Position[1], UIParent, KlazStatsDB.Position[2], KlazStatsDB.Position[3], KlazStatsDB.Position[4])

  if KlazStatsDB.UserPlaced then self:Hide() end
end)
T.Anchor:SetScript('OnDragStart', function(self) self:StartMoving() end)
T.Anchor:SetScript('OnDragStop', function(self)
  self:StopMovingOrSizing()
  local point, _, relativePoint, xOffset, yOffset = self:GetPoint()
  KlazStatsDB.Position[1] = point
  KlazStatsDB.Position[2] = relativePoint
  KlazStatsDB.Position[3] = xOffset
  KlazStatsDB.Position[4] = yOffset
end)

T.Anchor.text = T.Anchor:CreateFontString(nil, 'OVERLAY', 'GameFontHighlight')
T.Anchor.text:SetAllPoints(T.Anchor)
T.Anchor.text:SetText('Klaz|cff1994ffStats|r — |cnRED_FONT_COLOR:/kstats lock|r')
