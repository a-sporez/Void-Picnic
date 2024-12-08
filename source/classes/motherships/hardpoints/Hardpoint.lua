local vector = require('libraries.vector')
local Hardpoint = {}

function Hardpoint:new(type, tier, mount_x, mount_y)
    local obj = {
        type = type or "structure", -- structure > hull > core
        tier = tier or 1, -- 1 to 4
        installed = nil,
        occupied = false,
        mount = vector(mount_x, mount_y)
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Hardpoint:installModule(module)
    if not self.occupied then
        if self:canInstall(module) then
            self.installed = module
            return true
        else
            return false, "[ERROR] module incompatible"
        end
    end
end

function Hardpoint:canInstall(module)
    return module.type == self.type and module.tier <= self.tier
end

function Hardpoint:removeModule()
    self.occupied = false
    self.installed = nil
end

function Hardpoint:draw(parentPosition, parentAngle)
    love.graphics.push()
    local rotatedOffset = self.mount:rotated(parentAngle)
    local pos = parentPosition + rotatedOffset
    print(string.format(
        "[DEBUG] Hardpoint at: (%.2f, %.2f) | Parent: (%.2f, %.2f) | Offset: (%.2f, %.2f)",
        pos.x, pos.y, parentPosition.x, parentPosition.y, rotatedOffset.x, rotatedOffset.y
    ))
    love.graphics.circle('line', pos.x, pos.y, 5)
    if self.installed and self.installed.draw then
        self.installed:draw(pos, parentAngle)
    end
    love.graphics.pop()
end

return Hardpoint