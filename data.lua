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
    achievements = {
        {
            -- Secret Fish of Mechagon
            id = 13489,
            reward = 167698,
            pre = { L.Achievement1Pre },
            criteria = {
                {
                    -- Bolted Steelhead
                    id = 44738,
                    quest = 55305,
                    item = 167655,
                    zone = 1462,
                    dropchance = 1,
                },
                {
                    -- Energized Lightning Cod
                    id = 44744,
                    quest = 55311,
                    item = 167661,
                    zone = 1462,
                    dropchance = 1,
                },
                {
                    -- Solarsprocket Barbel
                    id = 44745,
                    quest = 55312,
                    item = 167662,
                    zone = 1462,
                    dropchance = 1,
                },
                {
                    -- Bottom Feeding Stinkfish
                    id = 44737,
                    quest = 55299,
                    item = 167654,
                    zone = 1462,
                    waypoint = 79004900,
                    dropchance = 1,
                },
                {
                    -- Pong Hopping Springfish
                    id = 44739,
                    quest = 55306,
                    item = 167656,
                    zone = 1462,
                    waypoint = 65893030,
                    dropchance = 1,
                },
                {
                    -- Shadowy Cave Eel
                    id = 44740,
                    quest = 55307,
                    item = 167657,
                    zone = 1462,
                    waypoint = 56822222,
                    dropchance = 1,
                },
                {
                    -- Mechanical Blowfish
                    id = 44741,
                    quest = 55308,
                    item = 167658,
                    zone = 1462,
                    waypoint = 25007700,
                    dropchance = 1,
                },
                {
                    -- Spitting Clownfish
                    id = 44742,
                    quest = 55309,
                    item = 167659,
                    zone = 1462,
                    waypoint = 83867258,
                    dropchance = 1,
                },
                {
                    -- Sludge-fouled Carp
                    id = 44743,
                    quest = 55310,
                    item = 167660,
                    zone = 1462,
                    waypoint = 65005100,
                    dropchance = 1,
                },
                {
                    -- Tasty Steelfin
                    id = 44746,
                    quest = 55313,
                    item = 167663,
                    zone = 1462,
                    waypoint = 47003700,
                    dropchance = 1,
                },
            },
            post = { L.Achievement1Post },
        },
        {
            -- Secret Fish and Where to Find Them
            id = 13502,
            reward = 168016,
            pre = { L.Achievement2Pre1, L.Achievement2Pre2, L.Achievement2Pre3, L.Achievement2Pre4 },
            criteria = {
                {
                    -- Camouflaged Snark
                    id = 44805,
                    item = 167717,
                },
                {
                    -- Deceptive Maw
                    id = 44808,
                    item = 167729,
                },
                {
                    -- Inconspicuous Catfish
                    id = 44812,
                    item = 167730,
                },
                {
                    -- Unseen Mimmic
                    id = 44824,
                    item = 167716,
                },
                {
                    -- Very Tiny Whale
                    id = 44827,
                    item = 167720,
                },
                {
                    -- Collectable Saltfin
                    id = 44806,
                    item = 167718,
                },
                {
                    -- Travelling Goby
                    id = 44823,
                    item = 167714,
                },
                {
                    -- Invisible Smelt
                    id = 44813,
                    item = 167721,
                },

                {
                    pre = { L.SpecificZoneTypePre },
                    -- Rotted Blood Cod
                    id = 44820,
                    item = 167712,
                    zone = 863,
                    waypoint = 55305780,
                },
                {
                    -- Jade Story Fish
                    id = 44815,
                    item = 167706,
                    zone = 371,
                },
                {
                    -- Thunderous Flounder
                    id = 44822,
                    item = 167723,
                    zone = 504,
                },
                {
                    -- Kirin Tor Clown
                    id = 44816,
                    item = 167707,
                    zone = 501,
                    post = { "      |cffbbbbbb" .. L.KirinTorClownPost .. "|r" },
                },
                {
                    -- Mechanized Mackerel
                    id = 44817,
                    item = 167705,
                    zone = 1462,
                },
                {
                    -- Queen's Delight
                    id = 44818,
                    item = 167728,
                    zone = 1355,
                },
                {
                    -- Ancient Mana Fin
                    id = 44803,
                    item = 167708,
                    zone = 680,
                },
                {
                    -- Prisoner Fish
                    id = 44814,
                    item = 167722,
                    zone = 244,
                    post = { "      |cffbbbbbb" .. L.PrisonFishPost .. "|r" },
                },
                {
                    -- Barbed Fjord Fin
                    id = 44804,
                    item = 167710,
                    zone = 117,
                },
                {
                    -- Dead Fel Bone
                    id = 44807,
                    item = 167711,
                    zone = 830,
                    waypoint = 34507648,
                },
                {
                    -- Tortollan Tank Dweller
                    id = 44828,
                    item = 167724,
                    zone = 896,
                    waypoint = 18934239,
                },
                {
                    -- Thin Air Flounder
                    id = 45952,
                    item = 169897,
                    zone = 379,
                    waypoint = 44555256,
                },
                {
                    -- Well Lurker
                    id = 45953,
                    item = 169898,
                    zone = 198,
                    waypoint = 60822586,
                },
                {
                    -- Drowned Goldfish
                    id = 44809,
                    item = 167709,
                    zone = 942,
                    waypoint = 45895335,
                },

                {
                    pre = { L.NightTypePre },
                    -- Elusive Moonfish
                    id = 44810,
                    item = 167715,
                },

                {
                    pre = { L.DayTypePre },
                    -- Golden Sunsoaker
                    id = 44811,
                    item = 167719,
                },

                {
                    pre = { L.GhostTypePre },
                    -- Veiled Ghost
                    id = 44826,
                    item = 167713,
                    zone = 619,
                    waypoint = 45866851,
                },
                {
                    -- Deadeye Wally
                    id = 44821,
                    item = 167727,
                    zone = 619,
                    waypoint = 45866851,
                },
                {
                    -- Quiet Floater
                    id = 44819,
                    item = 167726,
                    zone = 619,
                    waypoint = 45866851,
                },
                {
                    -- Spiritual Salmon
                    id = 44825,
                    item = 167725,
                    zone = 619,
                    waypoint = 45866851,
                },

                {
                    pre = { L.GreenRoughyPre },
                    -- Green Roughy
                    id = 45754,
                    item = 169884,
                    zone = 1462,
                    dropchance = 1,
                },

                {
                    pre = { L.DisplacedScrapfinPre },
                    -- Displaced Scrapfin
                    id = 45755,
                    item = 169870,
                    zone = 1462,
                    dropchance = 1,
                    post = { L.DisplacedScrapfinPost },
                },
            },
            post = { L.Achievement2Post },
        },
        {
            -- Secretest Fish (NOT AN ACHIEVEMENT)
            id = 13502,
            nullify = true,
            name = "Secretest Fish",
            description = "Find and deliver this fish to Angler Danielle.",
            reward = 161475,
            pre = { L.Achievement3Pre1 },
            criteria = {
                {
                    -- Secretest Fish
                    id = 51355,
                    item = 158932,
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
    },
}
