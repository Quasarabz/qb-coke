Config = {}

Config.Jobs = {
    [1] = {
        ["unemployed"] = 0,
    },
    [2] = {
        ["police"] = 4,
    },
    }

Config.FolderName = "qb-coke"

Config.Locations = {
    [1] = {coords = vector3(1827.23, 5046.38, 58.65), text = "Pick Leaves", config = Cocaleaves},
    [2] = {coords = vector3(1827.85, 5046.98, 58.59), text = "Pick Leaves", config = Cocaleaves},
    [3] = {coords = vector3(1828.61, 5047.55, 58.5), text = "Pick Leaves", config = Cocaleaves},
    [4] = {coords = vector3(1829.36, 5048.25, 58.4), text = "Pick Leaves", config = Cocaleaves},
    [5] = {coords = vector3(1830.18, 5048.88, 58.31), text = "Pick Leaves", config = Cocaleaves},
    [6] = {coords = vector3(1831.02, 5049.59, 58.21), text = "Pick Leaves", config = Cocaleaves},
    [7] = {coords = vector3(2433.88, 4968.59, 42.35), text = "Make Coke", config = cokebags},
}

Config.JobStash = {
    [1] =  {coords = vector3(2435.61, 4968.0, 16.64), name = 'Generic Restaurant Name', size = 4000000, slots = 100},
}

Cocaleaves = {
    [1] = {
        label = "Coca Leaves", 
        description = "Begin Picking Leaves", 
        item = "coca_leaf", --item that will be given
        required = {}, -- required items to make (empty if no items required)
        progressbar = "Picking Leaves", -- text to display on progressbar
        progresstime = 6000, -- time required to make in milliseconds
        dictionary = 'amb@world_human_gardener_plant@male@base', --dictionary name for animation
        animname = "base", --animation name
    },
}

cokebags = {
    [1] = {
        label = "Make Cocaine", 
        description = "Start Making a Bag of Cocaine", 
        item = "mqcokebaggy", --item that will be given
        required = {
            [1] = {itemName = "coca_leaf", amount = 10},
            [2] = {itemName = "gasolinesmall", amount = 1},
            [3] = {itemName = "bakingsmall", amount = 1},
        },
        progressbar = "Starting Process", -- text to display on progressbar
        progresstime = 15000, -- time required to make in milliseconds
        dictionary = 'anim@amb@business@coc@coc_unpack_cut@', --dictionary name for animation
        animname = "fullcut_cycle_v6_cokecutter", --animation name
    },
}
