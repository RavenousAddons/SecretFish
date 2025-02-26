local ADDON_NAME, ns = ...
local L = ns.L

function SecretFish_OnLoad(self)
    self:RegisterEvent("PLAYER_LOGIN")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
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
        if not ns.version:match("-") then
            if not SECRETFISH_version then
                ns:PrettyPrint(L.Install:format(ns.color, ns.version, ns.command))
            elseif SECRETFISH_version ~= ns.version then
                -- Version-specific messages go here...
            end
            SECRETFISH_version = ns.version
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        ns:BuildWindow()
        ns:RefreshCriteria()
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    elseif event == "CRITERIA_COMPLETE" or event == "CRITERIA_EARNED" or event == "CRITERIA_UPDATE" or event == "QUEST_ACCEPTED" or event == "QUEST_TURNED_IN" or (event == "BAG_UPDATE") then
        local allCompleted = ns:RefreshCriteria()
        if allCompleted then
            self:UnregisterEvent("CRITERIA_COMPLETE")
            self:UnregisterEvent("CRITERIA_EARNED")
            self:UnregisterEvent("CRITERIA_UPDATE")
            self:UnregisterEvent("QUEST_ACCEPTED")
            self:UnregisterEvent("QUEST_TURNED_IN")
            self:UnregisterEvent("BAG_UPDATE")
        end
    end
end

AddonCompartmentFrame:RegisterAddon({
    text = C_AddOns.GetAddOnMetadata(ADDON_NAME, "Title"),
    icon = C_AddOns.GetAddOnMetadata(ADDON_NAME, "IconAtlas"),
    registerForAnyClick = true,
    notCheckable = true,
    func = function(button, menuInputData, menu)
        local buttonName = menuInputData.buttonName
        ns:ToggleWindow(ns.Window)
    end,
    funcOnEnter = function(menuItem)
        GameTooltip:SetOwner(menuItem)
        GameTooltip:SetText(ns.name .. "        v" .. ns.version)
        GameTooltip:AddLine(" ", 1, 1, 1, true)
        GameTooltip:AddLine(L.AddonCompartmentTooltip, 1, 1, 1, true)
        GameTooltip:Show()
    end,
    funcOnLeave = function()
        GameTooltip:Hide()
    end,
})

SlashCmdList["SECRETFISH"] = function(message, editbox)
    if message == "version" or message == "v" then
        ns:PrettyPrint(string.format(L.Version, ns.version))
    else
        ns:ToggleWindow(ns.Window)
    end
end
SLASH_SECRETFISH1 = "/" .. ns.command
SLASH_SECRETFISH2 = "/sf"

BINDING_NAME_SECRET_FISH_KEY = L.ToggleWindow
