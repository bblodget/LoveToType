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

local word_list_ = {}
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
			index = math.random(word_list_.size)
		end
		target = target .. word_list_[index]
		if ( i < size_) then
			target = target .. " "
		end
		prev_index = index
	end
	l_width = bigfont:getWidth(target)
	x_start = 400 - (l_width/2)
end

-- word_list: the word list to use
-- size: how many words should be put on a line 
function load(word_list, size)
	word_list_ = word_list
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
					wpm = (total_words * 60)/total_time
					print("words = " .. total_words)
					print("time = " .. total_time .. " sec")
					print("wpm = " .. wpm .. "\n")
					do_lesson.load()
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


