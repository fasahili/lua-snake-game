--[[
    Task 3.2: Input Handling
    Implements the Command Pattern to map keys to game commands.
    Allows flexible binding and execution of user input actions.
--]]

local Input = {}
Input.__index = Input

function Input:new()
    return setmetatable({commands = {}}, Input)
end

function Input:bind(key, command)
    self.commands[key] = command
end

function Input:handleKey(key)
    if self.commands[key] then self.commands[key]() end
end

return Input
