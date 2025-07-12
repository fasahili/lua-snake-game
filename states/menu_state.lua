--[[
    Task 1.1: Menu State
    Represents the menu screen of the game.
    Waits for user input to switch to 'playing' state.
--]]

local menu = {}

function menu:update(dt) end

function menu:draw()
    love.graphics.print("Press Enter to Start", 300, 300)
end

return menu
