local Node = require("lucero.core.node")

local Element = {}

function Element.create(type, props, children, target)
    local nodeChildren = {}
    for _, child in ipairs(children or {}) do
        table.insert(nodeChildren, child)
    end
    return Node:new(type, props, nodeChildren, target)
end

return Element
