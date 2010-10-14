-- word.lua

module(..., package.seeall);

require "levels"
require "do_lesson"

-- global variable

wpm =0  -- words per minute

-- module vairables
local input = ""
local line = 1

local text = {}
local line1 = ""

local rep_count = 1  -- pattern rep count
local max_count = 0  -- max number of reps

local pattern = {}

local lesson_data_ = {}
local short_ = true
local size_ = 1

local target = ""
local x_start =0  -- x start pos

local timer_on = false
local words_per_line = 0
local total_time = 0
local total_words = 0
local stime = 0  -- start time
local etime = 0 -- end time

function newTarget()
	local prev_index =0
	local index = 0
	local l_width = 0  -- line width
	target = ""
	for i=1,size_ do
		while (index == prev_index) do
			index = math.random(pattern.size)
		end
		target = target .. pattern[index]
		if ( i < size_) then
			target = target .. " "
		end
		prev_index = index
	end
	l_width = bigfont:getWidth(target)
	x_start = 400 - (l_width/2)
end

-- lesson_data: the data for this level
-- short: boolean, true if for short words
-- size: how many pattern entries should be put on a line (2 or 4)
function load(lesson_data,short,size)
	lesson_data_ = lesson_data
	short_ = short
	size_ = size

	wpm = 0

	timer_on = false;
	words_per_line = size
	total_time = 0
	total_words = 0
	stime = 0  
	etime = 0 

	max_count = 16/size
	rep_count = 1

	-- choose word list
	if (short) then
		pattern = lesson_data.short
	else
		pattern = lesson_data.long
	end


	love.graphics.setBackgroundColor(128,255,128) -- light green
	love.graphics.setColor(0,0,0)  -- black
	love.draw = draw
	love.keypressed = keypressed
	input = ""
	line = 1
	line1 = ""
	newTarget()
end


function draw()
	love.graphics.setFont(bigfont)
	love.graphics.printf(target, x_start,150,800, 'left')
	if (line == 1) then
		love.graphics.printf(input .. "_", x_start,250,800, 'left')
	else
		love.graphics.printf(line1, x_start,250,800, 'left')
		love.graphics.printf(input .. "_", x_start,300,800, 'left')
	end
end

function keypressed(key, unicode)
	if key == "escape" then
		levels.load()
	elseif key == "return" then
		timer_on = false;
		etime = love.timer.getTime()
		love.audio.play(keysnd)
		if (input == target) then
			-- only track wpm if we got it right
			total_time = total_time + (etime-stime)
			total_words = total_words + words_per_line
			if (line == 1) then
				line1 = input
				input = ""
				line = 2
			else
				input = ""
				line1 = ""
				line = 1
				newTarget()
				rep_count = rep_count + 1
				if (rep_count > max_count) then
					--letters.load()
					wpm = (total_words * 60)/total_time
					print("words = " .. total_words)
					print("time = " .. total_time .. " sec")
					print("wpm = " .. wpm .. "\n")
					do_lesson.load(lesson_data_)
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
		if (not timer_on) then
			timer_on = true
			stime = love.timer.getTime()
		end
	end
end


