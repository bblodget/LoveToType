-- lessons.lua
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


