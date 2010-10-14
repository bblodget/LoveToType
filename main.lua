-- main.lua

require "title"

function love.load()
	bigfont = love.graphics.newFont(34) -- font size
	smallfont = love.graphics.newFont(24) -- font size
	love.graphics.setBackgroundColor(128,128,255) -- light blue
	keysnd = love.audio.newSource("sounds/button-pressed.ogg", "static")
	love_img = love.graphics.newImage("images/love-ball.png")
	love.mouse.setVisible(false)
	title.load()
	--letters.load()
end


