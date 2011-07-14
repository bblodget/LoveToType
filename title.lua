------------------------------------------------------------------------
-- title.lua
-- 
-- Copyright 2010, 2011 Brandon Blodget
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


Title = {}
Title.__index = Title

function Title.create()
	local self = Title

	-- only need one instance of Title
	if (self.initialized) then
		return self
	end

	self.button = {	
		logo = Button.createImageButton(graphics.logo, 320, 110),
		title = Button.createTextButton("To Type", 430, 120, false),
		lessons = Button.createTextButton("Lessons", 400, 250),
		game = Button.createTextButton("Game", 400, 300),
		screen = Button.createTextButton("Full Screen", 400, 350),
		quit = Button.createTextButton("Quit", 400, 400) 
		}

	self.full_screen = false

	self.initialized = true

	return self
end


function Title:draw()
	love.graphics.setBackgroundColor(unpack(color.light_blue))

	for n,b in pairs(self.button) do
		b:draw()
	end

end

function Title:update(dt)

	for n,b in pairs(self.button) do
		b:update(dt)
	end

end

function Title:mousepressed(x,y,button)
	for n,b in pairs(self.button) do
		if b:mousepressed(x,y,button) then
			if n == "lessons" then
				state = LessonMenu.create()
			elseif n == "game" then
				state = GameMenu.create()
			elseif n == "screen" then
				self:toggleScreen()
			elseif n == "quit" then
				self:windowScreen()
				love.event.push("q")
			end
		end
	end

end

function Title:keypressed(key)
	if key == "escape" then
		love.event.push("q")
	end
end

function Title:toggleScreen()

	if (self.full_screen) then
		self:windowScreen()
		self.button.screen = Button.createTextButton("Full Screen", 400, 350)
	else
		self:fullScreen()
		self.button.screen = Button.createTextButton("Windowed Screen", 400, 350)
	end

end

function Title:fullScreen()
	if (not self.full_screen) then
		-- change to full screen
		local changed = love.graphics.toggleFullscreen()
		if (changed) then
			self.full_screen = true
		end
	end
end

function Title:windowScreen()
	-- change to window mode
	local changed = love.graphics.setMode(800,600,false,true)
	if (changed) then
		self.full_screen = false
	end
end



