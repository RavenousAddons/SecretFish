local ADDON_NAME, ns = ...

ns.defaults = {
    macro = true,
    scale = 1,
    windowPosition = "CENTER",
    windowX = 0,
    windowY = 0,
    windowWidth = 420,
    windowHeight = 360,
}

ns.data = {
    achievements = {
        {
            pre = {
                "Complete both of these achievements to be rewarded the Hyper-Compressed Ocean!",
            },
            -- Secret Fish of Mechagon
            id = 13489,
            criteria = {
                {
                    pre = {
                        "Simply travel around Mechagon fishing in specific areas and turn each fish in!",
                        "Please feel free to make use of the Map Pins by clicking on the titles below:",
                    },
                    -- Bolted Steelhead
                    id = 44738,
                    quest = 55305,
                    item = 167655,
                    waypoint = 37034495,
                    dropchance = 1,
                },
                {
                    -- Energized Lightning Cod
                    id = 44744,
                    quest = 55311,
                    item = 167661,
                    waypoint = 37034495,
                    dropchance = 1,
                },
                {
                    -- Solarsprocket Barbel
                    id = 44745,
                    quest = 55312,
                    item = 167662,
                    waypoint = 37034495,
                    dropchance = 1,
                },
                {
                    -- Bottom Feeding Stinkfish
                    id = 44737,
                    quest = 55299,
                    item = 167654,
                    waypoint = 79004900,
                    dropchance = 1,
                },
                {
                    -- Pong Hopping Springfish
                    id = 44739,
                    quest = 55306,
                    item = 167656,
                    waypoint = 65893030,
                    dropchance = 1,
                },
                {
                    -- Shadowy Cave Eel
                    id = 44740,
                    quest = 55307,
                    item = 167657,
                    waypoint = 56822222,
                    dropchance = 1,
                },
                {
                    -- Mechanical Blowfish
                    id = 44741,
                    quest = 55308,
                    item = 167658,
                    waypoint = 25007700,
                    dropchance = 1,
                },
                {
                    -- Spitting Clownfish
                    id = 44742,
                    quest = 55309,
                    item = 167659,
                    waypoint = 83007200,
                    dropchance = 1,
                },
                {
                    -- Sludge-fouled Carp
                    id = 44743,
                    quest = 55310,
                    item = 167660,
                    waypoint = 65005100,
                    dropchance = 1,
                },
                {
                    -- Tasty Steelfin
                    id = 44746,
                    quest = 55313,
                    item = 167663,
                    waypoint = 47003700,
                    dropchance = 1,
                },
            },
            post = {
                "When you've caught all 10, you will be awarded Secret Fish Goggles, which you will need for the next achievement!",
            },
        },
        {
            -- Secret Fish and Where to Find Them
            id = 13502,
            criteria = {
                {
                    pre = {
                        "Despite being about fishing, you actually don't need to do any fishing for this achievement! You'll make heavy use of your Secret Fish Goggles and you'll also be journeying across a number of zones.",
                        "Important to note for this achievement is that you can see and share these fish with group members, so doing so will increase your spawn rates!",
                        "These first 8 can be acquired in any zone at any time:",
                    },
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
                    pre = {
                        "These next 14 can only be acquired in specific zones:",
                    },
                    -- Rotted Blood Cod
                    id = 44820,
                    item = 167712,
                    zone = 863,
                    waypoint = 50005000,
                },
                {
                    -- Jade Story Fish
                    id = 44815,
                    item = 167706,
                    zone = 371,
                    waypoint = 50005000,
                },
                {
                    -- Thunderous Flounder
                    id = 44822,
                    item = 167723,
                    zone = 504,
                    waypoint = 50005000,
                },
                {
                    -- Kirin Tor Clown
                    id = 44816,
                    item = 167707,
                    zone = 501,
                    waypoint = 50005000,
                },
                {
                    -- Mechanized Mackerel
                    id = 44817,
                    item = 167705,
                    waypoint = 50005000,
                },
                {
                    -- Queen's Delight
                    id = 44818,
                    item = 167728,
                    zone = 1355,
                    waypoint = 50005000,
                },
                {
                    -- Ancient Mana Fin
                    id = 44803,
                    item = 167708,
                    zone = 680,
                    waypoint = 50005000,
                },
                {
                    -- Prisoner Fish
                    id = 44814,
                    item = 167722,
                    zone = 244,
                    waypoint = 50005000,
                },
                {
                    -- Barbed Fjord Fin
                    id = 44804,
                    item = 167710,
                    zone = 117,
                    waypoint = 50005000,
                },
                {
                    -- Dead Fel Bone
                    id = 44807,
                    item = 167711,
                    zone = 905,
                    waypoint = 50005000,
                },
                {
                    -- Tortollan Tank Dweller
                    id = 44828,
                    item = 167724,
                    zone = 1197,
                    waypoint = 50005000,
                },
                {
                    -- Thin Air Flounder
                    id = 45952,
                    item = 169897,
                    zone = 379,
                    waypoint = 50005000,
                },
                {
                    -- Well Lurker
                    id = 45953,
                    item = 169898,
                    zone = 1328,
                    waypoint = 50005000,
                },
                {
                    -- Drowned Goldfish
                    id = 44809,
                    item = 167709,
                    zone = 942,
                    waypoint = 46005000,
                },

                {
                    pre = {
                        "Can only be acquired during the night (server time):",
                    },
                    -- Elusive Moonfish
                    id = 44810,
                    item = 167715,
                },
                {
                    pre = {
                        "Can only be acquired during the day (server time):",
                    },
                    -- Golden Sunsoaker
                    id = 44811,
                    item = 167719,
                },

                {
                    pre = {
                        "These next 4 can only be acquired while you are |cffff6666dead|r:",
                    },
                    -- Veiled Ghost
                    id = 44826,
                    item = 167713,
                },
                {
                    -- Deadeye Wally
                    id = 44821,
                    item = 167727,
                },
                {
                    -- Quiet Floater
                    id = 44819,
                    item = 167726,
                },
                {
                    -- Spiritual Salmon
                    id = 44825,
                    item = 167725,
                },

                {
                    pre = {
                        "Can only be acquired while you have the Painted Green Buff:",
                    },
                    -- Green Roughy
                    id = 45754,
                    item = 169884,
                    waypoint = 37034495,
                    dropchance = 1,
                },

                {
                    pre = {
                        "Can only be acquired in the future version of Mechagon as part of the daily quest, The Other Place, from Chromie:",
                    },
                    -- Displaced Scrapfin
                    id = 45755,
                    item = 169870,
                    waypoint = 37034495,
                    dropchance = 1,
                },
            },
            post = {
                "Now go out and enjoy your Hyper-Compressed Ocean!",
            },
        },
    },
    -- TODO add all zones
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
            -- color = "dbd9a9",
            icon = "2032229",
        },
        [371] = {
            -- The Jade Forest
            -- color = "dbd9a9",
            icon = "617824",
        },
        [504] = {
            -- Isle of Thunder
            -- color = "dbd9a9",
            icon = "136014",
        },
        [627] = {
            -- Dalaran
            -- color = "dbd9a9",
            icon = "237433",
        },
        [1355] = {
            -- Nazjatar
            color = "4db3ea",
            icon = "3012068",
        },
        [680] = {
            -- Suramar
            -- color = "dbd9a9",
            icon = "1409002",
        },
        [244] = {
            -- Tol Barad
            -- color = "dbd9a9",
            icon = "409548",
        },
        [117] = {
            -- Howling Fjord
            -- color = "dbd9a9",
            icon = "236783",
        },
        [905] = {
            -- Argus
            -- color = "dbd9a9",
            icon = "1711341",
        },
        [896] = {
            -- Drustvar
            -- color = "dbd9a9",
            icon = "2065567",
        },
        [379] = {
            -- Kun-Lai Summit
            -- color = "dbd9a9",
            icon = "617832",
        },
        [198] = {
            -- Mount Hyjal
            -- color = "dbd9a9",
            icon = "409547",
        },
        [942] = {
            -- Stormsong Valley
            -- color = "dbd9a9",
            icon = "2125382",
        },
    },
}
