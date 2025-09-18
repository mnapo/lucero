local Lucero = require("lucero")

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local app = Lucero.createElement("group", {}, {
    Lucero.createElement("text", { text = "Hi!", x = centerX, y = centerY }),
    Lucero.createElement("text", { text = "Rendered with Solar2D", x = centerX, y = centerY + 40 })
})

Lucero.render(app, "solar2d")
