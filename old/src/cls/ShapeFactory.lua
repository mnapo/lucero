local ClassPrototype = require("ClassPrototype")
local ShapeFactory = ClassPrototype:new()
ShapeFactory.__index = ShapeFactory

local TYPES = {
}

function ShapeFactory:new(type)
    local instance = ClassPrototype:new()

    local type = type or TYPES[1]

    instance:set("type", type)
    :set("configuration", configuration)

    instance = setmetatable(instance, self)
    instance.__index = self
    return instance
end

return ShapeFactory