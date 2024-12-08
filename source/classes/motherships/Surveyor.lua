local Mothership = require("source.classes.motherships.Mothership")
local vector = require('libraries.vector')
local Hardpoint = require('source.classes.motherships.hardpoints.Hardpoint')

local Surveyor = {}
Surveyor.__index = Surveyor
setmetatable(Surveyor, {__index = Mothership}) -- inherit from Mothership

function Surveyor:create(x, y)
    local hardpoints = {
        Hardpoint:new('engine', 1, -10, 20),
        Hardpoint:new('engine', 1, 10, 20),
    }

    local obj = Mothership.new(self, x, y, 100, 200, hardpoints)
    obj.maxSpeed = 100 -- example specific attribute
    obj.type = 'Surveyor'
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Surveyor:updatePassive(dt)
    
end

function Surveyor:updateCommand(dt)
    
end

return Surveyor