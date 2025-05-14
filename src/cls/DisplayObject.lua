local ClassPrototype = require("ClassPrototype")
local DisplayObject = ClassPrototype:new()
DisplayObject.__index = DisplayObject

local TYPES = {
    "HTML",
    "solar2D"
}

function DisplayObject:new(parent, type, configuration)
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

return DisplayObject