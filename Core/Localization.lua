local addon, ns = ...
local L = {}
ns.L = L

--------------------------------------------------------------------------------
-- # CORE > LOCALIZATION
--------------------------------------------------------------------------------

-- ## ENGLISH
--------------------------------------------------------------------------------

L['COMMAND_HELP_SHORT'] = 'Short command'
L['COMMAND_HELP_UNLOCK'] = 'Unlocks frame'
L['COMMAND_HELP_LOCK'] = 'Locks frame in current position'
L['COMMAND_HELP_RESET'] = 'Resets frame position to default position (top center of screen)'

L['COMMAND_UNLOCK'] = 'Unlocked'
L['COMMAND_LOCK'] = 'Locked'

L['CONFIG_POPUP_RESET'] = 'Klaz|cff1994ffStats|r\n|cnNORMAL_FONT_COLOR:Reset to default position?|r'
L['CONFIG_POPUP_RESET_OK'] = 'Reset completed'

local locale = GetLocale()
if locale == 'en_GB' or locale == 'enUS' then return end -- ENGLISH

-- ## OTHER
--------------------------------------------------------------------------------

-- if locale == 'esMX' then return end  -- SPANISH (MEXICO)
-- if locale == 'pt_BR' then return end -- PORTUGEUSE
-- if locale == 'de_DE' then return end -- GERMAN
-- if locale == 'es_ES' then return end -- SPANISH (SPAIN)
-- if locale == 'fr_FR' then return end -- FRENCH
-- if locale == 'it_IT' then return end -- ITALIAN
-- if locale == 'ru_RU' then return end -- RUSSIAN
-- if locale == 'ko_KR' then return end -- KOREAN
-- if locale == 'zh_TW' then return end -- CHINESE (TRADITIONAL)
-- if locale == 'zh_CN' then return end -- CHINESE (SIMPLIFIED)
