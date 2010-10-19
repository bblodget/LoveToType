-- results.lua
-- 
-- Copyright 2010 Brandon Blodget
--
-- This file is part of "Love To Type."
--
-- "Love To Type" is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- "Love To Type" is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with "Love To Type".  If not, see <http://www.gnu.org/licenses/>.


Results = {}
Results.__index = Results

-- name: The name of lesson e.g. "Lesson 1-A"
-- isEnd: boolean.  True=end of lesson
-- actual_wpm:  The word per minute of previous exercies
-- target_wpm.  The target word per minue
function Results.create(name,isEnd,actual_wpm,target_wpm)
	local self = Results

	local good = {
		"Way to go!",
		"Looking good!",
		"Good work!",
		"Good for you!"
	}

	local bad = {
		"Type a little faster.",
		"More practice is needed."
	}

	self.name = "End of\n" .. name
	self.isEnd = isEnd

	if (actual_wpm >= target_wpm) then
		self.isGood = true
		self.message = good[math.random(# good)]
	else
		self.isGood = false
		self.message = bad[math.random(# bad)]
	end

	self.actual_wpm = "Actual\nWPM\n"..actual_wpm
	self.target_wpm = "Target\nWPM\n"..target_wpm


	-- set font, background and text color
	love.graphics.setFont(font.large)
	love.graphics.setBackgroundColor(unpack(color.pink)) 
	love.graphics.setColor(unpack(color.black)) 

	return Results
	
end


function Results:draw()

	if (self.isEnd) then
		love.graphics.printf(self.name, 50, 50 ,750, 'left') 
	end

	love.graphics.printf(self.actual_wpm, 400, 50 ,600, 'left') 
	love.graphics.printf(self.target_wpm, 620, 50 ,800, 'left') 

	love.graphics.printf(self.message,50,300,750,'center')

	if (not self.isEnd)then
		love.graphics.printf("Now, try some more.",0,400,800, 'center')
	end


	love.graphics.printf("Press any key to continue",0,500,800, 'center')
end


function Results:keypressed(key, unicode)
	state = lesson:next()
end


function Results:update(dt)
	return;	-- do nothing
end

function Results:mousepressed(x,y,button)
	return;	-- do nothing
end



