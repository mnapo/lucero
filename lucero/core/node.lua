local Class = require("lucero.core.class")
local Shape = require("lucero.core.shape")

local Node = Class:extend()

function Node:init(type, props, children, target)
    self.type = type
    self.props = props or {}
    self.children = children or {}
    self.target = target
    self.node = nil
end

function Node:mount(parent)
    self.node = Shape.create(self.type, self.props, self.target)
    if parent and parent.node and parent.node.insert then
        parent.node:insert(self.node)
    end
    for _, child in ipairs(self.children) do
        if child.mount then child:mount(self) end
    end
end

function Node:update(newProps)
    self.props = newProps or self.props
    Shape.update(self.node, self.type, self.props, self.target)
end

function Node:remove()
    for _, child in ipairs(self.children) do
        if child.remove then child:remove() end
    end
    Shape.remove(self.node, self.type, self.target)
end

return Node
