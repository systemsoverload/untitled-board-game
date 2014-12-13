-------------------------------------------
-- Scene definition -----------------------
-------------------------------------------
local BaseScene = class('BaseScene')

function BaseScene:initialize()
  --debug layer - every scene can have one
    self.debug_layer = MOAILayer2D.new()
    self.debug_layer:setViewport(viewport)

    self.layer = MOAILayer2D.new()
    self.layer:setViewport(viewport)

    self.layers = {self.layer}
end

function BaseScene:cleanup()
    -- Cleanup method called on garbage collection
end

function BaseScene:update()
    -- Update method called on every tick of game loop
end

function BaseScene:get_layers()
    -- Should always return a table of ALL active layers in the scene,
    -- debug_layer gets injected based on debug settings.
    return self.layers
end

function BaseScene:event_callback()

end

function BaseScene:input_callback(key, down)
    -- Function that gets called on the "active" scene any time keyboard input
    -- is detected

    -- FIXME - These are always nil for some reason
    print(key, down)
end

return BaseScene
