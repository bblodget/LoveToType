-- main.lua
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

require "title"

function love.load()
	bigfont = love.graphics.newFont(34) -- font size
	smallfont = love.graphics.newFont(24) -- font size
	love.graphics.setBackgroundColor(128,128,255) -- light blue
	keysnd = love.audio.newSource("sounds/button-pressed.ogg", "static")
	love_img = love.graphics.newImage("images/love-ball.png")
	love.mouse.setVisible(false)

	-- Initialize the pseudo random number generator
	math.randomseed( os.time() )
	math.random(); math.random(); math.random()

	title.load()
end


