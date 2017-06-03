-- This mod adds:
--  Increased maximum stack size of all stackable items.
--  The ability to make some, previously non-stackable items, stackable
--  The ability to make animals and insects not require feeding
--  The ability to make disable the "murder" option for inventory insects and animals

-- Workshop Page: http://steamcommunity.com/sharedfiles/filedetails/?id=398570591
-- Author: cr4shmaster: http://steamcommunity.com/id/cr4shmaster

name = "Stacks v2.0"
description = "Modifies the maximum stack size of all stackable items."
author = "cr4shmaster"
version = "2.0.2"
forumthread = ""
api_version = 10
all_clients_require_mod = true
dst_compatible = true
client_only_mod = false
icon_atlas = "modicon.xml"
icon = "modicon.tex"

local crsToggle = {
    {description = "Enabled", data = 1},
    {description = "Disabled", data = 0},
}

local crsStacks = {
    {description = "5", data = 5},
    {description = "10", data = 10},
    {description = "15", data = 15},
    {description = "20", data = 20},
    {description = "25", data = 25},
    {description = "30", data = 30},
    {description = "35", data = 35},
    {description = "40", data = 40},
    {description = "45", data = 45},
    {description = "50", data = 50},
    {description = "55", data = 55},
    {description = "60", data = 60},
    {description = "65", data = 65},
    {description = "70", data = 70},
    {description = "75", data = 75},
    {description = "80", data = 80},
    {description = "85", data = 85},
    {description = "90", data = 90},
    {description = "95", data = 95},
    {description = "100", data = 100},
    {description = "150", data = 150},
    {description = "200", data = 200},
    {description = "250", data = 250},
    {description = "500", data = 500},
    {description = "1000", data = 1000},
    {description = "9999", data = 9999},
}

configuration_options = {
    {
        name = "crsChangeSmallStacksSize",
        label = "Small Stacks",
        options = crsStacks,
        default = 100,
    },
    {
        name = "crsChangeMediumStacksSize",
        label = "Medium Stacks",
        options = crsStacks,
        default = 100,
    },
    {
        name = "crsChangeLargeStacksSize",
        label = "Large Stacks",
        options = crsStacks,
        default = 100,
    },
    -- bees
    {
        name = "crsBeesDontDieToggle",
        label = "Bees Never Die",
        options = crsToggle,
        default = 1,
    },
    {
        name = "crsBeesRemoveMurderToggle",
        label = "Can't Murder Bees",
        options = crsToggle,
        default = 1,
    },
    -- butterflies
    {
        name = "crsButterfliesDontDieToggle",
        label = "Butterflies Never Die",
        options = crsToggle,
        default = 1,
    },
    {
        name = "crsButterfliesRemoveMurderToggle",
        label = "Can't Murder Butterflies",
        options = crsToggle,
        default = 1,
    },
    -- rabbits
    {
        name = "crsRabbitsDontDieToggle",
        label = "Rabbits Never Die",
        options = crsToggle,
        default = 1,
    },
    {
        name = "crsRabbitsCanStackToggle",
        label = "Stackable Rabbits",
        options = crsToggle,
        default = 1,
    },
    {
        name = "crsRabbitsRemoveMurderToggle",
        label = "Can't Murder Rabbits",
        options = crsToggle,
        default = 1,
    },
    -- birds
    {
        name = "crsBirdsDontDieToggle",
        label = "Birds Never Die",
        options = crsToggle,
        default = 1,
    },
    {
        name = "crsBirdsCanStackToggle",
        label = "Stackable Birds",
        options = crsToggle,
        default = 1,
    },
    {
        name = "crsBirdsRemoveMurderToggle",
        label = "Can't Murder Birds",
        options = crsToggle,
        default = 1,
    },
    -- moles
    {
        name = "crsMolesDontDieToggle",
        label = "Moles Never Die",
        options = crsToggle,
        default = 1,
    },
    {
        name = "crsMolesCanStackToggle",
        label = "Stackable Moles",
        options = crsToggle,
        default = 1,
    },
    {
        name = "crsMolesRemoveMurderToggle",
        label = "Can't Murder Moles",
        options = crsToggle,
        default = 1,
    },
    -- mosquitos
    {
        name = "crsMosquitosDontDieToggle",
        label = "Mosquitos Never Die",
        options = crsToggle,
        default = 1,
    },
    {
        name = "crsMosquitosRemoveMurderToggle",
        label = "Can't Murder Mosquitos",
        options = crsToggle,
        default = 1,
    },
}
