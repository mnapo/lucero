local ClassPrototype = require("ClassPrototype")
local Shape = ClassPrototype:new()
Shape.__index = Shape

local TYPES = {
    "HTML",
    "solar2D"
}

function Shape:new(parent, type, configuration)
    local instance = ClassPrototype:new()

    local type = type or TYPES[1]
    local configuration = configuration or {}

    instance:set("parent", parent)
    :set("type", type)
    :set("configuration", configuration)

    instance = setmetatable(instance, self)
    instance.__index = self
    return instance
end

return Shape