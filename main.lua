local love =  require("love")
local Ball = require("ball")

_G.windows_width = 800
_G.windows_height = 600

local game_ball = Ball()

function love.load()
    love.window.setMode(windows_width,windows_height)
    love.window.setTitle("Pong")
    love.graphics.setBackgroundColor(0.1,0.1,0.1)
end

function love.update(dt)
    game_ball:window_collosion()
    game_ball:update(dt)
end

function love.draw()
   game_ball:draw()
end