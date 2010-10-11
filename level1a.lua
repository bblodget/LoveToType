-- level1a.lua

module(..., package.seeall);

require "levels"
require "letters"

local input = ""
local line = 1

local text = {}
local line1 = ""
local index = 1  -- index into pattern array

local pattern = {}
pattern.size = 8
pattern[1] = "aaa jjj"
pattern[2] = "sss kkk"
pattern[3] = "ddd lll"
pattern[4] = "fff ;;;"
pattern[5] = "kkk sss"
pattern[6] = ";;; fff"
pattern[7] = "jjj aaa"
pattern[8] = "lll ddd"

function load()
	love.graphics.setBackgroundColor(128,255,128) -- light green
	love.graphics.setColor(0,0,0)  -- black
	love.draw = draw
	love.keypressed = keypressed
	input = ""
	line = 1
	line1 = ""
	index = 1
end


function draw()
	love.graphics.setFont(bigfont)
	love.graphics.printf("Key: home \nHome row",10,50,800, 'left')
	love.graphics.printf(pattern[index], 350,150,740, 'left')
	if (line == 1) then
		love.graphics.printf(input .. "_", 350,250,740, 'left')
	else
		love.graphics.printf(line1, 350,250,740, 'left')
		love.graphics.printf(input .. "_", 350,300,740, 'left')
	end
end

function keypressed(key, unicode)
	if key == "escape" then
		levels.load()
	elseif key == "return" then
		love.audio.play(keysnd)
		if (input == pattern[index]) then
			if (line == 1) then
				line1 = input
				input = ""
				line = 2
			else
				input = ""
				line1 = ""
				line = 1
				index = index + 1
				if (index > pattern.size) then
					letters.load()
				end
			end
		else
			input = ""
		end
	elseif (key == "backspace" or 
			key == "rshift" or
			key == "lshift"
			)  then
			-- do nothing
	else
		input = input .. key
	end
end


