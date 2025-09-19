local Element = require("lucero.core.element")
local Renderer = require("lucero.core.renderer")

local Lucero = {}

function Lucero.createElement(type, props, children)
    local ch = {}
    if type(children) == "table" then
        ch = children
    end
    return Element.create(type, props, ch)
end

function Lucero.render(element, target)
    return Renderer.render(element, target)
end

function Lucero.updateById(id, newProps)
    return Renderer.updateById(id, newProps)
end

function Lucero.getNodeById(id)
    return Renderer.getNodeById(id)
end

return Lucero
