-- levels.lua

module(..., package.seeall);

require "lessons"
require "do_lesson"
require "data_1a"
require "data_1b"

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


