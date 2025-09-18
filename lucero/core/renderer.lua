local Shape = require("lucero.core.shape")

local Renderer = {}

local function renderElement(element, parent, target)
    local node = Shape.create(element.type, element.props, target)

    if parent and parent.insert then
        parent:insert(node)
    end

    for _, child in ipairs(element.children) do
        renderElement(child, node, target)
    end

    return node
end

function Renderer.render(element, target)
    return renderElement(element, nil, target)
end

return Renderer
