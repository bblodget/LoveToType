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
local info_list_ = {}
local rand_ = false
local words_per_line_ = 0
local entries_per_line_ = 0
local newTarget_		-- function for getting new target line


local target = ""
local x_start =0  -- x start pos

local timer_on = false
local total_time = 0
local total_words = 0
local stime = 0  -- start time
local etime = 0 -- end time

local index = 1

function newTargetRand()
	local prev_index =0
	local index = 0
	local l_width = 0  -- line width
	target = ""
	for i=1,entries_per_line_ do
		while (index == prev_index) do
			index = math.random(word_list_.size)
		end
		target = target .. word_list_[index]
		if ( i < entries_per_line_) then
			target = target .. " "
		end
		prev_index = index
	end
	l_width = bigfont:getWidth(target)
	x_start = 400 - (l_width/2)
end

function newTargetSeq()
	local l_width = 0  -- line width
	target = ""
	for i=1,entries_per_line_ do
		target = target .. word_list_[index]
		if ( i < entries_per_line_) then
			target = target .. " "
		end
		if (index < word_list_.size) then
			index = index + 1
		end
	end
	l_width = bigfont:getWidth(target)
	x_start = 400 - (l_width/2)
end

-- word_list: the word list to use
-- info_list: info about the key being taught. (can be nil)
-- rand: boolen.  True = random order, False = seq order
-- words_per_line: how many words should be put on a line 
function load(word_list, info_list, rand, words_per_line)
	word_list_ = word_list
	info_list_ = info_list
	rand_ = rand
	words_per_line_ = words_per_line 
	entries_per_line_ = words_per_line_ / word_list_.words_per_index

	index = 1

	wpm = 0

	timer_on = false;
	total_time = 0
	total_words = 0
	stime = 0  
	etime = 0 

	rep_count = 1
	if (rand_) then
		max_count = 16/entries_per_line_
		newTarget_ = newTargetRand
	else
		max_count = word_list_.size/entries_per_line_
		newTarget_ = newTargetSeq
	end

	love.graphics.setBackgroundColor(128,255,128) -- light green
	love.graphics.setColor(0,0,0)  -- black
	love.draw = draw
	love.keypressed = keypressed
	input = ""
	line = 1
	line1 = ""
	newTarget_()  -- get first target line
end


function draw()
	love.graphics.setFont(bigfont)
	if (info_list_) then
		love.graphics.printf(info_list_[index],10,50,800, 'left')
	end
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
		etime = love.timer.getTime() -- get time before audio
		love.audio.play(keysnd)
		if (input == target) then
			if (line == 1) then
				line1 = input
				input = ""
				line = 2
			else
				input = ""
				line1 = ""
				line = 1

				-- stop timing after 2nd line is correct
				timer_on = false;
				total_time = total_time + (etime-stime)
				total_words = total_words + (words_per_line_*2)

				newTarget_()
				rep_count = rep_count + 1
				if (rep_count > max_count) then
					wpm = (total_words * 60)/total_time
					--print("words = " .. total_words)
					--print("time = " .. total_time .. " sec")
					--print("wpm = " .. wpm .. "\n")
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
			-- start timing on first keypress of new target
			timer_on = true
			stime = love.timer.getTime()
		end
	end
end


