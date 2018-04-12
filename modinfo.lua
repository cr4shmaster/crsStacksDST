-- More information here: https://sites.google.com/view/cr4shmaster/stacks-ds-dst

name = "Stacks v2.0.2.3"
description = "Modifies the maximum stack size of all stackable items."
author = "cr4shmaster"
version = "2.0.2.3"
forumthread = ""
api_version = 10
all_clients_require_mod = true
dst_compatible = true
client_only_mod = false
icon_atlas = "modicon.xml"
icon = "modicon.tex"

local crsToggle = {
    {description = "Enabled", data = true},
    {description = "Disabled", data = false},
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
        name = "cfgChangeSmallStacksSize",
        label = "Small Stacks",
        options = crsStacks,
        default = 100,
    },
    {
        name = "cfgChangeMediumStacksSize",
        label = "Medium Stacks",
        options = crsStacks,
        default = 100,
    },
    {
        name = "cfgChangeLargeStacksSize",
        label = "Large Stacks",
        options = crsStacks,
        default = 100,
    },
    -- bees
    {
        name = "cfgBeesDontDieToggle",
        label = "Bees Never Die",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgBeesRemoveMurderToggle",
        label = "Can't Murder Bees",
        options = crsToggle,
        default = true,
    },
    -- butterflies
    {
        name = "cfgButterfliesDontDieToggle",
        label = "Butterflies Never Die",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgButterfliesRemoveMurderToggle",
        label = "Can't Murder Butterflies",
        options = crsToggle,
        default = true,
    },
    -- rabbits
    {
        name = "cfgRabbitsDontDieToggle",
        label = "Rabbits Never Die",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgRabbitsCanStackToggle",
        label = "Stackable Rabbits",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgRabbitsRemoveMurderToggle",
        label = "Can't Murder Rabbits",
        options = crsToggle,
        default = true,
    },
    -- birds
    {
        name = "cfgBirdsDontDieToggle",
        label = "Birds Never Die",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgBirdsCanStackToggle",
        label = "Stackable Birds",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgBirdsRemoveMurderToggle",
        label = "Can't Murder Birds",
        options = crsToggle,
        default = true,
    },
    -- moles
    {
        name = "cfgMolesDontDieToggle",
        label = "Moles Never Die",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgMolesCanStackToggle",
        label = "Stackable Moles",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgMolesRemoveMurderToggle",
        label = "Can't Murder Moles",
        options = crsToggle,
        default = true,
    },
    -- mosquitos
    {
        name = "cfgMosquitosDontDieToggle",
        label = "Mosquitos Never Die",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgMosquitosRemoveMurderToggle",
        label = "Can't Murder Mosquitos",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgJerkyDoesntPerish",
        label = "Jerky Doesn't Perish",
        options = crsToggle,
        default = true,
    },
    {
        name = "cfgTestCheck",
        label = "Installed",
        options = {
            {description = "Yes", data = true},
        },
        default = true,
    },
}
