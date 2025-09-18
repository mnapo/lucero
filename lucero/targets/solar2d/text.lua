local Text = {}

function Text.create(props)
    local txt = display.newText({
        text = props.text or "",
        x = props.x or display.contentCenterX,
        y = props.y or display.contentCenterY,
        font = native.systemFont,
        fontSize = props.size or 20
    })
    txt:setFillColor(1, 1, 1)
    return txt
end

function Text.update(node, props)
    if props.text then node.text = props.text end
    if props.x then node.x = props.x end
    if props.y then node.y = props.y end
end

function Text.remove(node)
    node:removeSelf()
end

return Text
