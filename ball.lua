require("game_config")
local love =  require("love")

local function random_speed()
    local x_diretion = love.math.random(-1,1)
    local y_diretion = love.math.random(-1,1)
    repeat
        x_diretion = love.math.random(-1,1)
        y_diretion = love.math.random(-1,1)
    until (x_diretion~= 0 and y_diretion ~= 0)
    local vel_x = love.math.random(250,300) * x_diretion
    local vel_y = love.math.random(50,100) * y_diretion

    return {x = vel_x, y =vel_y}
end

Ball = {
    pos = {x = windows_width/2,y = windows_height/2},
    vel = random_speed(),
    radius = ball_radius,
    color = {r= 1, g = 1, b = 1},
    mode = "fill"
}

function Ball:new(table)
    table = table or {}
    setmetatable(table, self)
    self.__index = self
    return table
end

function Ball:window_collision()
    local top_collision_point = self.pos.y - self.radius
    local botton_collision_poit = self.pos.y +  self.radius
    local right_collision_poit =  self.pos.x - self.radius
    local left_collision_poit =  self.pos.x + self.radius
    
    if top_collision_point <= 0  or botton_collision_poit >= windows_height then
        self.vel.y = -self.vel.y
    end
    if right_collision_poit <= 0  then
        self.vel.x =  -self.vel.x
    end
    if left_collision_poit >= windows_width then
        self.vel.x =  -self.vel.x
    end
end

function Ball:update (dt)
    self:window_collision()
    self.pos.x = self.pos.x + self.vel.x * dt
    self.pos.y = self.pos.y + self.vel.y * dt
end
function Ball:reset()
    self.vel = random_speed()
    self.pos = {x = windows_width/2,y = windows_height/2}
    
end
function Ball:draw()
    love.graphics.setColor(self.color.r,self.color.g,self.color.b)
    love.graphics.circle(self.mode,self.pos.x,self.pos.y,self.radius)
end
