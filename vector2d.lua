
function Vector2d(x,y)
    return{
        x = x,
        y = y,
        add_vector = function (self,Vector2d)
            self.x = self.x + Vector2d.x
            self.y = self.y + Vector2d.y
        end,
        sub_vector = function (self,Vector2d)
            self.x = self.y - Vector2d.x
            self.y = self.y - Vector2d.y
        end,
        add_const = function (self,cosnt)
            self.x = self.x + cosnt
            self.y = self.y + cosnt
        end,
        sub_cosnt = function (self,cosnt)
            self.x = self.y - cosnt
            self.y = self.y - cosnt
        end,
        reverse_x = function (self)
            self.x = - self.x
        end,
        reverse_y = function (self)
            self.y = - self.y
        end
    }
end