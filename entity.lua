--[[
    Task 1.2: Entity Component System
    Implements a basic ECS where each entity contains a dictionary of components.
    Supports add/get/has operations for modular component management.
--]]

local Entity = {}
Entity.__index = Entity

function Entity:new()
    return setmetatable({components = {}}, Entity)
end

function Entity:addComponent(name, component)
    self.components[name] = component
end

function Entity:getComponent(name)
    return self.components[name]
end

function Entity:hasComponent(name)
    return self.components[name] ~= nil
end

return Entity
