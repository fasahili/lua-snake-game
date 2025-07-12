--[[
    Bonus Challenge: Simple Observer Pattern
    Implements a publish-subscribe event system to notify parts of the game of specific events.
    Used to broadcast events like 'food_eaten' for decoupled logic.
--]]

local Events = {}
local listeners = {}

function Events:subscribe(event, callback)
    if not listeners[event] then
        listeners[event] = {}
    end
    table.insert(listeners[event], callback)
end

function Events:emit(event, data)
    if listeners[event] then
        for _, cb in ipairs(listeners[event]) do
            cb(data)
        end
    end
end

return Events
