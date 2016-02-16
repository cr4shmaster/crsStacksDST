local require = GLOBAL.require
local stackable_replica = require "components/stackable_replica"

GLOBAL.TUNING.STACK_SIZE_LARGEITEM = GetModConfigData("StacksConfig")
GLOBAL.TUNING.STACK_SIZE_MEDITEM = GetModConfigData("StacksConfig")
GLOBAL.TUNING.STACK_SIZE_SMALLITEM = GetModConfigData("StacksConfig") 

local stackable_replica_ctorBase = stackable_replica._ctor or function() return true end    

function stackable_replica._ctor(self, inst)
    self.inst = inst
    self._stacksize = GLOBAL.net_ushortint(inst.GUID, "stackable._stacksize", "stacksizedirty")
    self._maxsize = GetModConfigData("StacksConfig")
end

local stackable_replicaSetMaxSize_Base = stackable_replica.SetMaxSize or function() return true end

function stackable_replica:SetMaxSize(maxsize)
	self._maxsize = GetModConfigData("StacksConfig")
end

local stackable_replicaMaxSize_Base = stackable_replica.MaxSize or function() return true end

function stackable_replica:MaxSize()
	return self._maxsize
end