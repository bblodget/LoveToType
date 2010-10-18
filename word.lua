-- word.lua
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


Word = {}
Word.__index = Word


-- word_list: the word list to use
-- info_list: info about the key being taught. (can be nil)
-- rand: boolen.  True = random order, False = seq order
-- words_per_line: how many words should be put on a line 
function Word.create(word_list, info_list, rand, words_per_line)
	local temp = {}
	setmetatable(temp, Word)

	temp.word_list = word_list
	temp.info_list = info_list
	temp.rand = rand
	temp.words_per_line = words_per_line 
	temp.entries_per_line = words_per_line / word_list.words_per_index

	temp.index = 1
	temp.info = ""
	temp.target = ""

	temp.x_start = 0

	temp.wpm = 0

	temp.timer_on = false;
	temp.total_time = 0
	temp.total_words = 0
	temp.stime = 0  
	temp.etime = 0 

	temp.uppercase = false;

	temp.rep_count = 1
	if (temp.rand) then
		temp.max_count = 16/temp.entries_per_line
	else
		temp.max_count = temp.word_list.size/temp.entries_per_line
	end

	temp.input = ""
	temp.line = 1
	temp.line1 = ""

	-- set font, background and text color
	love.graphics.setFont(font.large)
	love.graphics.setBackgroundColor(unpack(color.light_green)) 
	love.graphics.setColor(unpack(color.black)) 

	temp.newTarget(temp)  -- get first target line

	return temp
end


function Word:newTarget()
	if (self.rand) then
		self:newTargetRand()
	else
		self:newTargetSeq()
	end
end


function Word:newTargetRand()
	local prev_index =0
	local index = 0
	local l_width = 0  -- line width
	self.target = ""
	for i=1,self.entries_per_line do
		while (index == prev_index) do
			index = math.random(self.word_list.size)
		end
		self.target = self.target .. self.word_list[index]
		if ( i < self.entries_per_line) then
			self.target = self.target .. " "
		end
		prev_index = index
	end
	l_width = font.large:getWidth(self.target)
	self.x_start = 400 - (l_width/2)
end

function Word:newTargetSeq()
	local l_width = 0  -- line width
	self.target = ""
	for i=1,self.entries_per_line do
		self.target = self.target .. self.word_list[self.index]
		if (self.info_list) then
			self.info = self.info_list[self.index]
		end
		if ( i < self.entries_per_line) then
			self.target = self.target .. " "
		end
		if (self.index < self.word_list.size) then
			self.index = self.index + 1
		end
	end
	l_width = font.large:getWidth(self.target)
	self.x_start = 400 - (l_width/2)
end


function Word:draw()
	if (self.info_list) then
		love.graphics.printf(self.info,10,50,800, 'left')
	end
	love.graphics.printf(self.target, self.x_start,150,800, 'left')
	if (self.line == 1) then
		love.graphics.printf(self.input .. "_", self.x_start,250,800, 'left')
	else
		love.graphics.printf(self.line1, self.x_start,250,800, 'left')
		love.graphics.printf(self.input .. "_", self.x_start,300,800, 'left')
	end
end


function Word:update(dt)
	return;	-- do nothing
end

function Word:mousepressed(x,y,button)
	return;	-- do nothing
end


function Word:keypressed(key, unicode)
	if key == "escape" then
		state = create.LessonMenu()
	elseif key == "return" then
		self.etime = love.timer.getTime() -- get time before audio
		love.audio.stop()
		love.audio.play(sound.beep)
		if (self.input == self.target) then
			if (self.line == 1) then
				self.line1 = self.input
				self.input = ""
				self.line = 2
			else
				self.input = ""
				self.line1 = ""
				self.line = 1

				-- stop timing after 2nd line is correct
				self.timer_on = false;
				self.total_time = self.total_time + (self.etime-self.stime)
				self.total_words = self.total_words + (self.words_per_line*2)

				self:newTarget()
				self.rep_count = self.rep_count + 1
				if (self.rep_count > self.max_count) then
					self.wpm = math.floor((self.total_words * 60)/self.total_time)
					wpm = self.wpm
					state = lesson:next()
				end
			end
		else
			self.input = ""
		end
	elseif (key == "backspace") then
		-- do nothing
	elseif ( key == "rshift" or
			key == "lshift")  then
			self.uppercase = true
	else
		if (self.uppercase) then
			-- convert to upper case
			key = string.upper(key)
			self.uppercase = false
		end

		self.input = self.input .. key
		if (not self.timer_on) then
			-- start timing on first keypress of new target
			self.timer_on = true
			self.stime = love.timer.getTime()
		end
	end
end


