local ADDON_NAME, ns = ...
local L = ns.L

function SecretFish_OnLoad(self)
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("CRITERIA_COMPLETE")
    self:RegisterEvent("CRITERIA_EARNED")
    self:RegisterEvent("CRITERIA_UPDATE")
end

function SecretFish_OnEvent(self, event, arg, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        ns:SetDefaultOptions()
        ns:BuildWindow()
        ns:RefreshCriteria()
        ns:EnsureMacro()
        if not SECRETFISH_version then
            ns:PrettyPrint(string.format(L.Install, ns.color, ns.version, ns.command))
            ns:ToggleWindow(ns.Window)
        elseif SECRETFISH_version ~= ns.version then
            ns:PrettyPrint(string.format(L.Update, ns.color, ns.version, ns.command))
        end
        SECRETFISH_version = ns.version
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    elseif event == "CRITERIA_COMPLETE" or event == "CRITERIA_EARNED" or event == "CRITERIA_UPDATE" then
        ns:RefreshCriteria()
    end
end

SlashCmdList["SECRETFISH"] = function(message, editbox)
    local command, argument = strsplit(" ", message)
    if command == "version" or command == "v" then
        ns:PrettyPrint(string.format(L.Version, ns.version))
    else
        ns:ToggleWindow(ns.Window)
    end
end
SLASH_SECRETFISH1 = "/" .. ns.command
