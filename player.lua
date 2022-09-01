local love =  require("love")

Player = {}

function Player:new(table)
    table = table or {}
    setmetatable(table, self)
    self.__index = self
    return table
end

function Player:reset()
    self.pos.x = self.reset_pos.x
    self.pos.y = self.reset_pos.y
end
function Player:screen_limit(limit_up,limit_down)
    if self.pos.y < 0 then self.pos.y = limit_up end
    if self.pos.y + self.height > limit_down then
        self.pos.y = limit_down - self.height
    end
end

function Player:move_up(dt)
    self.pos.y = self.pos.y - self.speed * dt
end

function Player:move_down(dt)
    self.pos.y = self.pos.y + self.speed * dt
end

function Player:add_score()
    self.score = self.score + 1
end


function Player:draw()
        love.graphics.setColor(self.color.r,self.color.g,self.color.b)
        love.graphics.rectangle(self.mode,self.pos.x,self.pos.y,self.width,self.height)
end

