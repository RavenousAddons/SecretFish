local ADDON_NAME, ns = ...

local L = {}
ns.L = L

setmetatable(L, { __index = function(t, k)
    local v = tostring(k)
    t[k] = v
    return v
end })

-- Default (English)
L.Version = "%s is the current version." -- ns.version
L.Install = "Thanks for installing |cff%1$sv%2$s|r! You can open the interface with |cff%1$s/%3$s|r." -- ns.color, ns.version, ns.command
L.Update = "Thanks for updating to |cff%1$sv%2$s|r! You can open the interface with |cff%1$s/%3$s|r." -- ns.color, ns.version, ns.command
L.NoMacroSpace = "Unfortunately, you don't have enough global macro space for the macro to be created!"
L.SupportHeading = "Help and Support:"
L.Support1 = "This Addon creates and maintains a macro called |r%s|cffffffff for you under |rGeneral Macros|cffffffff." -- ns.name
L.Support2 = "Check out the Addon on |rGitHub|cffffffff, |rWoWInterface|cffffffff, or |rCurse|cffffffff for more info and support!"
L.Support3 = "You can also get help directly from the author on Discord: |r%s|cffffffff" -- ns.discord
L.Defaults = {
    {
        var = "macro",
        text = "Automatically create macro",
        tooltip = "When enabled, a macro called |cffffffff" .. ns.name .. "|r will be automatically created and managed for you under |cffffffffGeneral Macros|r.",
    },
}
L.Intro1 = "Complete both of these achievements to be rewarded the Hyper-Compressed Ocean!"
L.Intro2 = "Make use of the Map Pins by clicking on the location text in each listing:"
L.Achievement1Pre = "Simply travel around Mechagon fishing in specific areas and turn each fish in!"
L.Achievement1Post = "When you've caught all 10, you will be awarded the Secret Fish Goggles, which you will need for the next achievement!"
L.Achievement2Pre1 = "Despite being about fishing, you actually don't need to do any fishing for this achievement. You'll make heavy use of your Secret Fish Goggles and you'll also be journeying across space and time to track all the fish down!"
L.Achievement2Pre2 = "To collect Secret Fish for this achievement, you'll need to use the Secret Fish Goggles, applying its buff to yourself, and Secret Fish (looks like a small bubble) will spawn within 40 yards of you every ~30 seconds. It is recommended to farm these that you find an open area or steep ledge to make view of spawns clear and quick."
L.Achievement2Pre3 = "Important to note is that Secret Fish can be seen and interacted with by group members, so grouping with others using their Secret Fish Goggles will increase your spawn rates!"
L.Achievement2Pre4 = "These first 8 can be acquired in any zone at any time, so it is recommended you prioritise the Secret Fish after, and you will pick these up as you go:"
L.Achievement2Post = "Now go out and enjoy your Hyper-Compressed Ocean!"
L.SpecificZoneTypePre = "These next 14 can only be acquired in specific zones:"
L.NightTypePre = "Can only be acquired during the night (server time):"
L.DayTypePre = "Can only be acquired during the day (server time):"
L.KirinTorClownPost = "Broken Isles/Northrend"
L.PrisonFishPost = "Make sure you're in the PVP zone!"
L.GhostTypePre = "These next 4 can only be acquired while you are |cffff6666dead|r, and the best place to do so is in Broken Isles Dalaran, behind the southern bank:"
L.GreenRoughyPre = "Can only be acquired while you have the Painted Green Buff:"
L.DisplacedScrapfinPre = "Can only be acquired in the alternate version of Mechagon as part of the daily quest, The Other Place, from Chromie:"
L.DisplacedScrapfinPost = "While you're doing the daily quest, you can farm any of the mobs in the alternate version of Mechagon for the Blueprint: Personal Time Displacer."
L.DropsAnywhere = "Drops anywhere"
L.DropChance = "Drop Chance"
L.ZoneWide = "Zone-wide"
L.Attempts = "~95% after 300 attempts"
L.Outro = ""

-- Check locale and assign appropriate
local CURRENT_LOCALE = GetLocale()

-- English
if CURRENT_LOCALE == "enUS" then return end

-- German
if CURRENT_LOCALE == "deDE" then return end

-- Spanish
if CURRENT_LOCALE == "esES" then return end

-- Latin-American Spanish
if CURRENT_LOCALE == "esMX" then return end

-- French
if CURRENT_LOCALE == "frFR" then return end

-- Italian
if CURRENT_LOCALE == "itIT" then return end

-- Brazilian Portuguese
if CURRENT_LOCALE == "ptBR" then return end

-- Russian
if CURRENT_LOCALE == "ruRU" then return end

-- Korean
if CURRENT_LOCALE == "koKR" then return end

-- Simplified Chinese
if CURRENT_LOCALE == "zhCN" then return end

-- Traditional Chinese
if CURRENT_LOCALE == "zhTW" then return end

-- Swedish
if CURRENT_LOCALE == "svSE" then return end
