------------------------------------------------------------------------
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
------------------------------------------------------------------------


GameInstruct = {}
GameInstruct.__index = GameInstruct

function GameInstruct.create()
	local self = GameInstruct

	-- only need one instance of GameInstruct
	if (self.initialized) then
		return self
	end

	self.button = {
		title = Button.createTextButton("Game", 400, 120, false),
		back = Button.createTextButton("Back", 400, 550) 
	}

	self.instruct = 

		"An airplane will fly by and leave words in the sky.  " ..
		"Type any of the words you see and press enter or return.  "..
		"If the word you type matches one in the sky it will turn " ..
		"into a sun.  The better you do the faster the plane will go.  "..
		"You get one point for every character of a word that is turned "..
		"into a sun.  There is a time limit of 3 minutes for the game.  "..
		"Good Luck!"
	
	return self
end


function GameInstruct:draw()
	love.graphics.setBackgroundColor(unpack(color.light_blue))
	love.graphics.setColor(unpack(color.black))

	love.graphics.setFont(font["small"])

	love.graphics.printf(self.instruct, 100,200,600,"center")

	for n,b in pairs(self.button) do
		b:draw()
	end

end

function GameInstruct:update(dt)
	for n,b in pairs(self.button) do
		b:update(dt)
	end
end

function GameInstruct:mousepressed(x,y,button)

	for n,b in pairs(self.button) do
		if b:mousepressed(x,y,button) then
			if n == "back" then
				state = GameMenu.create()
			end
		end
	end

end



function GameInstruct:keypressed(key)
	if key == "escape" then
		state = LessonMenu.create()
	end
end



