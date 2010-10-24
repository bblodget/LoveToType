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

require "button"
require "title"
require "lessonMenu"
require "lessonInstruct"
require "lesson"
require "word"
require "letters"
require "results"
require "data_1a"
require "data_1b"
require "game"
require "gameMenu"
require "gameInstruct"

function love.load()

	-- Resources
	color = {	light_blue = {128,128,255},
				bright_blue = {63,193,245},
				light_green = {128,255,128},
				pink = {255,128,128},
				purple = {130,41,79},
				black = {0,0,0},
				white = {255,255,255},
				overlay = {255,255,255,235} }

	font = {	default = love.graphics.newFont(24),
				large = love.graphics.newFont(32),
				huge = love.graphics.newFont(72),
				small = love.graphics.newFont(22) }

	graphics = {
		logo = love.graphics.newImage("images/love-ball.png"),
		cloud = love.graphics.newImage("images/cloud_plain.png"),
		plane = love.graphics.newImage("images/airplane_happy2.png"),
		sun = love.graphics.newImage("images/sun.png")
	}
				
	sound =	{	beep = love.audio.newSource("sounds/button-pressed.ogg", "static")}


	-- Initialize the pseudo random number generator
	math.randomseed( os.time() )
	math.random(); math.random(); math.random()

	-- Variables
	audio = true
	wpm = 0		-- the result of last test
	lesson = nil	-- the current lesson

	state = Title.create() -- start the program with title screen.

end


function love.draw()

	state:draw()

end

function love.update(dt)

	state:update(dt)

end

function love.mousepressed(x, y, button)

	state:mousepressed(x,y,button)

end

function love.keypressed(key)

	state:keypressed(key)

end



