require = GLOBAL.require
require "components/stackable"
require "components/inventoryitem"

TUNING.STACK_SIZE_LARGEITEM = GetModConfigData("crsChangeLargeStacksSize");
TUNING.STACK_SIZE_MEDITEM = GetModConfigData("crsChangeMediumStacksSize");
TUNING.STACK_SIZE_SMALLITEM = GetModConfigData("crsChangeSmallStacksSize"); 

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
 if GetModConfigData("crsRabbitsCanStackToggle") then
    AddPrefabPostInit("rabbit", crsMakeStackable)
 end
 if GetModConfigData("crsBirdsCanStackToggle")then
    AddPrefabPostInit("crow", crsMakeStackable)
    AddPrefabPostInit("robin", crsMakeStackable)
    AddPrefabPostInit("robin_winter", crsMakeStackable)
 end
 if GetModConfigData("crsMolesCanStackToggle") then
    AddPrefabPostInit("mole", crsMakeStackable)
 end
 
 -- remove feedable
 if GetModConfigData("crsMolesDontDieToggle") then
    AddPrefabPostInit("mole", crsUnmakeFeedable)
 end
 if GetModConfigData("crsRabbitsDontDieToggle") then
    AddPrefabPostInit("rabbit", crsUnmakeFeedable)
 end
 if GetModConfigData("crsBirdsDontDieToggle") then
    AddPrefabPostInit("crow", crsUnmakeFeedable)
    AddPrefabPostInit("robin", crsUnmakeFeedable)
    AddPrefabPostInit("robin_winter", crsUnmakeFeedable)
 end
 if GetModConfigData("crsBeesDontDieToggle") then
    AddPrefabPostInit("bee", crsUnmakeFeedable)
    AddPrefabPostInit("killerbee", crsUnmakeFeedable)
 end
 if GetModConfigData("crsButterfliesDontDieToggle") then
    AddPrefabPostInit("butterfly", crsUnmakeFeedable)
 end
 if GetModConfigData("crsMosquitosDontDieToggle") then
    AddPrefabPostInit("mosquito", crsUnmakeFeedable)
 end

 -- remove murder
 if GetModConfigData("crsMolesRemoveMurderToggle") then
    AddPrefabPostInit("mole", crsRemoveMurder)
 end
 if GetModConfigData("crsBeesRemoveMurderToggle") then
    AddPrefabPostInit("bee", crsRemoveMurder)
    AddPrefabPostInit("killerbee", crsRemoveMurder)
 end
 if GetModConfigData("crsButterfliesRemoveMurderToggle") then
    AddPrefabPostInit("butterfly", crsRemoveMurder)
 end
 if GetModConfigData("crsRabbitsRemoveMurderToggle") then
    AddPrefabPostInit("rabbit", crsRemoveMurder)
 end
 if GetModConfigData("crsBirdsRemoveMurderToggle") then
    AddPrefabPostInit("crow", crsRemoveMurder)
    AddPrefabPostInit("robin", crsRemoveMurder)
    AddPrefabPostInit("robin_winter", crsRemoveMurder)
 end
 if GetModConfigData("crsMosquitosRemoveMurderToggle") then
    AddPrefabPostInit("mosquito", crsRemoveMurder)
 end
