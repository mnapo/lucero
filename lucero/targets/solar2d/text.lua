local Text = {}

function Text.create(props)
    local txt = display.newText({
        text = props.text or "",
        x = props.x or display.contentCenterX,
        y = props.y or display.contentCenterY,
        font = props.font or native.systemFont,
        fontSize = props.size or 20
    })
    if props.color then
        txt:setFillColor(unpack(props.color))
    end
    return txt
end

function Text.update(node, props)
    if props.text then node.text = props.text end
    if props.x then node.x = props.x end
    if props.y then node.y = props.y end
    if props.size then node.size = props.size end
    if props.color then node:setFillColor(unpack(props.color)) end
end

function Text.remove(node)
    if node and node.removeSelf then
        node:removeSelf()
    end
end

return Text
