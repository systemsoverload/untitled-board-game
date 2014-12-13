
local game = require 'game'
local BaseScene = require "scenes.base"
local MainScene = require "scenes.mainscene"
local StateManager = require "gamestate"


-------------------------------------------
-- Scene definition -----------------------
-------------------------------------------
local Menu = class('Menu', BaseScene)

function Menu:initialize()
  --debug layer - every scene can have one
    self.debug_layer = MOAILayer2D.new()
    self.debug_layer:setViewport(game.viewport)

    self.layer = MOAILayer2D.new()
    self.layer:setViewport(game.viewport)
    self.layer:setClearColor(0.75, 0.75, 0.77, 1)

    self.text = MOAITextBox.new()
    self.text:setString('Press any key to start, esc to exit')
    self.text:setFont(game.font)
    self.text:setTextSize(60,72)
    self.text:setYFlip(true)
    self.text:setRect(-320,-240,320,240)
    self.text:setAlignment(MOAITextBox.CENTER_JUSTIFY,MOAITextBox.CENTER_JUSTIFY)
    self.layer:insertProp(self.text)

    self.layers = {self.layer}

end

function Menu:input_callback(key, down)
    if key == 27 then
        StateManager.pop_scene()
    else
        StateManager.push_scene(MainScene)
    end
end


return Menu
