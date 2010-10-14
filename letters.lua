-- letters.lua

module(..., package.seeall);

require "levels"

local text = ""
local target = ""
local prev_index = 1
local index = 1  -- index into letter array
local l_width = 0
local l_height = 0
local count = 0

local letter = {}

local lesson_data_ = {}

function load(lesson_data)
	lesson_data_ = lesson_data
	letter = lesson_data.letter

	love.graphics.setBackgroundColor(130,41,79) -- purple
	love.graphics.setColor(255,255,255)  -- white
	love.graphics.setLineWidth( 3 )
	love.graphics.setFont(bigfont)
	love.draw = draw
	love.keypressed = keypressed
	love.mousepressed = mousepressed
	text = ""
	index = math.random(letter.size)  
	prev_index = index
	target = letter[index]
	l_width = bigfont:getWidth(target)
	l_height = bigfont:getHeight()
	count = 0
end


function draw()
	love.graphics.printf(text,10,10,740, "left")
	love.graphics.rectangle( "line", 350, 150, 50, 50 )
	love.graphics.printf(target, 375-(l_width/2), 170-(l_height/2), 400, "left")
end

function keypressed(key, unicode)
	if key == "escape" then
		levels.load()
	else 
		if (key == target) then
			love.audio.stop()
			love.audio.play(keysnd)
			prev_index = index
			while (index == prev_index) do
				index = math.random(letter.size)  
			end
			target = letter[index]
			l_width = bigfont:getWidth(target)
			count = count + 1
			if (count == 30) then
				do_lesson.load(lesson_data_)
			end
		end
	end
end

function mousepressed(x, y, button)
   if button == 'l' then
      text = "X:"..x.." Y: "..y
   end
end



