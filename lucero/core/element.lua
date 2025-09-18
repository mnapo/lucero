local Element = {}

function Element.create(type, props, children)
    return {
        type = type,
        props = props or {},
        children = children or {}
    }
end

return Element
