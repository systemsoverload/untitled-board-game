-- Some useful globals
class = require 'lib.middleclass'
inspect = require 'lib.inspect'

local game = require 'game'
local Menu = require 'scenes.menu'
local StateManager = require 'gamestate'


MOAISim.openWindow( "Hello World", game.width, game.height)
MOAIGfxDevice.setClearColor(1,1,1,1)


StateManager.push_scene(Menu:new())
local main_loop = MOAICoroutine.new()

-- Bubble input back to current scene
MOAIInputMgr.device.keyboard:setCallback(
    function (key, down)
        StateManager.input_callback(key, down)
    end
)

main_loop:run(
    function ()
        while not game.game_over do
            StateManager.update()

            if StateManager.scene_count() == 0 then
                game.game_over = true
            end

            coroutine.yield()
        end
        print("Game Over!")
        os.exit()
    end
)
