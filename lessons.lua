-- lessons.lua

module(..., package.seeall);

require "title"
require "levels"

local instruct = "Nonsense combinations will be displayed to introduce each new key.  Type these twice, pressing RETURN at the end of each line.\n\n" ..
"Next, several keys will be displayed, one at a time.  Type the key that is shown.\n\n" ..
"Then words or combinations using the new keys will be displayed.  Type each line twice."

function load()
	love.graphics.setBackgroundColor(128,128,255) -- light blue
	love.graphics.setColor(0,0,0)  -- black

	love.draw = draw
	love.keypressed = keypressed
end

function draw()
	love.graphics.setFont(bigfont)
	love.graphics.printf("Lessons",0,50,800, 'center')
	love.graphics.setFont(smallfont)
	love.graphics.printf(instruct, 50,150,740, 'left')
	love.graphics.setFont(bigfont)
	love.graphics.printf("Esc=Back or RETURN=Continue",0,500,800, 'center')
end

function keypressed(key, unicode)
	if key == "escape" then
		title.load()
	end

	if key == "return" then
		levels.load()
	end

end


