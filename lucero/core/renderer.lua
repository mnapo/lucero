local Shape = require("lucero.core.shape")

local Renderer = {}

local registry = {}

local function renderElement(element, parentNode, target)
    local props = element.props or {}
    local node = Shape.create(element.type, props, target)

    if parentNode and parentNode.insert then
        parentNode:insert(node)
    end

    if props.id then
        registry[props.id] = { node = node, type = element.type, target = target }
    end

    for _, child in ipairs(element.children or {}) do
        renderElement(child, node, target)
    end

    return node
end

function Renderer.render(element, target)
    return renderElement(element, nil, target)
end

function Renderer.updateById(id, newProps)
    local entry = registry[id]
    if not entry then
        error("Renderer.updateById: no existe id => " .. tostring(id))
    end
    Shape.update(entry.node, entry.type, newProps, entry.target)
    return entry.node
end

function Renderer.destroyById(id)
    local entry = registry[id]
    if not entry then return end
    Shape.remove(entry.node, entry.type, entry.target)
    registry[id] = nil
end

function Renderer.getNodeById(id)
    local entry = registry[id]
    return entry and entry.node or nil
end

function Renderer._getRegistry()
    return registry
end

return Renderer
