local love = require("love")
require("game_settings")
function love.conf(tbl)
    tbl.window.title = Game_settings.title
    tbl.window.width = Game_settings.windows_width
    tbl.window.height = Game_settings.windows_height
    tbl.window.console = true
end