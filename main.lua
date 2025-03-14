-------------------------------------------------------------------------
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
-------------------------------------------------------------------------

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
require "data_1r"
require "game"
require "gameMenu"
require "gameInstruct"
require "data_2a"
require "data_2b"
require "data_2r"
require "data_3a"
require "data_3b"
require "data_3r"
require "data_4a"
require "data_4r"

function love.load()
	-- Detect if we're running on the web
	local isWeb = love.system.getOS() == "Web"
	
	-- Disable audio for web version to avoid browser compatibility issues
	if isWeb then
		-- Create dummy audio functions for web version
		local originalAudioFunctions = {}
		originalAudioFunctions.stop = love.audio.stop
		originalAudioFunctions.play = love.audio.play
		originalAudioFunctions.newSource = love.audio.newSource
		
		-- Replace with no-op versions
		love.audio.stop = function() end
		love.audio.play = function(source) end
		love.audio.newSource = function(filename, type) 
			return {} -- Return empty table instead of source
		end
		
		print("Running on web - audio disabled")
	end

	-- Resources
	color = {	light_blue = {128/255, 128/255, 255/255},
				bright_blue = {63/255, 193/255, 245/255},
				dark_blue = {64/255, 64/255, 255/255},
				light_green = {128/255, 255/255, 128/255},
				pink = {255/255, 128/255, 128/255},
				purple = {130/255, 41/255, 79/255},
				black = {0, 0, 0},
				white = {1, 1, 1},
				overlay = {1, 1, 1, 235/255} }


	font_name = "fonts/PT_Sans-Regular.ttf"

	font = {	default =
	love.graphics.newFont(font_name,24),
				large = love.graphics.newFont(font_name,32),
				huge = love.graphics.newFont(font_name,72),
				small = love.graphics.newFont(font_name,22) }

	graphics = {
		logo = love.graphics.newImage("images/love-ball.png"),
		cloud = love.graphics.newImage("images/cloud_small.png"),
		plane = love.graphics.newImage("images/airplane_small.png"),
		sun = love.graphics.newImage("images/sun_small.png")
	}
				
	sound =	{	beep = love.audio.newSource("sounds/button-pressed.ogg", "static")}


	-- Initialize the pseudo random number generator
	math.randomseed( os.time() )
	math.random(); math.random(); math.random()

	-- Variables
	audio = true
	wpm = 0		-- the result of last test
	lesson = nil	-- the current lesson

	state = Title.create(isWeb) -- start the program with title screen, passing isWeb flag

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



