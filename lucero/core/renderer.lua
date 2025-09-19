local Renderer = {}

function Renderer.render(node, target)
    node.target = target
    node:mount()
    return node
end

return Renderer
