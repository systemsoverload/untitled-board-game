-------------------------------------------
-- Scene Manager --------------------------
-------------------------------------------
local show_debug_layer = true

local function setScene(scene)
    local layers = {}
    if scene then
        layers = scene:get_layers()

        if show_debug_layer == true then
            table.insert(layers, scene.debug_layer)
        end
    end

    if layers then
        MOAIRenderMgr.setRenderTable(layers)
    else
        MOAIRenderMgr.setRenderTable({})
    end
end

--stack of current scenes
local scenes = {}
local StateManager = {}

function StateManager.push_scene(scene)
    table.insert(scenes, scene)
    scenes[#scenes]:initialize()
    setScene(scenes[#scenes])
end

function StateManager.pop_scene()
    scenes[#scenes]:cleanup()
    table.remove(scenes, #scenes)
    if #scenes > 0 then
        setScene(scenes[#scenes])
    else
        setScene(nil)
    end
end

function StateManager.show_debug_layer(show)
    show_debug_layer = show
    setScene(scenes[#scenes])
end

--calls update on the visible scene
function StateManager.update()
    if #scenes > 0 then
        scenes[#scenes]:update()
    end
end


function StateManager.event_callback(e)
    -- Generic event callback interface
    if #scenes > 0 then
        scenes[#scenes]:event_callback(e)
    end
end

function StateManager.input_callback(key, down)
    -- Callback function that gets called on all keyboard input
    if #scenes > 0 then
        if down==true then
            scenes[#scenes]:input_callback(key, down)
        end
    end
end

function StateManager.scene_count()
    return #scenes
end


return StateManager
