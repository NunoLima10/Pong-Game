require("ball")
require("player")
require("game_config")
local love = require("love")

local ball = Ball:new()
local player_A = Player:new(
    {
        score = 0,
        pos = {x = 10, y = windows_height/2 - player_height/2},
        color = {r = 1, g = 1, b = 1 },
        mode = "fill"
    })

local player_B = Player:new(
    {
        score = 0,
        pos = {x = windows_width - player_width, y = windows_height/2 - player_height/2},
        color = {r = 1, g = 1, b = 1 },
        mode = "fill"
    })

local function game_reset()
    ball:reset()
    player_A.pos = {x = 10, y = windows_height/2 - player_height/2}
    player_B.pos = {x = windows_width - player_width, y = windows_height/2 - player_height/2}
end

function love.load()
    love.window.setMode(windows_width,windows_height)
    love.window.setTitle(title)
    love.graphics.setBackgroundColor(BG_color.r,BG_color.g,BG_color.b)
end

function love.update(dt)
    ball:update(dt)

    local diretion_A = 0
    local diretion_B = 0

    if love.keyboard.isDown(player_keys.A.up) then diretion_A = diretions.up end
    if love.keyboard.isDown(player_keys.A.down) then diretion_A = diretions.down end
    if love.keyboard.isDown(player_keys.B.up) then diretion_B = diretions.up end
    if love.keyboard.isDown(player_keys.B.down) then diretion_B = diretions.down end
    player_A:move(dt,diretion_A)
    player_B:move(dt,diretion_B)
    if love.keyboard.isDown("f") then
        game_reset()
    end
end

function love.draw()
   ball:draw()
   player_A:draw()
   player_B:draw()
end

