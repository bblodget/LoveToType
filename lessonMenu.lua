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


LessonMenu = {}
LessonMenu.__index = LessonMenu


function LessonMenu.create()
	local temp = {}

	setmetatable(temp, LessonMenu)

	temp.cx = 400
	temp.x = 200
	temp.y = 250
	temp.xx = temp.x + 100
	temp.yy = temp.y + 100
	temp.s = 50

	local cx = temp.cx
	local x = temp.x
	local y = temp.y
	local xx = temp.xx
	local yy = temp.yy
	local s = temp.s

	temp.button = {
		title = Button.createTextButton("Lessons", 400, 120, false),

		level = Button.createTextButton("Level:", x, y, false),

		instruct = Button.createTextButton("Instructions", cx, y-50),

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
		-- instruct = Button.createTextButton("Instructions", cx, yy+(s*3)),

		back = Button.createTextButton("Back", cx, 550) 

	}

	temp.level = 1

	return temp
end


function LessonMenu:draw()
	love.graphics.setBackgroundColor(unpack(background))

	for n,b in pairs(self.button) do
		b:draw()
	end

	-- draw line under selected level
	love.graphics.setColor(unpack(hover_text))
	love.graphics.setLine(4, "rough")
	local l = self.level - 1
	love.graphics.line((self.xx-15)+((l)*self.s),(self.y+5),(self.xx+15)+((l)*self.s),(self.y+5))
	-- love.graphics.line(285+((l)*50),255,315+((l)*50),255)

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
			if n == "lessons" then
			elseif n == "one" then
				self.level = 1
				self.button.sub1 = Button.createTextButton("Lesson 1-A    [home keys]",cx,yy)
				self.button.sub2 = Button.createTextButton("Lesson 1-B    [e n g o]",cx,yy+(s*1))
				self.button.sub3 = Button.createTextButton("Lesson 1 Review",cx,yy+(s*2))
			elseif n == "two" then
				self.level = 2
				self.button.sub1 = Button.createTextButton("Lesson 2-A    [t i h c]",cx,yy)
				self.button.sub2 = Button.createTextButton("Lesson 2-B    [r u v p .]",cx,yy+(s*1))
				self.button.sub3 = Button.createTextButton("Lesson 2 Review",cx,yy+(s*2))
			elseif n == "three" then
				self.level = 3
				self.button.sub1 = Button.createTextButton("Lesson 3-A    [q m x b :]",cx,yy)
				self.button.sub2 = Button.createTextButton("Lesson 3-B    [w y z ,]",cx,yy+(s*1))
				self.button.sub3 = Button.createTextButton("Lesson 3 Review",cx,yy+(s*2))
			elseif n == "four" then
				self.level = 4
				self.button.sub1 = Button.createTextButton("Lesson 4-A    [? ' / \"]",cx,yy)
				self.button.sub2 = Button.createTextButton("Lesson 4 Review   [r u v p .]",cx,yy+(s*1))
				self.button.sub3 = nil
			elseif n == "five" then
				self.level = 5
				self.button.sub1 = Button.createTextButton("Lesson 5-A    [0 ) 2 @]",cx,yy)
				self.button.sub2 = Button.createTextButton("Lesson 5-B    [1 ! 9 (]",cx,yy+(s*1))
				self.button.sub3 = Button.createTextButton("Lesson 5 Review",cx,yy+(s*2))
			elseif n == "six" then
				self.level = 6
				self.button.sub1 = Button.createTextButton("Lesson 6-A    [4 $ 8 *]",cx,yy)
				self.button.sub2 = Button.createTextButton("Lesson 6-B    [3 # 7 &]",cx,yy+(s*1))
				self.button.sub3 = Button.createTextButton("Lesson 6 Review",cx,yy+(s*2))
			elseif n == "seven" then
				self.level = 7
				self.button.sub1 = Button.createTextButton("Lesson 7-A    [5 % \ -]",cx,yy)
				self.button.sub2 = Button.createTextButton("Lesson 7-B    [6 = +]",cx,yy+(s*1))
				self.button.sub3 = Button.createTextButton("Lesson 7 Review",cx,yy+(s*2))
			elseif n == "eight" then
				self.level = 8
				self.button.sub1 = Button.createTextButton("Lesson 8-A    [, < . >]",cx,yy)
				self.button.sub2 = Button.createTextButton("Lesson 8 Review",cx,yy+(s*1))
				self.button.sub3 = nil
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

------------------- old Stuff ---------

local level=0
local submenu = ""

function load()
	love.graphics.setBackgroundColor(128,128,255) -- light blue
	love.graphics.setColor(0,0,0)  -- black

	love.draw = draw
	love.keypressed = keypressed
	level = 0
	submenu = ""
end

function draw()
	love.graphics.setFont(bigfont)
	love.graphics.printf("Lessons",0,50,800, 'center')
	if (level == 0) then
		love.graphics.printf("Level (1-1)? ", 50,150,740, 'left')
	else
		love.graphics.printf("Level (1-1)? " .. level, 50,150,740, 'left')
		love.graphics.printf(submenu, 50,220,740, 'left')
	end
	love.graphics.printf("Esc=Back",0,500,800, 'center')
end


-- select sub level lesson
function submenu_kp(key, unicode)
	if key == "escape" then
		love.keypressed = keypressed
		level = 0
		submenu = ""
	end

	if level==1 then
		if key == "1" then
			do_lesson.load(data_1a)
		end
		if key == "2" then
			do_lesson.load(data_1b)
		end
	end
end

-- select lesson level
function keypressed(key, unicode)
	if key == "escape" then
		lessons.load()
	end

	if key == "1" then level = 1
		submenu = "1. Lesson 1-A    [home keys] \n" ..
				  "2. Lesson 1-B    [e n g o]  \n" ..
				  --"3. Review 1 \n\n" ..
				  "        Your Choice?"
		love.keypressed = submenu_kp
	end
	--[[
	elseif key == "2" then level = 2
		submenu = "1. Lesson 2-A    [t i h c] \n" ..
				  "2. Lesson 2-B    [r u v p .]  \n" ..
				  "3. Review 2 \n\n" ..
				  "        Your Choice?"
		love.keypressed = submenu_kp
	elseif key == "3" then level = 3
		submenu = "1. Lesson 3-A    [q m x b :] \n" ..
				  "2. Lesson 3-B    [w y z ,]  \n" ..
				  "3. Review 3 \n\n" ..
				  "        Your Choice?"
		love.keypressed = submenu_kp
	elseif key == "4" then level = 4
		submenu = "1. Lesson 4-A    [? ' \"] \n" ..
				  "2. Review 4 \n\n" ..
				  "        Your Choice?"
		love.keypressed = submenu_kp
	elseif key == "5" then level = 5
		submenu = "1. Lesson 5-A    [0 ) 2 @] \n" ..
				  "2. Lesson 5-B    [1 ! 9 (]  \n" ..
				  "3. Review 5 \n\n" ..
				  "        Your Choice?"
		love.keypressed = submenu_kp
	elseif key == "6" then level = 6
		submenu = "1. Lesson 6-A    [4 $ 8 *] \n" ..
				  "2. Lesson 6-B    [3 # 7 &]  \n" ..
				  "3. Review 6 \n\n" ..
				  "        Your Choice?"
		love.keypressed = submenu_kp
	elseif key == "7" then level = 7
		submenu = "1. Lesson 7-A    [5 % / -] \n" ..
				  "2. Lesson 7-B    [6 = +]  \n" ..
				  "3. Review 7 \n\n" ..
				  "        Your Choice?"
		love.keypressed = submenu_kp
	elseif key == "8" then level = 8
		submenu = "1. Lesson 8-A    [, < . >] \n" ..
				  "2. Review 8 \n\n" ..
				  "        Your Choice?"
		love.keypressed = submenu_kp
	end
	--]]

end


