local ClassPrototype = require("ClassPrototype")
local DisplayObjectFactory = ClassPrototype:new()
DisplayObjectFactory.__index = DisplayObjectFactory

local TYPES = {
}

function DisplayObjectFactory:new(type)
    local instance = ClassPrototype:new()

    local type = type or TYPES[1]

    instance:set("type", type)
    :set("configuration", configuration)

    instance = setmetatable(instance, self)
    instance.__index = self
    return instance
end

return DisplayObjectFactory