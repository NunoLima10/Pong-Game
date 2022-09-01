
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

Ball = {}

function Ball:new(table)
    table = table or {}
    setmetatable(table, self)
    self.__index = self
    return table
end

function Ball:reflect_y()
    self.vel.y = -self.vel.y
end

function Ball:reflect_x()
    self.vel.x = -self.vel.x
end

function Ball:reset()
    self.vel = random_speed()
    self.pos.x = self.reset_pos.x
    self.pos.y = self.reset_pos.y
end

function Ball:move(dt)
    self.pos.x = self.pos.x + self.vel.x * dt
    self.pos.y = self.pos.y + self.vel.y * dt
end

function Ball:update_collision_box()
    self.collision_box =  {
        x = self.pos.x - self.radius,
        y = self.pos.y - self.radius,
        size = self.radius*2
    }
end

function Ball:update (dt)
    self:move(dt)
    self:update_collision_box()
end
function Ball:draw()
    if self.debug_box then
        love.graphics.setColor(1,0,0)
        love.graphics.rectangle("fill",self.collision_box.x,self.collision_box.y,self.collision_box.size,self.collision_box.size)
    end
    love.graphics.setColor(self.color.r,self.color.g,self.color.b)
    love.graphics.circle(self.mode,self.pos.x,self.pos.y,self.radius)
end
