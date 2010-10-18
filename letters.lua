-- letters.lua
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

Letters = {}
Letters.__index = Letters


function Letters.create(letter)
	local temp = {}
	setmetatable(temp, Letters)

	temp.letter = letter

	temp.index = math.random(letter.size)  -- index into letter array
	temp.prev_index = index
	temp.target = letter[temp.index]
	temp.l_width = font.large:getWidth(temp.target)
	temp.l_height = font.large:getHeight()
	temp.count = 0

	love.graphics.setBackgroundColor(unpack(color.purple)) 
	love.graphics.setColor(unpack(color.white))  
	love.graphics.setLineWidth( 3 )
	love.graphics.setFont(font.large)

	return temp

end


function Letters:draw()
	local bx = 375
	local by = 125
	local bs = 50

	local lx = bx - (self.l_width/2) + (bs/2)
	local ly = by + (self.l_height/2) + (bs/2) - 5


	love.graphics.rectangle( "line", bx, by, bs, bs )
	love.graphics.printf(self.target, lx, ly, 800, "left")

end

function Letters:keypressed(key, unicode)
	if key == "escape" then
		state = LessonMenu.create()
	else 
		if (key == self.target) then
			love.audio.stop()
			love.audio.play(sound.beep)
			self.prev_index = self.index
			while (self.index == self.prev_index) do
				self.index = math.random(self.letter.size)  
			end
			self.target = self.letter[self.index]
			self.l_width = font.large:getWidth(self.target)
			self.count = self.count + 1
			if (self.count == 30) then
				state = lesson:next()
			end
		end
	end
end


function Letters:update(dt)
	return;	-- do nothing
end

function Letters:mousepressed(x,y,button)
	return;	-- do nothing
end

