-- Game_settings table
Game_settings = {
    title = "Pong",
    windows_width = 800,
    windows_height = 600,
    BG_color = {r = 0.1, g = 0.1, b = 0.1},
    player_width = 20,
    player_height = 100,
    player_move_speed = 200,
    ball_radius = 10,
    player_keys = {A={up ="z",down = "s"} ,B={up ="o",down = "l"}},
    font_size = 50
}

Player_A_settings = {
    score = 0,
    color = {r = 1, g = 1, b = 1 },
    mode = "fill",
    width = Game_settings.player_width,
    height = Game_settings.player_height,
    speed = Game_settings.player_move_speed
}

Player_B_settings = {
    score = 0, 
    color = {r = 1, g = 1, b = 1 },
    mode = "fill",
    width = Game_settings.player_width,
    height = Game_settings.player_height,
    speed = Game_settings.player_move_speed
}

Ball_settings = {
    radius = Game_settings.ball_radius,
    color = {r= 1, g = 1, b = 1},
    mode = "fill",
    debug_box = true
}

Game_settings.screen_center = {
    x = Game_settings.windows_width/2,
    y = Game_settings.windows_height/2
}

Player_A_settings.pos = {
    x = 10,
    y = Game_settings.screen_center.y - Player_A_settings.height/2
}

Player_A_settings.reset_pos ={
    x = 10,
    y = Game_settings.screen_center.y - Player_A_settings.height/2
}

Player_B_settings.pos = {
    x = Game_settings.windows_width - Game_settings.player_width -10,
    y = Game_settings.screen_center.y - Player_B_settings.height/2
}
Player_B_settings.reset_pos = {
    x = Game_settings.windows_width - Game_settings.player_width -10,
    y = Game_settings.screen_center.y - Player_B_settings.height/2
}

Ball_settings.pos = {
    x = Game_settings.screen_center.x,
    y = Game_settings.screen_center.y
}
Ball_settings.reset_pos = {
    x = Game_settings.screen_center.x,
    y = Game_settings.screen_center.y
}
Ball_settings.vel = {x = 0, y = 0}
Ball_settings.collision_box =  {
    x = Ball_settings.pos.x - Ball_settings.radius,
    y = Ball_settings.pos.y - Ball_settings.radius ,
    size = Ball_settings.radius*2
}

