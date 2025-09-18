local ClassPrototype = require("ClassPrototype")
local ControllerFactory = ClassPrototype:new()
ControllerFactory.__index = ControllerFactory

local TYPES = {
}

function ControllerFactory:new(type)
    local instance = ClassPrototype:new()

    local type = type or TYPES[1]

    instance:set("type", type)
    :set("configuration", configuration)

    instance = setmetatable(instance, self)
    instance.__index = self
    return instance
end

return ControllerFactory