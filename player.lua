local love =  require("love")

function Player(pos_x,color)
  return{
    score = 0,
    pos_x = pos_x,
    pos_y = windows_height/2 - player_height/2,
    color = color,
    mode = "fill",

    draw = function (self)
        love.graphics.setColor(self.color.r,self.color.g,self.color.b)
        love.graphics.rectangle(self.mode,self.pos_x,self.pos_y,player_width,player_height)
    end,
    move =  function (self,dt, diretion)
        self.pos_y = self.pos_y - player_move_speed * dt * diretion

        if self.pos_y < 0 then
            self.pos_y = 0
        end

        if self.pos_y + player_height > windows_height then
            self.pos_y = windows_height - player_height
        end
    end
  }
end
return Player