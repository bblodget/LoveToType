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
-- rand_list_size: How many words in rand mode
function Word.create(word_list, info_list, rand, words_per_line, rand_list_size,
			title, bgcolor)
	local self = Word

	if (not rand_list_size) then
		rand_list_size = 16
	end

	self.title = title
	self.bgcolor = color.light_green
	if (bgcolor) then self.bgcolor = bgcolor end

	self.word_list = word_list
	self.info_list = info_list
	self.rand = rand
	self.words_per_line = words_per_line 
	self.entries_per_line = words_per_line / word_list.words_per_index

	self.index = 1
	self.info = ""
	self.target = ""

	self.x_start = 0

	self.wpm = 0

	self.timer_on = false;
	self.total_time = 0
	self.total_words = 0
	self.stime = 0  
	self.etime = 0 

	self.uppercase = false;

	self.rep_count = 1
	if (self.rand) then
		self.max_count = rand_list_size/self.entries_per_line
	else
		self.max_count = self.word_list.size/self.entries_per_line
	end

	self.input = ""
	self.line = 1
	self.line1 = ""

	-- set font, background and text color
	love.graphics.setFont(font.large)
	love.graphics.setBackgroundColor(unpack(self.bgcolor)) 
	love.graphics.setColor(unpack(color.black)) 

	self:newTarget()  -- get first target line

	return self
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
	if (self.title) then
		love.graphics.setFont(font.large)
		love.graphics.printf(string.upper(self.title),0,50,800, 'center')
	end

	if (self.info_list) then
		love.graphics.setFont(font.default)
		love.graphics.printf(self.info,10,50,800, 'left')
	end
	love.graphics.setFont(font.large)
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
		state = LessonMenu.create()
	elseif (key == "return" or   -- return
			(key == " " and self.input == self.target) or -- space at end
			# self.input > # self.target  -- too many characters
			) then

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
			if (key == ";") then
				key = ":"
			elseif (key == "/") then
				key = "?"
			elseif (key == "'") then
				key = "\""
			end
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


