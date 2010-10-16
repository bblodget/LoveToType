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

module(..., package.seeall);

require "levels"

local text = ""
local target = ""
local prev_index = 1
local index = 1  -- index into letter array
local l_width = 0
local l_height = 0
local count = 0

local letter_ = {}

function load(letter)
	letter_ = letter

	love.graphics.setBackgroundColor(130,41,79) -- purple
	love.graphics.setColor(255,255,255)  -- white
	love.graphics.setLineWidth( 3 )
	love.graphics.setFont(bigfont)
	love.draw = draw
	love.keypressed = keypressed
	love.mousepressed = mousepressed
	text = ""
	index = math.random(letter_.size)  
	prev_index = index
	target = letter_[index]
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
				index = math.random(letter_.size)  
			end
			target = letter_[index]
			l_width = bigfont:getWidth(target)
			count = count + 1
			if (count == 30) then
				do_lesson.load()
			end
		end
	end
end

function mousepressed(x, y, button)
   if button == 'l' then
      text = "X:"..x.." Y: "..y
   end
end



