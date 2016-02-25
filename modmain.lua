local require = GLOBAL.require
local stackable_replica = require "components/stackable_replica"

TUNING.STACK_SIZE_LARGEITEM = GetModConfigData("crsChangeLargeStacksSize");
TUNING.STACK_SIZE_MEDITEM = GetModConfigData("crsChangeMediumStacksSize");
TUNING.STACK_SIZE_SMALLITEM = GetModConfigData("crsChangeSmallStacksSize"); 

local stackable_replica_ctorBase = stackable_replica._ctor or function() return true end    

function stackable_replica._ctor(self, inst)
 self.inst = inst
 self._stacksize = GLOBAL.net_ushortint(inst.GUID, "stackable._stacksize", "stacksizedirty")
 self._maxsize = GetModConfigData("crsChangeSmallStacksSize")
end

local stackable_replicaSetMaxSize_Base = stackable_replica.SetMaxSize or function() return true end

function stackable_replica:SetMaxSize(maxsize)
	self._maxsize = GetModConfigData("crsChangeSmallStacksSize")
end

local stackable_replicaMaxSize_Base = stackable_replica.MaxSize or function() return true end

function stackable_replica:MaxSize()
	return self._maxsize
end

local function crsMakeStackable(inst)
 inst:AddComponent("stackable")
 inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
end

local function crsUnmakeFeedable(inst)
 inst:RemoveComponent("perishable")
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

local function crsRemoveMurder(inst)
 if inst.components.health then
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
