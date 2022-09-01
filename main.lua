local love = require("love")
require("game_settings")
require("collision_detection")
require("ball")
require("player")

local ball = Ball:new(Ball_settings)
local player_A = Player:new(Player_A_settings)
local player_B = Player:new(Player_B_settings)

local function game_reset()
    ball:reset()
    player_A:reset()
    player_B:reset()
end

local function keyboard_events(dt)
    if love.keyboard.isDown("r") then
        game_reset()
    end
    if love.keyboard.isDown(Game_settings.player_keys.A.up)then
        player_A:move_up(dt)
    end
    if love.keyboard.isDown(Game_settings.player_keys.A.down)then
        player_A:move_down(dt)
    end
    if love.keyboard.isDown(Game_settings.player_keys.B.up)then
        player_B:move_up(dt)
    end
    if love.keyboard.isDown(Game_settings.player_keys.B.down)then
        player_B:move_down(dt)
    end
end

local function draw_score()
    local x = Game_settings.screen_center.x
    local y = Game_settings.screen_center.y - Game_settings.font_size/2
    love.graphics.print(player_A.score,x-200,y)
    love.graphics.print(player_B.score,x+200,y)
end

function love.load()
    love.graphics.setBackgroundColor(Game_settings.BG_color.r,Game_settings.BG_color.g,Game_settings.BG_color.b)
    local font = love.graphics.newFont(Game_settings.font_size)
    love.graphics.setFont(font)
    ball:reset()
end

function love.update(dt)
    ball:update(dt)
    player_A:screen_limit(0,Game_settings.windows_height)
    player_B:screen_limit(0,Game_settings.windows_height)
    Player_collision(player_A,ball)
    Player_collision(player_B,ball)
    keyboard_events(dt)
  
    local collision_status = Window_collision(ball)
    if collision_status == "right" then
        player_A:add_score()
        game_reset()
    end
    if collision_status == "left" then
        player_B:add_score()
        game_reset()
    end
end

function love.draw()
   ball:draw()
   player_A:draw()
   player_B:draw()
   draw_score()
end

