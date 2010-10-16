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

	if (step_ == 1) then word.load(data_.nonsense,data_.intro,false,2)
	elseif (step_ == 2) then letters.load(data_.letter)
	elseif (step_ == 3) then word.load(data_.nonsense,nil,false,2)
	elseif (step_ == 4) then letters.load(data_.letter)
	elseif (step_ == 5) then word.load(data_.short,nil,true,2)
	elseif (step_ == 6) then 
		data_.actual_wpm = math.floor(word.wpm)
		results.load(data_.name,false,data_.actual_wpm,data_.target_wpm)
		-- results.load("Lesson 1-A",false,72,15)
	elseif (step_ == 7) then word.load(data_.long,nil,true,4)
	elseif (step_ == 8) then 
		data_.actual_wpm = math.floor(word.wpm)
		results.load(data_.name,true,data_.actual_wpm,data_.target_wpm)
	else 
		-- back to the levels selection
		step_ = 0
		levels.load()
	end
end




