require("ball")
require("player")
local love =  require("love")

--Game config
_G.windows_width = 800
_G.windows_height = 600
_G.player_width = 20
_G.player_height = 100
_G.player_move_speed = 200
_G.ball_radius = 10
_G.player_keys = {A={up ="z",down = "s"} ,B={up ="o",down = "l"}}
_G.diretions = {up = 1, down = -1}


local ball = Ball()
local player_A = Player(10,{r = 1, g = 0, b = 0 })
local player_B = Player(windows_width - player_width - 10,{r = 0, g = 0, b = 1 })


function love.load()
    love.window.setMode(windows_width,windows_height)
    love.window.setTitle("Pong")
    love.graphics.setBackgroundColor(0.1,0.1,0.1)
end

function love.update(dt)
  
    ball:window_collision()
    ball:update(dt)

    local diretion_A = 0
    local diretion_B = 0

    if love.keyboard.isDown(player_keys.A.up) then diretion_A = diretions.up end
    if love.keyboard.isDown(player_keys.A.down) then diretion_A = diretions.down end
    if love.keyboard.isDown(player_keys.B.up) then diretion_B = diretions.up end
    if love.keyboard.isDown(player_keys.B.down) then diretion_B = diretions.down end
    player_A:move(dt,diretion_A)
    player_B:move(dt,diretion_B)
end

function love.draw()
   ball:draw()
   player_A:draw()
   player_B:draw()
end

