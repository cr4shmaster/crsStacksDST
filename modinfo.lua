-- More information here: https://sites.google.com/view/cr4shmaster/stacks-ds-dst

name = "Stacks v2.0.3"
description = "Modifies the maximum stack size of all stackable items."
author = "cr4shmaster"
version = "2.0.3"
forumthread = ""
api_version = 10
all_clients_require_mod = true
dst_compatible = true
client_only_mod = false
icon_atlas = "modicon.xml"
icon = "modicon.tex"

local crsToggle = {{description = "Enabled", data = true}, {description = "Disabled", data = false}}

local function crsSetCount(k)
    return {description = ""..k.."", data = k}
end

local function crsDontDie(name)
    return {name = "cfg"..name.."DontDieToggle", label = ""..name.." Never Die", options = crsToggle, default = true}
end

local function crsRemoveMurder(name)
    return {name = "cfg"..name.."RemoveMurderToggle", label = "Can't Murder "..name, options = crsToggle, default = true}
end

local function crsCanStack(name)
    return {name = "cfg"..name.."CanStackToggle", label = "Stackable "..name, options = crsToggle, default = true}
end

local function crsAddOption(cfg, desc, opt, def)
    return {name = cfg, label = desc, options = opt, default = def}
end

local crsStacks = {} for k=1,20,1 do crsStacks[k] = crsSetCount(k*5) end
    for k=1,18,1 do local m = k+20 crsStacks[m] = crsSetCount(k*50+100) end
    for k=1,18,1 do local m = k+38 crsStacks[m] = crsSetCount(k*500+1000) end
    crsStacks[#crsStacks] = crsSetCount(9999)

local crsDontDieList = {"Bees", "Butterflies", "Rabbits", "Birds", "Moles", "Mosquitos"}
local crsRemoveMurderlist = crsDontDieList
local crsCanStackList = {"Rabbits", "Birds", "Moles"}

local options = {
    {name = "cfgChangeSmallStacksSize", label = "Small Stacks", options = crsStacks, default = 100},
    {name = "cfgChangeMediumStacksSize", label = "Medium Stacks", options = crsStacks, default = 100},
    {name = "cfgChangeLargeStacksSize", label = "Large Stacks", options = crsStacks, default = 100}
}

for k=1, #crsCanStackList, 1 do options[#options+1] = crsCanStack(crsCanStackList[k]) end
for k=1, #crsRemoveMurderlist, 1 do options[#options+1] = crsRemoveMurder(crsRemoveMurderlist[k]) end
for k=1, #crsDontDieList, 1 do options[#options+1] = crsDontDie(crsDontDieList[k]) end

options[#options+1] = crsAddOption("cfgJerkyDoesntPerish", "Jerky Doesn't Perish", crsToggle, false)
options[#options+1] = crsAddOption("cfgSeedsDontPerish", "Seeds Don't Perish", crsToggle, false)
options[#options+1] = crsAddOption("cfgVegSeedsDontPerish", "Veg. Seeds Don't Perish", crsToggle, true)
options[#options+1] = crsAddOption("cfgTestCheck", "Installed", {{description = "Yes", data = true}}, true)

configuration_options = options
