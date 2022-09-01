require("game_settings")

function Window_collision(ball)
    if Game_settings.windows_height <= ball.collision_box.y + ball.collision_box.size then
        ball:reflect_y()
        return "bottom"
    end

    if 0 >= ball.collision_box.y then
        ball:reflect_y()
        return "top"
    end

    if Game_settings.windows_width <= ball.collision_box.x + ball.collision_box.size then
        ball:reflect_x()
        return "right"
    end

    if 0 >= ball.collision_box.x then
        ball:reflect_x()
        return "left"
    end

end

function Player_collision(Player, ball)
    if Player.pos.x + Player.width >= ball.collision_box.x
    and Player.pos.y <= ball.collision_box.y
    and Player.pos.y + Player.height >= ball.collision_box.y
    then
        ball:reflect_x()
    end

    if Player.pos.x - Player.width >= ball.collision_box.x
    and Player.pos.y <= ball.collision_box.y
    and Player.pos.y + Player.height >= ball.collision_box.y
    then
        ball:reflect_x()
    end

end