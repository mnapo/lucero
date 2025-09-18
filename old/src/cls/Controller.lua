local ClassPrototype = require("ClassPrototype")
local Controller = ClassPrototype:new()
Controller.__index = Controller

local TYPES = {
    "HTML",
    "solar2D"
}

function Controller:new(parent, type, configuration)
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

return Controller