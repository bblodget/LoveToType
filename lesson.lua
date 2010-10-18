-- lesson.lua
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



Lesson = {}
Lesson.__index = Lesson

-- The Lesson Outline
-- nonsense x1 (first time x2 2nd time) (intro text)
-- letter
-- nonsense x1 (first time x2 2nd time) (no intro text)
-- letter
-- short x2 x8 (timed)
-- actual wpm / target wpm 15
-- long x4 x4 (timed)
-- actual wpm / target wpm 15 (repeat or continue)



-- Creates the lesson for the given level data
function Lesson.create(data)
	local temp = {}
	setmetatable(temp, Lesson)

	temp.data = data
	temp.step = 0

	return temp
end


-- Returns the next lesson state
function Lesson:next()
	self.step = self.step + 1
	local data = self.data

	if (self.step == 1) then
		return Word.create(self.data.nonsense,self.data.intro,false,self.data.nonsense_len);
	elseif (self.step == 2) then 
		return Letters.create(data.letter)
	elseif (self.step == 3) then 
		return Word.create(data.nonsense,nil,false,data.nonsense_len)
	elseif (self.step == 4) then 
		return Letters.create(data.letter)
	elseif (self.step == 5) then 
		return Word.create(data.short,nil,true,2)
	elseif (self.step == 6) then 
		data.actual_wpm = wpm
		return Results.create(data.name,false,data.actual_wpm,data.target_wpm)
	elseif (self.step == 7) then 
		return Word.create(data.long,nil,true,4)
	elseif (self.step == 8) then 
		data.actual_wpm = wpm
		local target = data.target_wpm
		if (data.actual_wpm > target) then
			data.target_wpm = data.actual_wpm -2
			data.nonsense_len = 4
		end
		return Results.create(data.name,true,data.actual_wpm,target)
	else 
		-- back to the levels selection
		self.step = 0
		return LessonMenu.create()
	end

end




