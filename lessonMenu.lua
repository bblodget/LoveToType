-------------------------------------------------------------------------
-- lessonMenu.lua
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


LessonMenu = {}
LessonMenu.__index = LessonMenu


function LessonMenu.create(title)
	local self = LessonMenu

	-- only need one instance of LessonMenu
	--if (self.initialized) then
	--	return self
	--end

	-- set title if given one
	if (title) then
		self.title = title
	else
		-- default title
		self.title = "Lessons"
	end

	self.cx = 400
	self.x = 200
	self.y = 250
	self.xx = self.x + 100
	self.yy = self.y + 100
	self.s = 50

	local cx = self.cx
	local x = self.x
	local y = self.y
	local xx = self.xx
	local yy = self.yy
	local s = self.s

	self.button = {
		title = Button.createTextButton(self.title, 400, 120, false),

		instruct = Button.createTextButton("Instructions", cx, y-50),
		level = Button.createTextButton("Level:", x, y, false),

		one = Button.createTextButton(" 1 ", xx, y),
		two = Button.createTextButton(" 2 ", xx+(s*1), y),
		three = Button.createTextButton(" 3 ", xx+(s*2), y),
		four = Button.createTextButton(" 4 ", xx+(s*3), y),
		five = Button.createTextButton(" 5 ", xx+(s*4), y),
		six = Button.createTextButton(" 6 ", xx+(s*5), y),
		seven = Button.createTextButton(" 7 ", xx+(s*6), y),
		eight = Button.createTextButton(" 8 ", xx+(s*7), y),


		sub1 = Button.createTextButton("Lesson 1-A    [home keys]",cx,yy),
		sub2 = Button.createTextButton("Lesson 1-B    [e n g o]",cx,yy+(s*1)),
		sub3 = Button.createTextButton("Lesson 1 Review",cx,yy+(s*2)),

		back = Button.createTextButton("Back", cx, 550) 

	}

	self.level = 1

	self.initialized = true

	return self
end


function LessonMenu:draw()
	love.graphics.setBackgroundColor(unpack(color.light_blue))

	for n,b in pairs(self.button) do
		b:draw()
	end

	-- draw line under selected level
	love.graphics.setColor(unpack(color.bright_blue))
	love.graphics.setLine(4, "rough")
	local l = self.level - 1
	love.graphics.line((self.xx-15)+((l)*self.s),(self.y+5),(self.xx+15)+((l)*self.s),(self.y+5))

end

function LessonMenu:update(dt)

	for n,b in pairs(self.button) do
		b:update(dt)
	end

end


function LessonMenu:mousepressed(x,y,button)
	local cx = self.cx
	local yy = self.yy
	local s = self.s

	for n,b in pairs(self.button) do
		if b:mousepressed(x,y,button) then
			if n == "instruct" then
				self:instructions()
			elseif n == "one" then
				self.level = 1
				self.button.sub1 = Button.createTextButton("Lesson 1-A    [home keys]",cx,yy)
				self.button.sub2 = Button.createTextButton("Lesson 1-B    [e n g o]",cx,yy+(s*1))
				self.button.sub3 = Button.createTextButton("Lesson 1 Review",cx,yy+(s*2))
			elseif n == "two" then
				self.level = 2
				self.button.sub1 = Button.createTextButton("Lesson 2-A    [t i h c]",cx,yy)
				self.button.sub2 = Button.createTextButton("Lesson 2-B    [r u v p .]",cx,yy+(s*1),false)
				self.button.sub3 = Button.createTextButton("Lesson 2 Review",cx,yy+(s*2),false)
			elseif n == "three" then
				self.level = 3
				self.button.sub1 = Button.createTextButton("Lesson 3-A    [q m x b :]",cx,yy,false)
				self.button.sub2 = Button.createTextButton("Lesson 3-B    [w y z ,]",cx,yy+(s*1),false)
				self.button.sub3 = Button.createTextButton("Lesson 3 Review",cx,yy+(s*2),false)
			elseif n == "four" then
				self.level = 4
				self.button.sub1 = Button.createTextButton("Lesson 4-A    [? ' / \"]",cx,yy,false)
				self.button.sub2 = Button.createTextButton("Lesson 4 Review",cx,yy+(s*1),false)
				self.button.sub3 = nil
			elseif n == "five" then
				self.level = 5
				self.button.sub1 = Button.createTextButton("Lesson 5-A    [0 ) 2 @]",cx,yy,false)
				self.button.sub2 = Button.createTextButton("Lesson 5-B    [1 ! 9 (]",cx,yy+(s*1),false)
				self.button.sub3 = Button.createTextButton("Lesson 5 Review",cx,yy+(s*2),false)
			elseif n == "six" then
				self.level = 6
				self.button.sub1 = Button.createTextButton("Lesson 6-A    [4 $ 8 *]",cx,yy,false)
				self.button.sub2 = Button.createTextButton("Lesson 6-B    [3 # 7 &]",cx,yy+(s*1),false)
				self.button.sub3 = Button.createTextButton("Lesson 6 Review",cx,yy+(s*2),false)
			elseif n == "seven" then
				self.level = 7
				self.button.sub1 = Button.createTextButton("Lesson 7-A    [5 % \ -]",cx,yy,false)
				self.button.sub2 = Button.createTextButton("Lesson 7-B    [6 = +]",cx,yy+(s*1),false)
				self.button.sub3 = Button.createTextButton("Lesson 7 Review",cx,yy+(s*2),false)
			elseif n == "eight" then
				self.level = 8
				self.button.sub1 = Button.createTextButton("Lesson 8-A    [, < . >]",cx,yy,false)
				self.button.sub2 = Button.createTextButton("Lesson 8 Review",cx,yy+(s*1),false)
				self.button.sub3 = nil
			elseif n == "sub1" then
				self:sub1()
			elseif n == "sub2" then
				self:sub2()
			elseif n == "sub3" then
				self:sub3()
			elseif n == "back" then
				state = Title.create()
			end
		end
	end

end

function LessonMenu:keypressed(key)
	if key == "escape" then
		state = Title.create()
	end
end


function LessonMenu:instructions()
	state = LessonInstruct.create()
end

function LessonMenu:sub1()
	if (self.level == 1) then
		lesson = Lesson.create(data_1a)
		state = lesson:next()
	elseif (self.level == 2) then
		lesson = Lesson.create(data_2a)
		state = lesson:next()
	end
end


function LessonMenu:sub2()
	if (self.level == 1) then
		lesson = Lesson.create(data_1b)
		state = lesson:next()
	end
end

function LessonMenu:sub3()
	if (self.level == 1) then
		lesson = Lesson.create(data_1r,9) -- step 9 for review level
		state = lesson:next()
	end
end



