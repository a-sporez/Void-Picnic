local love = require('love')

local Drone = {}

-- constructor function for the Drone class base method
function Drone:new(x, y, width, height)
-- the object contains the base attributes, the prototype.
    local drone = {
        x = x or 0,
        y = y or 0,
        width = width or 5,
        height = height or 10
    }
    setmetatable(drone, self)
    self.__index = self
    return drone
end

-- update the Drone with basic movement logic
function Drone:move(dx, dy)
    self.x = self.x + dx
    self.y = self.y + dy
end

-- draw an ellipse as placeholder
function Drone:draw()
    love.graphics.ellipse('fill', self.x, self.y, self.width, self.height)
end

return Drone