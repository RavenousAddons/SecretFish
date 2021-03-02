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
    size = size and size or 14
    return "|T" .. icon .. ":" .. size .. "|t"
end

local quest = TextIcon(132049)
local turnin = TextIcon(132048)
local checkmark = TextIcon(628564)

local function HideTooltip()
    GameTooltip:Hide()
end

---
-- Global Functions
---

function ns:PrettyPrint(message)
    DEFAULT_CHAT_FRAME:AddMessage("|cff" .. ns.color .. ns.name .. ":|r " .. message)
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

function ns:Register(Key, Value, Parent)
    if not Key or not Value then return end
    Parent = Parent or ns
    Parent[Key] = Parent[Key] or {}
    table.insert(Parent[Key], Value)
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

local function CustomReplacements(text)
    text = string.gsub(text, "(Secret Fish Goggles)", TextColor("[%1]", "0070dd") .. " " .. TextIcon(133023))
    text = string.gsub(text, "(Hyper%-Compressed Ocean)", TextColor("[%1]", "0070dd") .. " " .. TextIcon(132852))
    text = string.gsub(text, "( Secret Fish )", TextColor(" %1 ", "ffd000"))
    text = string.gsub(text, "(The Other Place)", TextIcon(368364) .. TextColor("[%1]", "ffff00"))
    text = string.gsub(text, "(Painted Green)", TextIcon(237159) .. TextColor("[%1]", "ffd000"))
    text = string.gsub(text, "(Blueprint%: Personal Time Displacer)", TextIcon(2915721) .. TextColor("[%1]", "0070dd"))
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

    local function WindowInteractionStart(self, button)
        if button == "LeftButton" and not SECRETFISH_data.options.locked then
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

    local LockButton = CreateFrame("Button", ADDON_NAME .. "LockButton", Window, "UIPanelButtonTemplate")
    LockButton:SetPoint("TOPLEFT", Window, "TOPLEFT", 9, -small)
    LockButton:SetWidth(18)
    LockButton:SetHeight(18)
    LockButton:RegisterForClicks("LeftButton")
    LockButton:SetScript("OnMouseDown", function(self, button)
        SECRETFISH_data.options.locked = not SECRETFISH_data.options.locked
        GameTooltip:SetText(TextColor(SECRETFISH_data.options.locked and "Unlock Window" or "Lock Window"))
    end)
    LockButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self or UIParent, "ANCHOR_CURSOR")
        GameTooltip:SetText(TextColor(SECRETFISH_data.options.locked and "Unlock Window" or "Lock Window"))
        GameTooltip:Show()
    end)
    LockButton:SetScript("OnLeave", HideTooltip)
    local LockButtonIcon = LockButton:CreateTexture()
    LockButtonIcon:SetAllPoints(LockButton)
    LockButtonIcon:SetTexture(130944)

    local OptionsButton = CreateFrame("Button", ADDON_NAME .. "OptionsButton", Window, "UIPanelButtonTemplate")
    OptionsButton:SetPoint("TOPLEFT", LockButton, "TOPRIGHT", 2, 0)
    OptionsButton:SetWidth(18)
    OptionsButton:SetHeight(18)
    OptionsButton:RegisterForClicks("LeftButton")
    OptionsButton:SetScript("OnMouseDown", function(self, button)
        PlaySound(SOUNDKIT.IG_MAINMENU_OPEN)
        InterfaceOptionsFrame_OpenToCategory(ns.Options)
        InterfaceOptionsFrame_OpenToCategory(ns.Options)
    end)
    OptionsButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self or UIParent, "ANCHOR_CURSOR")
        GameTooltip:SetText(TextColor("Open Interface Options"))
        GameTooltip:Show()
    end)
    OptionsButton:SetScript("OnLeave", HideTooltip)
    local OptionsButtonIcon = OptionsButton:CreateTexture()
    OptionsButtonIcon:SetAllPoints(OptionsButton)
    OptionsButtonIcon:SetTexture(134063)

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

    -- Intro
    local Intros = ns:CreateNotes(Parent, Relative, Offset, {L.Intro1, L.Intro2})
    Relative = Intros

    -- Loop through Achievements
    for _, achievement in ipairs(achievements) do
        Offset = -gigantic
        local Achievement = ns:CreateAchievement(Parent, Relative, Offset, achievement)
        Relative = Achievement
        Offset = -large
        if achievement.pre then
            local AchievementPre = ns:CreateNotes(Parent, Relative, Offset, achievement.pre)
            Relative = AchievementPre
        end
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

    if wasEarnedByMe then
        local Completed = Parent:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        Completed:SetPoint("TOPLEFT", Relative, "BOTTOMLEFT", 0, -medium)
        Completed:SetPoint("TOPRIGHT", Relative, "BOTTOMRIGHT", 0, -medium)
        Completed:SetJustifyH("LEFT")
        Completed:SetText("Completed: " .. TextColor("20" .. year .. "/" .. (month < 10 and "0" or "") .. month .. "/" .. (day < 10 and "0" or "") .. day))
        Relative = Completed
    end

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
        DescriptionAnchor:SetScript("OnLeave", HideTooltip)
        DescriptionAnchor:SetScript("OnClick", function()
            ns:PrettyPrint("|cffffd100|Hworldmap:1462:3700:4720|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a |cff" .. zone.color .. zoneName .. "|r |cffeeeeee37.0, 47.2|r]|h|r")
            C_Map.SetUserWaypoint(UiMapPoint.CreateFromCoordinates(1462, "0.3700", "0.4720"))
            C_SuperTrack.SetSuperTrackedUserWaypoint(true)
        end)
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

    if criteria.zone then
        local CriteriaLocation = Parent:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        CriteriaLocation:SetPoint("TOPLEFT", Criteria, "BOTTOMLEFT", 0, -small)
        CriteriaLocation:SetPoint("TOPRIGHT", Criteria, "BOTTOMRIGHT", 0, -small)
        CriteriaLocation:SetJustifyH("LEFT")
        Criteria.location = CriteriaLocation
        Relative = CriteriaLocation
        local CriteriaLocationAnchor = CreateFrame("Button", nil, Parent)
        CriteriaLocationAnchor:SetAllPoints(CriteriaLocation)
        Criteria.locationAnchor = CriteriaLocationAnchor
    end

    Criteria.achievement = achievement
    Criteria.i = i
    Criteria.data = criteria
    ns:Register("Criteria", Criteria)

    return Relative
end

function ns:RefreshCriteria()
    if not ns.Criteria then
        C_Timer.After(1, function()
            ns:RefreshCriteria()
        end)
        return
    end
    for _, Criteria in ipairs(ns.Criteria) do
        local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID, eligible = GetAchievementCriteriaInfoByID(Criteria.achievement.id, Criteria.data.id)
        local zoneID = Criteria.data.zone or 1462
        local zone = zones[zoneID] or zones["Generic"]
        local zoneName = C_Map.GetMapInfo(zoneID).name
        local zoneIcon = zone.icon and TextIcon(zone.icon) .. " " or ""
        local zoneColor = zone.color or "ffffff"
        local ItemCache = Item:CreateFromItemID(Criteria.data.item)
        ItemCache:ContinueOnItemLoad(function()
            local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(Criteria.data.item)
            local onQuest = Criteria.data.quest and C_QuestLog.IsOnQuest(Criteria.data.quest) or false

            Criteria:SetText((onQuest and turnin or completed and checkmark or quest) .. "  " .. Criteria.i .. ". " .. itemLink .. " " .. TextIcon(itemTexture))

            Criteria.anchor:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self or UIParent, "ANCHOR_CURSOR")
                GameTooltip:SetHyperlink(itemLink)
                GameTooltip:Show()
            end)
            Criteria.anchor:SetScript("OnLeave", HideTooltip)
            Criteria.anchor:SetScript("OnClick", function()
                print(itemLink)
            end)

            if Criteria.location and Criteria.locationAnchor then
                local c = {}
                if Criteria.data.waypoint then
                    local waypoint = type(Criteria.data.waypoint) == "table" and Criteria.data.waypoint[1] or Criteria.data.waypoint
                    for split in tostring(waypoint):gmatch("[0-9][0-9]") do
                        table.insert(c, split)
                    end
                    Criteria.location:SetText("      " .. TextColor(zoneName, zone.color) .. TextColor(" ", "bbbbbb") .. TextColor(c[1] .. "." .. c[2] .. ", " .. c[3] .. "." .. c[4]))
                else
                    Criteria.location:SetText("      " .. TextColor(zoneName, zone.color) .. TextColor(" - ", "bbbbbb") .. TextColor(L.ZoneWide))
                end
                Criteria.locationAnchor:SetScript("OnEnter", function(self)
                    GameTooltip:SetOwner(self or UIParent, "ANCHOR_CURSOR")
                    if Criteria.data.waypoint then
                        GameTooltip:SetText("Create Map Pin: " .. TextColor(itemName))
                        GameTooltip:AddLine("\n" .. zoneIcon .. TextColor(zoneName, zone.color) .. TextColor(" ", "bbbbbb") .. TextColor(c[1] .. "." .. c[2] .. ", " .. c[3] .. "." .. c[4]))
                    else
                        GameTooltip:SetText(TextColor(itemName))
                        GameTooltip:AddLine("\n" .. TextColor(L.DropsAnywhere .. ":  " .. zoneIcon .. TextColor(zoneName, zone.color), "bbbbbb"))
                    end
                    if Criteria.data.dropchance then
                        GameTooltip:AddLine("\n" .. L.DropChance .. ":  " .. TextColor(Criteria.data.dropchance .. "% ") ..  TextColor("(" .. L.Attempts .. ")", "bbbbbb"))
                    end
                    GameTooltip:Show()
                end)
                Criteria.locationAnchor:SetScript("OnLeave", HideTooltip)
                if Criteria.data.waypoint then
                    Criteria.locationAnchor:SetScript("OnClick", function()
                        ns:PrettyPrint(itemLink .. "\n|cffffd100|Hworldmap:" .. zoneID .. ":" .. c[1] .. c[2] .. ":" .. c[3] .. c[4] .. "|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a |cff" .. zoneColor .. zoneName .. "|r  |cffeeeeee" .. c[1] .. "." .. c[2] .. ", " .. c[3] .. "." .. c[4] .. "|r]|h|r")
                        C_Map.SetUserWaypoint(UiMapPoint.CreateFromCoordinates(zoneID, "0." .. c[1] .. c[2], "0." .. c[3] .. c[4]))
                        C_SuperTrack.SetSuperTrackedUserWaypoint(true)
                    end)
                end
            end
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

    return Note
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
