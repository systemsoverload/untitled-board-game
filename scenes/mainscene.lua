local game = require 'game'
local BaseScene = require "scenes.base"
local StateManager = require "gamestate"

-------------------------------------------
-- Scene definition -----------------------
-------------------------------------------
local MainScene = class('MainScene', BaseScene)

function MainScene:initialize()
  --debug layer - every scene can have one
    self.debug_layer = MOAILayer2D.new()
    self.debug_layer:setViewport(game.viewport)

    self.layer = MOAILayer2D.new()
    self.layer:setViewport(game.viewport)
    self.layers = {}
    self.layers[1] = self.layer

    self.gfxQuad = MOAIGfxQuad2D.new()
    self.gfxQuad:setTexture( "sprites/bear.png" )
    self.gfxQuad:setRect( -64, -64, 64, 64 )

    self.prop = MOAIProp2D.new()
    self.prop:setDeck(self.gfxQuad )
    self.layer:insertProp(self.prop)
end

function MainScene:input_callback(key, down)
    if key == 27 then
        StateManager.pop_scene()
    end
end

function MainScene:update()
    self.prop:moveRot(1, 1, 0)
end

return MainScene
