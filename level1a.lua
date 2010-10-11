-- level1a.lua

module(..., package.seeall);

require "levels"

local line1 = ""

function load()
	love.graphics.setBackgroundColor(128,255,128) -- light green
	love.draw = draw
	love.keypressed = keypressed
	line1 = ""
end


function draw()
	love.graphics.setFont(bigfont)
	love.graphics.printf("Key: home \nHome row",10,50,800, 'left')
	love.graphics.printf("aaa jjj", 350,150,740, 'left')
	love.graphics.printf(line1, 350,200,740, 'left')
end

function keypressed(key, unicode)
	if key == "escape" then
		levels.load()
	end

	line1 = line1 .. key

end


