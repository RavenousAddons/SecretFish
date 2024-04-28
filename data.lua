local ADDON_NAME, ns = ...
local L = ns.L

ns.data = {
    defaults = {
        macro = true,
        scale = 1,
        windowPosition = "CENTER",
        windowX = 0,
        windowY = 0,
        windowWidth = 420,
        windowHeight = 360,
    },
    sections = {
        {
            -- Secret Fish of Mechagon
            achievement_id = 13489,
            reward = 167698,
            pre = { L.Section1Pre },
            post = { L.Section1Post },
            criteria = {
                {
                    -- Bolted Steelhead
                    criteria_id = 44738,
                    quest_id = 55305,
                    item = 167655,
                    zone = 1462,
                    dropchance = 1,
                },
                {
                    -- Energized Lightning Cod
                    criteria_id = 44744,
                    quest_id = 55311,
                    item = 167661,
                    zone = 1462,
                    dropchance = 1,
                },
                {
                    -- Solarsprocket Barbel
                    criteria_id = 44745,
                    quest_id = 55312,
                    item = 167662,
                    zone = 1462,
                    dropchance = 1,
                },
                {
                    -- Bottom Feeding Stinkfish
                    criteria_id = 44737,
                    quest_id = 55299,
                    item = 167654,
                    zone = 1462,
                    waypoint = 79004900,
                    dropchance = 1,
                },
                {
                    -- Pong Hopping Springfish
                    criteria_id = 44739,
                    quest_id = 55306,
                    item = 167656,
                    zone = 1462,
                    waypoint = 65893030,
                    dropchance = 1,
                },
                {
                    -- Shadowy Cave Eel
                    criteria_id = 44740,
                    quest_id = 55307,
                    item = 167657,
                    zone = 1462,
                    waypoint = 56822222,
                    dropchance = 1,
                },
                {
                    -- Mechanical Blowfish
                    criteria_id = 44741,
                    quest_id = 55308,
                    item = 167658,
                    zone = 1462,
                    waypoint = 25007700,
                    dropchance = 1,
                },
                {
                    -- Spitting Clownfish
                    criteria_id = 44742,
                    quest_id = 55309,
                    item = 167659,
                    zone = 1462,
                    waypoint = 83867258,
                    dropchance = 1,
                },
                {
                    -- Sludge-fouled Carp
                    criteria_id = 44743,
                    quest_id = 55310,
                    item = 167660,
                    zone = 1462,
                    waypoint = 65005100,
                    dropchance = 1,
                },
                {
                    -- Tasty Steelfin
                    criteria_id = 44746,
                    quest_id = 55313,
                    item = 167663,
                    zone = 1462,
                    waypoint = 47003700,
                    dropchance = 1,
                },
            },
        },
        {
            -- Secret Fish and Where to Find Them
            achievement_id = 13502,
            reward = 168016,
            pre = { L.Section2Pre1, L.Section2Pre2, L.Section2Pre3, L.Section2Pre4 },
            post = { L.Section2Post },
            criteria = {
                {
                    -- Camouflaged Snark
                    criteria_id = 44805,
                    item = 167717,
                },
                {
                    -- Deceptive Maw
                    criteria_id = 44808,
                    item = 167729,
                },
                {
                    -- Inconspicuous Catfish
                    criteria_id = 44812,
                    item = 167730,
                },
                {
                    -- Unseen Mimmic
                    criteria_id = 44824,
                    item = 167716,
                },
                {
                    -- Very Tiny Whale
                    criteria_id = 44827,
                    item = 167720,
                },
                {
                    -- Collectable Saltfin
                    criteria_id = 44806,
                    item = 167718,
                },
                {
                    -- Travelling Goby
                    criteria_id = 44823,
                    item = 167714,
                },
                {
                    -- Invisible Smelt
                    criteria_id = 44813,
                    item = 167721,
                },
                {
                    -- Rotted Blood Cod
                    criteria_id = 44820,
                    item = 167712,
                    zone = 863,
                    waypoint = 55305780,
                    pre = { L.SpecificZoneTypePre },
                },
                {
                    -- Jade Story Fish
                    criteria_id = 44815,
                    item = 167706,
                    zone = 371,
                },
                {
                    -- Thunderous Flounder
                    criteria_id = 44822,
                    item = 167723,
                    zone = 504,
                },
                {
                    -- Kirin Tor Clown
                    criteria_id = 44816,
                    item = 167707,
                    zone = 501,
                    post = { "      |cffbbbbbb" .. L.KirinTorClownPost .. "|r" },
                },
                {
                    -- Mechanized Mackerel
                    criteria_id = 44817,
                    item = 167705,
                    zone = 1462,
                },
                {
                    -- Queen's Delight
                    criteria_id = 44818,
                    item = 167728,
                    zone = 1355,
                },
                {
                    -- Ancient Mana Fin
                    criteria_id = 44803,
                    item = 167708,
                    zone = 680,
                },
                {
                    -- Prisoner Fish
                    criteria_id = 44814,
                    item = 167722,
                    zone = 244,
                    post = { "      |cffbbbbbb" .. L.PrisonFishPost .. "|r" },
                },
                {
                    -- Barbed Fjord Fin
                    criteria_id = 44804,
                    item = 167710,
                    zone = 117,
                },
                {
                    -- Dead Fel Bone
                    criteria_id = 44807,
                    item = 167711,
                    zone = 830,
                    waypoint = 34507648,
                },
                {
                    -- Tortollan Tank Dweller
                    criteria_id = 44828,
                    item = 167724,
                    zone = 896,
                    waypoint = 18934239,
                },
                {
                    -- Thin Air Flounder
                    criteria_id = 45952,
                    item = 169897,
                    zone = 379,
                    waypoint = 44555256,
                },
                {
                    -- Well Lurker
                    criteria_id = 45953,
                    item = 169898,
                    zone = 198,
                    waypoint = 60822586,
                },
                {
                    -- Drowned Goldfish
                    criteria_id = 44809,
                    item = 167709,
                    zone = 942,
                    waypoint = 45895335,
                },
                {
                    -- Elusive Moonfish
                    criteria_id = 44810,
                    item = 167715,
                    pre = { L.NightTypePre },
                },
                {
                    -- Golden Sunsoaker
                    criteria_id = 44811,
                    item = 167719,
                    pre = { L.DayTypePre },
                },
                {
                    -- Veiled Ghost
                    criteria_id = 44826,
                    item = 167713,
                    zone = 619,
                    waypoint = 45866851,
                    pre = { L.GhostTypePre },
                },
                {
                    -- Deadeye Wally
                    criteria_id = 44821,
                    item = 167727,
                    zone = 619,
                    waypoint = 45866851,
                },
                {
                    -- Quiet Floater
                    criteria_id = 44819,
                    item = 167726,
                    zone = 619,
                    waypoint = 45866851,
                },
                {
                    -- Spiritual Salmon
                    criteria_id = 44825,
                    item = 167725,
                    zone = 619,
                    waypoint = 45866851,
                },
                {
                    -- Green Roughy
                    criteria_id = 45754,
                    item = 169884,
                    zone = 1462,
                    dropchance = 1,
                    pre = { L.GreenRoughyPre },
                },
                {
                    -- Displaced Scrapfin
                    criteria_id = 45755,
                    item = 169870,
                    zone = 1462,
                    dropchance = 1,
                    pre = { L.DisplacedScrapfinPre },
                },
            },
        },
        {
            -- Secretest Fish
            name = L.SecretestFishName,
            description = L.SecretestFishDescription,
            reward = 161475,
            pre = { L.Section3Pre1 },
            criteria = {
                {
                    -- Secretest Fish
                    quest_id = 51355,
                    item = 158932,
                    zone = 1550,
                },
            },
        },
        {
            -- Bubblefilled Flounder
            name = L.BubblefilledFlounderName,
            description = L.BubblefilledFlounderDescription,
            pre = { L.Section4Pre1 },
            criteria = {
                {
                    -- Bubblefilled Flounder
                    item = 200638,
                    zone = 2022,
                    waypoint = 19403630,
                },
            },
        },
    },
    zones = {
        ["Generic"] = {
            color = "eeeeee",
        },
        [1462] = {
            -- Mechagon Island
            color = "dbd9a9",
            icon = "2915728",
        },
        [863] = {
            -- Nazmir
            color = "4d56b7",
            icon = "2032229",
        },
        [371] = {
            -- The Jade Forest
            color = "c9e6a0",
            icon = "617824",
        },
        [504] = {
            -- Isle of Thunder
            color = "98b6c9",
            icon = "136014",
        },
        [501] = {
            -- Dalaran
            color = "e275e8",
            icon = "237433",
        },
        [627] = {
            -- Dalaran
            color = "e275e8",
            icon = "237433",
        },
        [619] = {
            -- Broken Isles
            color = "6ebcc4",
            icon = "1535374",
        },
        [1355] = {
            -- Nazjatar
            color = "4db3ea",
            icon = "3012068",
        },
        [680] = {
            -- Suramar
            color = "5466bb",
            icon = "1409002",
        },
        [244] = {
            -- Tol Barad
            color = "87a1b2",
            icon = "409548",
        },
        [117] = {
            -- Howling Fjord
            color = "778c7f",
            icon = "236783",
        },
        [830] = {
            -- Krokuun
            color = "aacb96",
            icon = "1711341",
        },
        [896] = {
            -- Drustvar
            color = "59afc9",
            icon = "2065567",
        },
        [379] = {
            -- Kun-Lai Summit
            color = "dc9c3a",
            icon = "617832",
        },
        [198] = {
            -- Mount Hyjal
            color = "f1d6e6",
            icon = "409547",
        },
        [942] = {
            -- Stormsong Valley
            color = "d7d4be",
            icon = "2125382",
        },
        [1550] = {
            -- Shadowlands (as a whole)
            color = "ffc478",
            icon = "3257863",
        },
        [2022] = {
            -- The Waking Shores
            color = "aef4db",
            icon = "4672500",
        },
    },
}
