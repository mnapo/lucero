local Button = {}

function Button.create(props)
    local group = display.newGroup()

    local w = props.width or 150
    local h = props.height or 40
    local x = props.x or display.contentCenterX
    local y = props.y or display.contentCenterY

    local rect = display.newRect(group, 0, 0, w, h)
    rect.anchorX, rect.anchorY = 0.5, 0.5
    rect.x, rect.y = x, y

    local bg = props.backgroundColor or {0.2, 0.5, 0.9}
    rect:setFillColor(unpack(bg))

    local label = props.text or "Button"
    local fontSize = props.size or 18
    local txt = display.newText({
        parent = group,
        text = label,
        x = x,
        y = y,
        font = native.systemFontBold,
        fontSize = fontSize
    })
    txt.anchorX, txt.anchorY = 0.5, 0.5

    group.x = 0
    group.y = 0

    local function onTouch(self, event)
        if event.phase == "ended" or event.phase == "tap" then
            if type(props.onPress) == "function" then
                props.onPress({ event = event, node = group })
            end
        end
        return true
    end

    rect:addEventListener("touch", onTouch)

    group._rect = rect
    group._label = txt

    return group
end

function Button.update(node, props)
    if props.x then
        node._rect.x = props.x
        node._label.x = props.x
    end
    if props.y then
        node._rect.y = props.y
        node._label.y = props.y
    end
    if props.width and props.height then
        node._rect.width = props.width
        node._rect.height = props.height
    end
    if props.text then
        node._label.text = props.text
    end
    if props.backgroundColor then
        node._rect:setFillColor(unpack(props.backgroundColor))
    end
    if props.onPress then
        node._rect:removeEventListener("touch", node._rect.touch)
        node._rect.touch = function(self, event)
            if event.phase == "ended" or event.phase == "tap" then
                if type(props.onPress) == "function" then
                    props.onPress({ event = event, node = node })
                end
            end
            return true
        end
        node._rect:addEventListener("touch", node._rect.touch)
    end
end

function Button.remove(node)
    if node and node.removeSelf then
        node:removeSelf()
    end
end

return Button
