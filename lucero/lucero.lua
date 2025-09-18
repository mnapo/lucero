local Element = require("lucero.core.element")
local Renderer = require("lucero.core.renderer")

local Lucero = {}

function Lucero.createElement(type, props, children)
    return Element.create(type, props, children)
end

function Lucero.render(element, target)
    return Renderer.render(element, target)
end

return Lucero
