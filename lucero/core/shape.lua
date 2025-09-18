local Shape = {}

local function getAdapter(type, target)
    return require("lucero.targets."..target.."."..type)
end

function Shape.create(type, props, target)
    local adapter = getAdapter(type, target)
    return adapter.create(props)
end

function Shape.update(node, type, props, target)
    local adapter = getAdapter(type, target)
    if adapter.update then adapter.update(node, props) end
end

function Shape.remove(node, type, target)
    local adapter = getAdapter(type, target)
    if adapter.remove then adapter.remove(node) end
end

return Shape
