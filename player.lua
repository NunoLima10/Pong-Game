local love =  require("love")
require("game_config")

Player = {}

function Player:new(table)
    table = table or {}
    setmetatable(table, self)
    self.__index = self
    return table
end

function Player:window_collision()
    if self.pos.y < 0 then self.pos.y = 0 end
    if self.pos.y + player_height > windows_height then
        self.pos.y = windows_height - player_height
    end
end

function Player:move(dt, diretion)
    self.pos.y = self.pos.y - player_move_speed * dt * diretion 
    self:window_collision()
end

function Player:draw()
        love.graphics.setColor(self.color.r,self.color.g,self.color.b)
        love.graphics.rectangle(self.mode,self.pos.x,self.pos.y,player_width,player_height)
end

