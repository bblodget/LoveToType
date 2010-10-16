-- title.lua

module(..., package.seeall);

require "lessons"

local changed = false
local full_screen = false

function load()
	love.graphics.setBackgroundColor(128,128,255) -- light blue
	love.graphics.setColor(0,0,0)  -- black

	love.draw = draw
	love.keypressed = keypressed
end


function draw()
	love.graphics.setFont(bigfont)

	love.graphics.setColor(255,255,255)  -- white?
	love.graphics.draw(love_img, 250,110)

	love.graphics.setColor(0,0,0)  -- black

	love.graphics.printf("To Type",320,120,800, 'left')

	if (not full_screen) then
		love.graphics.printf("1. Lessons\n" .. 
							 "2. Full Screen\n" ..
							 "3. Quit\n", 
					280,220,800, 'left')
					-- coming soon
					--		 "2. Diagnostic\n" ..
					--		 "3. Game\n" ..
	else
		love.graphics.printf("1. Lessons\n" .. 
							 "2. Windowed Screen\n" ..
							 "3. Quit\n",
					280,220,800, 'left')

					-- coming soon
					-- 		"2. Diagnostic\n" ..
					-- 		"3. Game\n" ..
	end

	love.graphics.printf("Your Choice? ",400,450,800, 'left')
end

function fullScreen()
	if (not full_screen) then
		-- change to full screen
		changed = love.graphics.toggleFullscreen()
		if (changed) then
			full_screen = true
		end
	end
end

function windowScreen()
	-- change to window mode
	changed = love.graphics.setMode(800,600,false,true)
	if (changed) then
		full_screen = false
	end
end

function keypressed(key, unicode)
	if key == "1" then
		lessons.load()
	end

	if key == "2" then
		if (not full_screen) then
			fullScreen()
		else
			windowScreen()
		end
	end

	if key == "3" then
		-- quit the program
		windowScreen()
		love.event.push('q')
	end
end


