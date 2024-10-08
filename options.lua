local ADDON_NAME, ns = ...
local L = ns.L

-- Reference default values.
local defaults = ns.data.defaults

-- Set up sizes for spacing.
local small = 6
local medium = 12
local large = 16
local gigantic = 24

local function CreateCheckBox(category, variable, name, tooltip)
    -- categoryTbl, variable, variableKey, variableTbl, variableType, name, defaultValue
    local setting = Settings.RegisterAddOnSetting(category, variable, variable, SECRETFISH_options, type(defaults[variable]), name, defaults[variable])
    Settings.SetOnValueChangedCallback(variable, function(event)
        SECRETFISH_options[variable] = setting:GetValue()
        ns:EnsureMacro()
    end)
    Settings.CreateCheckbox(category, setting, tooltip)
end

function ns:CreateSettingsPanel()
    local category, layout = Settings.RegisterVerticalLayoutCategory(ns.name)
    Settings.RegisterAddOnCategory(category)

    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(_G.GAMEOPTIONS_MENU .. ":"))

    do
        CreateCheckBox(category, "macro", L.Macro, L.MacroTooltip:format(ns.name))
    end

    ns.Settings = category
end