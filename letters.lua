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
	local self = Letters

	self.letter = letter
	self.uppercase =false

	self.index = math.random(letter.size)  -- index into letter array
	self.prev_index = index
	self.target = letter[self.index]
	self.l_width = font.large:getWidth(self.target)
	self.l_height = font.large:getHeight()
	self.count = 0

	love.graphics.setBackgroundColor(unpack(color.purple)) 
	love.graphics.setColor(unpack(color.white))  
	love.graphics.setLineWidth( 3 )
	love.graphics.setFont(font.large)

	return self

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
	elseif ( key == "rshift" or
			key == "lshift")  then
			self.uppercase = true
	else 
		if (self.uppercase) then
			-- convert to upper case
			key = string.upper(key)
			if (key == ";") then
				key = ":"
			elseif (key == "/") then
				key = "?"
			elseif (key == "'") then
				key = "\""
			end
			self.uppercase = false
		end

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

