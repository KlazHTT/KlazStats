local addon, ns = ...
local L = ns.L
local T = ns.T

--------------------------------------------------------------------------------
-- # CORE > CONFIG
--------------------------------------------------------------------------------

-- ## RESET
--------------------------------------------------------------------------------

StaticPopupDialogs.KLAZSTATS_RESET = {
  text = L.CONFIG_POPUP_RESET,
  button1 = ACCEPT,
  button2 = CANCEL,
  OnAccept = function()
    KlazStatsDB.Position = {'TOP', 'TOP', 0, 0}
    T.Anchor:ClearAllPoints()
    T.Anchor:SetPoint(KlazStatsDB.Position[1], UIParent, KlazStatsDB.Position[2], KlazStatsDB.Position[3], KlazStatsDB.Position[4])
    KlazStatsDB.UserPlaced = true
    print('Klaz|cff1994ffStats|r — |cnYELLOW_FONT_COLOR:'..L.CONFIG_POPUP_RESET_OK..'!|r')
  end,
  OnCancel = function() end,
  showAlert = true,
  timeout = 0,
  whileDead = 1,
  hideOnEscape = true,
  preferredIndex = 5,
}

-- ## SLASH COMMAND
--------------------------------------------------------------------------------

SlashCmdList['KLAZSTATS'] = function(msg, editbox)
  if string.lower(msg) == 'reset' then
    StaticPopup_Show('KLAZSTATS_RESET')
  elseif string.lower(msg) == 'unlock' then
    if not T.Anchor:IsShown() then
      T.Anchor:Show()
      KlazStatsDB.UserPlaced = false
      print('Klaz|cff1994ffStats|r — |cnGREEN_FONT_COLOR:'..L.COMMAND_UNLOCK..'|r')
    end
  elseif string.lower(msg) == 'lock' then
    if not KlazStatsDB.UserPlaced then
      T.Anchor:Hide()
      KlazStatsDB.UserPlaced = true
      print('Klaz|cff1994ffStats|r — |cnRED_FONT_COLOR:'..L.COMMAND_LOCK..'|r')
    end
  else
    print('------------------------------------------')
    print('Klaz|cff1994ffStats|r')
    print('------------------------------------------')
    print('|cff1994ff/kstats|r — '..L.COMMAND_HELP_SHORT..'.')
    print('|cnGREEN_FONT_COLOR:/kstats unlock|r — '..L.COMMAND_HELP_UNLOCK..'.')
    print('|cnRED_FONT_COLOR:/kstats lock|r — '..L.COMMAND_HELP_LOCK..'.')
    print('|cnYELLOW_FONT_COLOR:/kstats reset|r — '..L.COMMAND_HELP_RESET..'.')
  end
end
SLASH_KLAZSTATS1 = '/klazstats'
SLASH_KLAZSTATS2 = '/kstats'
