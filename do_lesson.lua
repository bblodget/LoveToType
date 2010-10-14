-- do_lesson.lua

module(..., package.seeall);

require "levels"
require "nonsense"
require "letters"

local step = 0

function load(lesson_data)
	step = step + 1
	love.graphics.setBackgroundColor(128,255,128) -- light green
	love.graphics.setColor(0,0,0)  -- black

	if (step == 1) then nonsense.load(lesson_data,true,1)
	elseif (step == 2) then letters.load(lesson_data)
	elseif (step == 3) then nonsense.load(lesson_data,false,1)
	elseif (step == 4) then letters.load(lesson_data)
	else 
		-- back to the levels selection
		step = 0
		levels.load()
	end



end




