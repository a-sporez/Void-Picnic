local Button = require ('source.utility.interface.Button')
local GameState = require ('source.states.GameState')
local Console = require('source.utility.Console')
local Interface = {}
Interface.__index = Interface

local window_width = love.graphics.getWidth()
local window_height = love.graphics.getHeight()
local offset_x, offset_y = 48, 18

local console = Console:new()

function Interface.new()
    local self = setmetatable({}, Interface)
    self.buttons = {}

-- this is the method to add new buttons
    self.menuButton = Button.new(
        window_width - offset_x * 2,
        window_height - offset_y * 2,
        96,
        36,
        "MENU",
        function() GameState:enableMenu() end,
        nil,
        'assets/sprites/button_1.png'
    )
    table.insert(self.buttons, self.menuButton)
-- insert the button ^above^ to the queue

    return self
end

function Interface:draw()
    console:draw()
    self.menuButton:draw(self.button_x, self.button_y, 14, 7)
end

function Interface:textinput(key)
    console:textinput(key)
end

function Interface:keypressed(key)
    console:keypressed(key)
end

function Interface:mousepressed(x, y, button)
    if button == 1 and self.menuButton then
        self.menuButton:checkPressed(x, y, button)
        print('menuButton')
    end
end

return Interface