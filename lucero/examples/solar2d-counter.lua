local Lucero = require("lucero")

local count = 0
local textId = "counter_text_1"

local function onButtonPress(ctx)
    count = count + 1
    Lucero.getNodeById(textId):update({ text = "Count: "..count })
end

local textNode = Lucero.createElement("text", { id=textId, text="Count: 0", x=display.contentCenterX, y=display.contentCenterY-40 })
local buttonNode = Lucero.createElement("button", {
    text="Increment",
    x=display.contentCenterX,
    y=display.contentCenterY+20,
    onPress=onButtonPress
})

local app = Lucero.createElement("group", {}, { textNode, buttonNode })

Lucero.render(app, "solar2d")
