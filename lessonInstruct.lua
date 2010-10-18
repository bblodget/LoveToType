-- lessonInstruct.lua
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


LessonInstruct = {}
LessonInstruct.__index = LessonInstruct

function LessonInstruct.create()
	local temp = {}
	setmetatable(temp, LessonInstruct)

	temp.button = {
		title = Button.createTextButton("Lessons", 400, 120, false),
		back = Button.createTextButton("Back", 400, 550) 
	}

	temp.instruct = 
	
		"Select a level and then select a lesson.  " ..
		"Each lesson is designed to teach you 4 or 5 new keys.  " ..
		"First nonsense combinations will be displayed to introduce each new key.  " ..
		"Type these twice, pressing ENTER or RETURN at the end of each line.  " ..
		"Next, keys will be displayed one at a time in a box.  Type the key that is shown.  " ..
		"Then words or combinations using the new keys will be displayed.  Type each line twice. " ..
		"At the end of the lesson, your actual and target words per minute will be displayed." ..
		"You can exit the lesson at any time by pressing the Escape key."

	return temp
end


function LessonInstruct:draw()
	love.graphics.setBackgroundColor(unpack(background))
	love.graphics.setColor(unpack(normal_text))

	love.graphics.setFont(font["small"])

	love.graphics.printf(self.instruct, 100,200,600,"center")

	for n,b in pairs(self.button) do
		b:draw()
	end

end

function LessonInstruct:update(dt)
	for n,b in pairs(self.button) do
		b:update(dt)
	end
end

function LessonInstruct:mousepressed(x,y,button)

	for n,b in pairs(self.button) do
		if b:mousepressed(x,y,button) then
			if n == "back" then
				state = LessonMenu.create()
			end
		end
	end

end



function LessonInstruct:keypressed(key)
	if key == "escape" then
		state = LessonMenu.create()
	end
end



