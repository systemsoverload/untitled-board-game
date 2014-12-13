-- Simple global container for game resources ie - fonts, viewports, and reusable sprites
local width = 800
local height = 800

local game_over = false

-- Main viewport to be shared by all state classes
local viewport = MOAIViewport.new()
viewport:setSize( width, height )
viewport:setScale( width, height )

-- Default font, load a full set of chars
local chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890'
local font = MOAIFont.new()
font:loadFromTTF('sample_font.ttf',chars,60,72)

return {
	font = font,
	viewport = viewport,
	width = width,
	height = height,
	game_over = game_over
}
