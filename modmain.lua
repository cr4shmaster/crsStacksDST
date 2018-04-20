require = GLOBAL.require
require "components/stackable"
require "components/inventoryitem"

TUNING.STACK_SIZE_LARGEITEM = GetModConfigData("cfgChangeLargeStacksSize");
TUNING.STACK_SIZE_MEDITEM = GetModConfigData("cfgChangeMediumStacksSize");
TUNING.STACK_SIZE_SMALLITEM = GetModConfigData("cfgChangeSmallStacksSize"); 

local r_s = GLOBAL.require("components/stackable_replica") -- Credit: Jupiter: http://steamcommunity.com/profiles/76561198204009267
r_s._ctor = function(self, inst)
	self.inst = inst
	self._stacksize = GLOBAL.net_shortint(inst.GUID, "stackable._stacksize", "stacksizedirty")
	self._maxsize = GLOBAL.net_tinybyte(inst.GUID, "stackable._maxsize")
end

local function crsMakeStackable(inst)
    if not inst.components.stackable and GLOBAL.TheWorld.ismastersim then
        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    end
end

local function crsUnmakeFeedable(inst)
    if inst.components.perishable and GLOBAL.TheWorld.ismastersim then
        inst:RemoveComponent("perishable")
    end
    if inst.components.inventoryitem and GLOBAL.TheWorld.ismastersim then
        inst.components.inventoryitem:SetOnPutInInventoryFn(function(inst)
            if oninventory then
                oninventory(inst)
            end
        end)
        inst.components.inventoryitem:SetOnDroppedFn(function(inst)
            if ondropped then
                ondropped(inst)
            end
        end)
    end
end

local function crsRemoveMurder(inst)
    if inst.components.health and GLOBAL.TheWorld.ismastersim then
        inst.components.health.canmurder = false
    end
end
 
 -- make stackable
 AddPrefabPostInit("minotaurhorn", crsMakeStackable)
 AddPrefabPostInit("tallbirdegg", crsMakeStackable)
 if GetModConfigData("cfgRabbitsCanStackToggle") then
    AddPrefabPostInit("rabbit", crsMakeStackable)
 end
 if GetModConfigData("cfgBirdsCanStackToggle")then
    AddPrefabPostInit("crow", crsMakeStackable)
    AddPrefabPostInit("robin", crsMakeStackable)
    AddPrefabPostInit("robin_winter", crsMakeStackable)
    AddPrefabPostInit("canary", crsMakeStackable)
 end
 if GetModConfigData("cfgMolesCanStackToggle") then
    AddPrefabPostInit("mole", crsMakeStackable)
 end
 
 -- remove feedable
 if GetModConfigData("cfgMolesDontDieToggle") then
    AddPrefabPostInit("mole", crsUnmakeFeedable)
 end
 if GetModConfigData("cfgRabbitsDontDieToggle") then
    AddPrefabPostInit("rabbit", crsUnmakeFeedable)
 end
 if GetModConfigData("cfgBirdsDontDieToggle") then
    AddPrefabPostInit("crow", crsUnmakeFeedable)
    AddPrefabPostInit("robin", crsUnmakeFeedable)
    AddPrefabPostInit("robin_winter", crsUnmakeFeedable)
    AddPrefabPostInit("canary", crsUnmakeFeedable)
 end
 if GetModConfigData("cfgBeesDontDieToggle") then
    AddPrefabPostInit("bee", crsUnmakeFeedable)
    AddPrefabPostInit("killerbee", crsUnmakeFeedable)
 end
 if GetModConfigData("cfgButterfliesDontDieToggle") then
    AddPrefabPostInit("butterfly", crsUnmakeFeedable)
 end
 if GetModConfigData("cfgMosquitosDontDieToggle") then
    AddPrefabPostInit("mosquito", crsUnmakeFeedable)
 end

 -- remove murder
 if GetModConfigData("cfgMolesRemoveMurderToggle") then
    AddPrefabPostInit("mole", crsRemoveMurder)
 end
 if GetModConfigData("cfgBeesRemoveMurderToggle") then
    AddPrefabPostInit("bee", crsRemoveMurder)
    AddPrefabPostInit("killerbee", crsRemoveMurder)
 end
 if GetModConfigData("cfgButterfliesRemoveMurderToggle") then
    AddPrefabPostInit("butterfly", crsRemoveMurder)
 end
 if GetModConfigData("cfgRabbitsRemoveMurderToggle") then
    AddPrefabPostInit("rabbit", crsRemoveMurder)
 end
 if GetModConfigData("cfgBirdsRemoveMurderToggle") then
    AddPrefabPostInit("crow", crsRemoveMurder)
    AddPrefabPostInit("robin", crsRemoveMurder)
    AddPrefabPostInit("robin_winter", crsRemoveMurder)
    AddPrefabPostInit("canary", crsRemoveMurder)
 end
 if GetModConfigData("cfgMosquitosRemoveMurderToggle") then
    AddPrefabPostInit("mosquito", crsRemoveMurder)
 end

local function crsRemovePerish(inst)
    if inst.components.perishable and GLOBAL.TheWorld.ismastersim then
        inst:RemoveComponent("perishable")
    end
end

if GetModConfigData("cfgJerkyDoesntPerish") then
    AddPrefabPostInit("meat_dried", crsRemovePerish)
    AddPrefabPostInit("smallmeat_dried", crsRemovePerish)
    AddPrefabPostInit("monstermeat_dried", crsRemovePerish)
end

if GetModConfigData("cfgSeedsDontPerish") then
    AddPrefabPostInit("seeds", crsRemovePerish)
end

if GetModConfigData("cfgVegSeedsDontPerish") then
    AddPrefabPostInit("carrot_seeds", crsRemovePerish)
    AddPrefabPostInit("corn_seeds", crsRemovePerish)
    AddPrefabPostInit("dragonfruit_seeds", crsRemovePerish)
    AddPrefabPostInit("durian_seeds", crsRemovePerish)
    AddPrefabPostInit("eggplant_seeds", crsRemovePerish)
    AddPrefabPostInit("pomegranate_seeds", crsRemovePerish)
    AddPrefabPostInit("pumpkin_seeds", crsRemovePerish)
    AddPrefabPostInit("watermelon_seeds", crsRemovePerish)
end
