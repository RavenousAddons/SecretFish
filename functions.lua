local ADDON_NAME, ns = ...
local L = ns.L

local achievements = ns.data.achievements
local zones = ns.data.zones

local width = 300
local height = 400

local small = 6
local medium = 12
local large = 16
local gigantic = 24

---
-- Local Functions
---

local function contains(table, input)
    for index, value in ipairs(table) do
        if value == input then
            return index
        end
    end
    return false
end

local function TextColor(text, color)
    color = color and color or "eeeeee"
    return "|cff" .. color .. text .. "|r"
end

local function TextIcon(icon, size)
    size = size and size or 16
    return "|T" .. icon .. ":" .. size .. "|t"
end

local quest = TextIcon(132049)
local checkmark = TextIcon(628564)

---
-- Global Functions
---

function ns:PrettyPrint(message)
    DEFAULT_CHAT_FRAME:AddMessage("|cff" .. ns.color .. ns.name .. ":|r " .. message)
end

function ns:RegisterDefaultOption(key, value)
    if SECRETFISH_data.options[key] == nil then
        SECRETFISH_data.options[key] = value
    end
end

function ns:SetDefaultOptions()
    if SECRETFISH_data == nil then
        SECRETFISH_data = {}
    end
    if SECRETFISH_data.options == nil then
        SECRETFISH_data.options = {}
    end
    for k, v in pairs(ns.defaults) do
        ns:RegisterDefaultOption(k, v)
    end
end

function ns:ToggleWindow(frame, force)
    if frame == nil then
        return
    end
    if (frame:IsVisible() and force ~= "Show") or force == "Hide" then
        UIFrameFadeOut(frame, 0.1, 1, 0)
        C_Timer.After(0.1, function()
            frame:Hide()
        end)
    else
        UIFrameFadeIn(frame, 0.1, 0, 1)
        C_Timer.After(0.1, function()
            frame:Show()
        end)
    end
end

---
-- Specific-Use Functions
---

local hasSeenNoSpaceMessage = false
function ns:EnsureMacro()
    if not UnitAffectingCombat("player") and SECRETFISH_data.options.macro then
        local body = "/" .. ns.command
        local numberOfMacros, _ = GetNumMacros()
        if GetMacroIndexByName(ns.name) > 0 then
            EditMacro(GetMacroIndexByName(ns.name), ns.name, ns.icon, body)
        elseif numberOfMacros < 120 then
            CreateMacro(ns.name, ns.icon, body)
        elseif not hasSeenNoSpaceMessage then
            hasSeenNoSpaceMessage = true
            ns:PrettyPrint(L.NoMacroSpace)
        end
    end
end

local function RunsUntil95(chance, bound)
    bound = bound and bound or 300
    for i = 1, bound do
        local percentage = 1 - ((1 - chance / 100) ^ i)
        if percentage > 0.95 then
            -- return percentage * 100
            return i
        end
    end
    -- return string.format("%.2f", (1 - ((1 - chance) ^ bound)) * 100 .. "")
    return bound
end

local function RegisterGlobal(Key, Value)
    if not Key or not Value then return end
    ns[Key] = ns[Key] or {}
    table.insert(ns[Key], Value)
end

local function CustomReplacements(text)
    text = string.gsub(text, "Secret Fish Goggles", "|cff0070dd|Hitem:167698::::::::60:::::|h[Secret Fish Goggles]|h|r")
    text = string.gsub(text, "Hyper-Compressed Ocean", "|cff0070dd|Hitem:168016::::::::60:::::|h[Hyper-Compressed Ocean]|h|r")
    text = string.gsub(text, "The Other Place", "|cffffff00|Hquest:55816:50|h[The Other Place]|h|r")
    return text
end

---
-- UI
---

function ns:BuildWindow()
    local Window = CreateFrame("Frame", ADDON_NAME .. "Window", UIParent, "UIPanelDialogTemplate")
    ns.Window = Window
    Window:SetFrameStrata("MEDIUM")
    Window:SetWidth(SECRETFISH_data.options.windowWidth)
    Window:SetHeight(SECRETFISH_data.options.windowHeight)
    Window:SetScale(SECRETFISH_data.options.scale)
    Window:SetPoint(SECRETFISH_data.options.windowPosition, SECRETFISH_data.options.windowX, SECRETFISH_data.options.windowY)
    Window:EnableMouse(true)
    Window:SetMovable(true)
    Window:SetClampedToScreen(true)
    Window:RegisterForDrag("LeftButton")
    Window:Hide()
    Window:SetScript("OnShow", function()
        PlaySound(SOUNDKIT.IG_MAINMENU_OPEN)
    end)
    Window:SetScript("OnHide", function()
        PlaySound(SOUNDKIT.IG_MAINMENU_CLOSE)
    end)
    tinsert(UISpecialFrames, Window:GetName())

    -- Window Interactions
    local function WindowInteractionStart(self, button)
        if button == "LeftButton" then
            Window:StartMoving()
            Window.isMoving = true
            Window.hasMoved = false
        end
    end
    local function WindowInteractionEnd(self)
        if Window.isMoving then
            Window:StopMovingOrSizing()
            Window.isMoving = false
            Window.hasMoved = true
            local point, _, _, x, y = Window:GetPoint()
            SECRETFISH_data.options.windowPosition = point
            SECRETFISH_data.options.windowX = x
            SECRETFISH_data.options.windowY = y
        end
    end
    Window:SetScript("OnMouseDown", WindowInteractionStart)
    Window:SetScript("OnMouseUp", WindowInteractionEnd)

    -- Simple Heading
    local Heading = Window:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    Heading:SetPoint("TOPLEFT", Window, "TOPLEFT", medium, 0)
    Heading:SetPoint("BOTTOMRIGHT", Window, "TOPRIGHT", -medium, -30)
    Heading:SetText(TextColor(ns.name .. " ") .. TextColor(" v" .. ns.version))

    -- Scroller
    local Scroller = CreateFrame("ScrollFrame", ADDON_NAME .. "Scroller", Window, "UIPanelScrollFrameTemplate")
    Scroller:SetPoint("TOPLEFT", Heading, "BOTTOMLEFT", small, 0)
    Scroller:SetPoint("BOTTOMRIGHT", Window, "BOTTOMRIGHT", -28, 8)

    -- Content
    local Content = CreateFrame("Frame", ADDON_NAME .. "Content", Scroller)
    Content:SetWidth(SECRETFISH_data.options.windowWidth - 46)
    Content:SetHeight(1)
    Scroller:SetScrollChild(Content)

    -- Set up content placement
    local Parent = Content
    local Relative = Content
    local Offset = -small

    -- Loop through Achievements
    for _, achievement in ipairs(achievements) do
        if achievement.pre then
            local AchievementPre = ns:CreateNotes(Parent, Relative, Offset, achievement.pre)
            Relative = AchievementPre
            Offset = -gigantic
        end
        local Achievement = ns:CreateAchievement(Parent, Relative, Offset, achievement)
        Relative = Achievement
        Offset = -large
        -- Loop through Criteria
        for i, criteria in ipairs(achievement.criteria) do
            if criteria.pre then
                local CriteriaPre = ns:CreateNotes(Parent, Relative, Offset, criteria.pre)
                Relative = CriteriaPre
            end
            local Criteria = ns:CreateCriteria(Parent, Relative, Offset, achievement, i, criteria)
            Relative = Criteria
            if criteria.post then
                Offset = -small
                local CriteriaPost = ns:CreateNotes(Parent, Relative, Offset, criteria.post)
                Relative = CriteriaPost
                Offset = -large
            end
        end
        if achievement.post then
            Offset = -medium
            local AchievementPost = ns:CreateNotes(Parent, Relative, Offset, achievement.post)
            Relative = AchievementPost
        end
        Offset = -gigantic
    end
    local Spacer = ns:CreateSpacer(Parent, Relative)
end

function ns:CreateAchievement(Parent, Relative, Offset, achievement)
    local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy = GetAchievementInfo(achievement.id)

    Offset = Offset and Offset or 0
    local Achievement = Parent:CreateFontString(ADDON_NAME .. "Achievement" .. id, "ARTWORK", "GameFontNormalLarge")
    Achievement:SetPoint("TOPLEFT", Relative, "BOTTOMLEFT", 0, Offset)
    Achievement:SetPoint("TOPRIGHT", Relative, "BOTTOMRIGHT", 0, Offset)
    Achievement:SetJustifyH("LEFT")
    Achievement:SetText(name)
    Relative = Achievement

    local Description = Parent:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    Description:SetPoint("TOPLEFT", Relative, "BOTTOMLEFT", 0, -medium)
    Description:SetPoint("TOPRIGHT", Relative, "BOTTOMRIGHT", 0, -medium)
    Description:SetJustifyH("LEFT")
    Description:SetText(TextColor("\"" .. CustomReplacements(description) .. "\""))
    Relative = Description

    if string.match(description, "Danielle") then
        local zone = zones[1462]
        local zoneName = C_Map.GetMapInfo(1462).name
        local zoneIcon = zone.icon and TextIcon(zone.icon) .. " " or ""
        local DescriptionAnchor = CreateFrame("Button", nil, Parent)
        DescriptionAnchor:SetAllPoints(Description)
        DescriptionAnchor:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self or UIParent, "ANCHOR_CURSOR")
            GameTooltip:SetText("Map Pin: " .. TextColor("Danielle"))
            GameTooltip:AddLine(zoneIcon .. TextColor(zoneName, zone.color) .. TextColor(" 37.0, 47.2"))
            GameTooltip:Show()
        end)
        DescriptionAnchor:SetScript("OnLeave", function() GameTooltip:Hide() end)
        DescriptionAnchor:SetScript("OnClick", function()
            ns:PrettyPrint("|cffffd100|Hworldmap:1462:3700:4720|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a |cff" .. zone.color .. zoneName .. "|r |cffeeeeee37.0, 47.2|r]|h|r")
            C_Map.SetUserWaypoint(UiMapPoint.CreateFromCoordinates(1462, "0.3700", "0.4720"))
            C_SuperTrack.SetSuperTrackedUserWaypoint(true)
        end)
    end

    if completed then
        local Completed = Parent:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        Completed:SetPoint("TOPLEFT", Relative, "BOTTOMLEFT", 0, Offset)
        Completed:SetPoint("TOPRIGHT", Relative, "BOTTOMRIGHT", 0, Offset)
        Completed:SetJustifyH("LEFT")
        Completed:SetText("Completed: " .. TextColor(year .. "/" .. month .. "/" .. day))
        Relative = Completed
    end

    return Relative
end

function ns:CreateCriteria(Parent, Relative, Offset, achievement, i, criteria)
    Offset = Offset and Offset or 0
    local Criteria = Parent:CreateFontString(ADDON_NAME .. "Criteria" .. criteria.id, "ARTWORK", "GameFontNormal")
    Criteria:SetPoint("TOPLEFT", Relative, "BOTTOMLEFT", 0, Offset)
    Criteria:SetPoint("TOPRIGHT", Relative, "BOTTOMRIGHT", 0, Offset)
    Criteria:SetJustifyH("LEFT")
    Relative = Criteria

    local CriteriaAnchor = CreateFrame("Button", nil, Parent)
    CriteriaAnchor:SetAllPoints(Criteria)
    Criteria.anchor = CriteriaAnchor

    Criteria.achievement = achievement
    Criteria.i = i
    Criteria.data = criteria
    RegisterGlobal("Criteria", Criteria)

    return Relative
end

function ns:RefreshCriteria()
    for _, Criteria in ipairs(ns.Criteria) do
        local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID, eligible = GetAchievementCriteriaInfoByID(Criteria.achievement.id, Criteria.data.id)
        local dropchance = Criteria.data.dropchance or 1
        local zoneID = Criteria.data.zone or 1462
        local zone = zones[zoneID] or zones["Generic"]
        local zoneName = C_Map.GetMapInfo(zoneID).name
        local zoneIcon = zone.icon and TextIcon(zone.icon) .. " " or ""
        local Item = Item:CreateFromItemID(Criteria.data.item)
        Item:ContinueOnItemLoad(function()
            local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(Criteria.data.item)
            local c = {}
            Criteria:SetText((completed and checkmark or quest) .. "  " .. Criteria.i .. ". " .. itemLink .. " " .. TextIcon(itemTexture))
            if Criteria.data.waypoint then
                local waypoint = type(Criteria.data.waypoint) == "table" and Criteria.data.waypoint[1] or Criteria.data.waypoint
                for d in tostring(waypoint):gmatch("[0-9][0-9]") do
                    tinsert(c, d)
                end
                Criteria.anchor:SetScript("OnClick", function()
                    ns:PrettyPrint(itemLink .. "\n|cffffd100|Hworldmap:" .. zoneID .. ":" .. c[1] .. c[2] .. ":" .. c[3] .. c[4] .. "|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a |cff" .. zone.color .. zoneName .. "|r  |cffeeeeee" .. c[1] .. "." .. c[2] .. ", " .. c[3] .. "." .. c[4] .. "|r]|h|r")
                    C_Map.SetUserWaypoint(UiMapPoint.CreateFromCoordinates(zoneID, "0." .. c[1] .. c[2], "0." .. c[3] .. c[4]))
                    C_SuperTrack.SetSuperTrackedUserWaypoint(true)
                end)
            end
            Criteria.anchor:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self or UIParent, "ANCHOR_CURSOR")
                if Criteria.data.waypoint then
                    GameTooltip:SetText("Create Map Pin: " .. TextColor(itemName))
                    GameTooltip:AddLine("\n" .. zoneIcon .. TextColor(zoneName, zone.color) .. TextColor(" @ ", "bbbbbb") .. TextColor(c[1] .. "." .. c[2] .. ", " .. c[3] .. "." .. c[4]))
                else
                    GameTooltip:SetText(TextColor(itemName))
                    -- GameTooltip:AddLine("\n" .. TextColor("Drops any place at any time.", "bbbbbb"))
                end
                GameTooltip:AddLine("\nDrop Chance: " .. TextColor(dropchance .. "%") ..  TextColor(" (~95% after " .. RunsUntil95(dropchance) .. " casts)", "bbbbbb"))
                -- GameTooltip:SetHyperlink(itemLink)
                GameTooltip:Show()
            end)
            Criteria.anchor:SetScript("OnLeave", function() GameTooltip:Hide() end)
        end)
    end
end

function ns:CreateNote(Parent, Relative, Offset, note)
    Offset = Offset and Offset or 0

    local Note = Parent:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    Note:SetPoint("TOPLEFT", Relative, "BOTTOMLEFT", 0, Offset)
    Note:SetPoint("TOPRIGHT", Relative, "BOTTOMRIGHT", 0, Offset)
    Note:SetJustifyH("LEFT")
    Note:SetText(TextColor(CustomReplacements(note)))

    Relative = Note
    return Relative
end

function ns:CreateNotes(Parent, Relative, Offset, notes)
    for _, note in ipairs(notes) do
        local Note = ns:CreateNote(Parent, Relative, Offset, note)
        Relative = Note
    end

    return Relative
end

function ns:CreateSpacer(Parent, Relative, size)
    size = size and size or gigantic
    local Spacer = CreateFrame("Frame", nil, Parent)
    Spacer:SetPoint("TOPLEFT", Relative, "BOTTOMLEFT")
    Spacer:SetWidth(Parent:GetWidth())
    Spacer:SetHeight(size)

    return Spacer
end
