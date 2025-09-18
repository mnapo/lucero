local Group = {}

function Group.create(props)
    return display.newGroup()
end

function Group.remove(node)
    node:removeSelf()
end

return Group
