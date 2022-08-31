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

function Ball()

    local initial_vel = random_speed()

    return{
        pos= {x = windows_width/2,y = windows_height/2},
        vel = initial_vel,
        radius = ball_radius,
        color = {r= 1, g = 1, b = 1},
        mode = "fill",
    window_collision = function (self)
        local top_collision_point = self.pos.y - self.radius
        local botton_collision_poit = self.pos.y +  self.radius
        local right_collision_poit =  self.pos.x - self.radius
        local left_collision_poit =  self.pos.x + self.radius
    
        if top_collision_point <= 0  or botton_collision_poit >= windows_height then
            self.vel.y = self.vel.y * -1
        end
        if right_collision_poit <= 0  then
            self.vel.x =  self.vel.x * -1
        end
        if left_collision_poit >= windows_width then
            self.vel.x =  self.vel.x * -1
        end
    end,
    update = function (self,dt)
        self:window_collision()
        self.pos.x = self.pos.x + self.vel.x * dt
        self.pos.y = self.pos.y + self.vel.y * dt
    end,
    draw = function (self)
        love.graphics.setColor(self.color.r,self.color.g,self.color.b)
        love.graphics.circle(self.mode,self.pos.x,self.pos.y,self.radius)
    end,


    }
end
return Ball