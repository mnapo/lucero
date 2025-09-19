local Lucero = require("lucero")

local count = 0

local textId = "counter_text_1"
local btnId = "counter_btn_1"

local function rerenderText()
    Lucero.updateById(textId, { text = "Count: " .. tostring(count) })
end

local function onButtonPress(ctx)
    count = count + 1
    rerenderText()
end

local app = Lucero.createElement("group", {}, {
    Lucero.createElement("text", { id = textId, text = "Count: 0", x = display.contentCenterX, y = display.contentCenterY - 40, color = {1,1,1} }),
    Lucero.createElement("button", {
        id = btnId,
        text = "Increment",
        x = display.contentCenterX,
        y = display.contentCenterY + 20,
        width = 140,
        height = 44,
        backgroundColor = {0.1, 0.6, 0.2},
        onPress = onButtonPress
    })
})

Lucero.render(app, "solar2d")
