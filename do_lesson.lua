-- do_lesson.lua

module(..., package.seeall);

require "levels"
require "letters"
require "word"
require "results"

local step_ = 0
local data_ = {}  -- lesson data

function load(data)
	if data then 
		-- initialize
		data_ = data 
		step_ = 0
	end

	step_ = step_ + 1
	love.graphics.setBackgroundColor(128,255,128) -- light green
	love.graphics.setColor(0,0,0)  -- black

	if (step_ == 1) then 
		word.load(data_.nonsense,data_.intro,false,data_.nonsense_len)
	elseif (step_ == 2) then letters.load(data_.letter)
	elseif (step_ == 3) then 
		word.load(data_.nonsense,nil,false,data_.nonsense_len)
	elseif (step_ == 4) then letters.load(data_.letter)
	elseif (step_ == 5) then word.load(data_.short,nil,true,2)
	elseif (step_ == 6) then 
		data_.actual_wpm = math.floor(word.wpm)
		results.load(data_.name,false,data_.actual_wpm,data_.target_wpm)
		-- results.load("Lesson 1-A",false,72,15)
	elseif (step_ == 7) then word.load(data_.long,nil,true,4)
	elseif (step_ == 8) then 
		data_.actual_wpm = math.floor(word.wpm)
		local target = data_.target_wpm
		if (data_.actual_wpm > target) then
			data_.target_wpm = data_.actual_wpm -2
			data_.nonsense_len = 4
		end
		results.load(data_.name,true,data_.actual_wpm,target)
	else 
		-- back to the levels selection
		step_ = 0
		levels.load()
	end
end




