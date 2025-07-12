--[[
    Task 1.1: Playing State
    Wraps the SnakeGame logic and forwards update/draw/callbacks.
    Acts as the active game loop during gameplay.
--]]

local SnakeGame = require("snake_game")
local game = SnakeGame:new()

local state = {}

function state:update(dt)
    game:update(dt)
end

function state:draw()
    game:draw()
end

function state:changeDirection(dx, dy)
    game:changeDirection(dx, dy)
end

return state
