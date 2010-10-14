-- do_lesson.lua

module(..., package.seeall);

require "levels"
require "letters"
require "word"

local step_ = 0
local data_ = {}  -- lesson data

function load(data)
	if data then data_ = data end

	step_ = step_ + 1
	love.graphics.setBackgroundColor(128,255,128) -- light green
	love.graphics.setColor(0,0,0)  -- black

	if (step_ == 1) then word.load(data_.nonsense,data_.intro,false,2)
	elseif (step_ == 2) then letters.load(data_)
	elseif (step_ == 3) then word.load(data_.nonsense,nil,false,2)
	elseif (step_ == 4) then letters.load(data_)
	elseif (step_ == 5) then word.load(data_.short,nil,true,2)
	elseif (step_ == 6) then word.load(data_.long,nil,true,4)
	--[[
	if (step_ == 1) then word.load(data_.short,nil,true,2)
	elseif (step_ == 2) then word.load(data_.long,nil,true,4)
	--]]
	else 
		-- back to the levels selection
		step_ = 0
		levels.load()
	end



end




