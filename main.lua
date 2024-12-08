--[[
callbacks are passed to GameState base classes.
--]]
local GameState     = require('source.states.GameState')
local Menu          = require('source.states.menu')

function love.load()
    love.keyboard.setKeyRepeat(true)
    GameState:switch(Menu)
end

function love.update(dt)
    GameState:update(dt)
end

function love.draw()
    GameState:draw()
end

function love.mousepressed(x, y, button)
    GameState:mousepressed(x, y, button)
end

function love.textinput(key)
    GameState:textinput(key)
end

function love.keypressed(key)
    GameState:keypressed(key)
end