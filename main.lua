-- main.lua

require "title"

function love.load()
	bigfont = love.graphics.newFont(34) -- font size
	smallfont = love.graphics.newFont(24) -- font size
	love.graphics.setBackgroundColor(128,128,255) -- light blue
	love.graphics.setColor(0,0,0)  -- black
	keysnd = love.audio.newSource("button-pressed.ogg", "static")
	love.mouse.setVisible(false)
	title.load()
	--letters.load()
end


