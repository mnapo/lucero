local Class = {}
Class.__index = Class

function Class:extend()
    local subclass = {}
    setmetatable(subclass, self)
    self.__index = self
    subclass.__index = subclass
    function subclass:new(...)
        local instance = setmetatable({}, subclass)
        if instance.init then instance:init(...) end
        return instance
    end
    return subclass
end

return Class
