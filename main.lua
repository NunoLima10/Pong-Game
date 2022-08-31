local love =  require("love")

function love.load()
    _G.windows_width = 800
    _G.windows_height = 600
    love.window.setMode(windows_width,windows_height)
    love.window.setTitle("Pong")
    love.graphics.setBackgroundColor(0.1,0.1,0.1)
end
function love.update()
    
end
function love.drawn()
   
end