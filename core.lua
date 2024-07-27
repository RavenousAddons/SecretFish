local ADDON_NAME, ns = ...
local L = ns.L

function SecretFish_OnLoad(self)
    self:RegisterEvent("PLAYER_LOGIN")
    self:RegisterEvent("CRITERIA_COMPLETE")
    self:RegisterEvent("CRITERIA_EARNED")
    self:RegisterEvent("CRITERIA_UPDATE")
    self:RegisterEvent("QUEST_ACCEPTED")
    self:RegisterEvent("QUEST_TURNED_IN")
    self:RegisterEvent("BAG_UPDATE")
end

function SecretFish_OnEvent(self, event, arg, ...)
    if event == "PLAYER_LOGIN" then
        ns:SetDefaultSettings()
        ns:CreateSettingsPanel()
        if not ns.version:match("-") then
            if not SECRETFISH_version then
                ns:PrettyPrint(L.Install:format(ns.color, ns.version, ns.command))
            elseif SECRETFISH_version ~= ns.version then
                ns:PrettyPrint(L.Update:format(ns.color, ns.version, ns.command))
            end
            SECRETFISH_version = ns.version
        end
        ns:BuildWindow()
        ns:RefreshCriteria()
        ns:EnsureMacro()
        self:UnregisterEvent("PLAYER_LOGIN")
    elseif event == "CRITERIA_COMPLETE" or event == "CRITERIA_EARNED" or event == "CRITERIA_UPDATE" or event == "QUEST_ACCEPTED" or event == "QUEST_TURNED_IN" or (event == "BAG_UPDATE") then
        ns:RefreshCriteria()
    end
end

AddonCompartmentFrame:RegisterAddon({
    text = C_AddOns.GetAddOnMetadata(ADDON_NAME, "Title"),
    icon = C_AddOns.GetAddOnMetadata(ADDON_NAME, "IconAtlas"),
    registerForAnyClick = true,
    notCheckable = true,
    func = function(button, menuInputData, menu)
        local buttonName = menuInputData.buttonName
        if buttonName == "RightButton" then
            ns:OpenSettings()
        else
            ns:ToggleWindow(ns.Window)
        end
    end,
    funcOnEnter = function(menuItem)
        GameTooltip:SetOwner(menuItem)
        GameTooltip:SetText(ns.name .. "        v" .. ns.version)
        GameTooltip:AddLine(" ", 1, 1, 1, true)
        GameTooltip:AddLine(L.AddonCompartmentTooltip1, 1, 1, 1, true)
        GameTooltip:AddLine(L.AddonCompartmentTooltip2, 1, 1, 1, true)
        GameTooltip:Show()
    end,
    funcOnLeave = function()
        GameTooltip:Hide()
    end,
})

SlashCmdList["SECRETFISH"] = function(message, editbox)
    if message == "version" or message == "v" then
        ns:PrettyPrint(string.format(L.Version, ns.version))
    elseif message == "c" or string.match(message, "con") or message == "h" or string.match(message, "help") or message == "o" or string.match(message, "opt") or message == "s" or string.match(message, "sett") or string.match(message, "togg") then
        ns:OpenSettings()
    else
        ns:ToggleWindow(ns.Window)
    end
end
SLASH_SECRETFISH1 = "/" .. ns.command
