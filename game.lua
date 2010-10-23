------------------------------------------------------------------------
-- game.lua
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
------------------------------------------------------------------------


Game = {}
Game.__index = Game


function Game.create(data)
	local self = Game

	self.nonsense_words = data.nonsense
	self.short_words = data.short
	self.long_words = data.long

	self.score = 0
	self.hits = 0
	self.max_hits = 5
	self.uppercase = false
	self.input = ""
	self.num_letters = 0
	self.last_pos = 0   -- the last word pos of plane
	self.min_index = 1	-- min index for choosing random word from word_list

	self.word_list = {}

	-- merge all the lists into one
	self:initWordList()


	self.y1 = 100
	self.y2 = 250
	self.game_over = false
	self.line_count = 0  -- count of how many lines the plane has flown over

	self.button = {
		game_over = Button.createTextButton("Game Over", 400, 250,false),
		again = Button.createTextButton("Again", 300, 350),
		back = Button.createTextButton("Back", 500, 350) 
	}

	self.plane = { img = graphics.plane, line=1, x=0, y=self.y1, xSpeed=60, scale=0.25 };
	self.cloud = { img = graphics.cloud, line=2, x=800, y=self.y2, xSpeed=-200, scale=0.50 };


	self.objects = {
		self.plane,
		self.cloud
	}

	self.words = {
		{ word = "", line=1, x=200, y=self.y1+30, state="none"},
		{ word = "", line=1, x=400, y=self.y1+55, state="none"},
		{ word = "", line=1, x=600, y=self.y1+80, state="none"},
		{ word = "", line=2, x=200, y=self.y2+30, state="none"},
		{ word = "", line=2, x=400, y=self.y2+55, state="none"},
		{ word = "", line=2, x=600, y=self.y2+80, state="none"}
	}

	love.graphics.setBackgroundColor(unpack(color.light_blue))
	love.graphics.setColor(unpack(color.white))
	love.graphics.setFont(font.large)
	love.graphics.setLineWidth(3)

	self:initBox()

	return self

end


-- Merge all the word lists into one
function Game:initWordList()
	local i = 1
	for k,v in ipairs(self.nonsense_words) do 
		self.word_list[i] = v 
		i = i + 1
	end
	for k,v in ipairs(self.short_words) do 
		self.word_list[i] = v 
		i = i + 1
	end
	for k,v in ipairs(self.long_words) do 
		self.word_list[i] = v 
		i = i + 1
	end

	self.word_list.max_size = # self.word_list
	self.word_list.size = 2  -- start size

end

-- Initialize possition for typed word box
function Game:initBox()
	local max_str = "abcdefghj"
	love.graphics.setFont(font.large)
	self.rw = font.large:getWidth(max_str)
	self.rh = font.large:getHeight() * 2
	self.rx = 400 - (self.rw/2)
	self.ry = 500 - (self.rh / 1.5)

end

-- Return random word from the word_list.
-- Make sure the word has not already been displayed 
function Game:randomWord()
	local s = self
	local index
	local new_word = ""
	local done = false

	while (not done) do
		index =math.random(s.min_index, s.word_list.size)
		new_word = s.word_list[index]
		done =true
		--[[
		for i,w in ipairs(self.words) do
			if (new_word == w.word) then
				done=false
			end
		end
		--]]
	end
	return new_word
end


-- changes the speed of the plane
function Game:changePlaneSpeed(delta)
	local min_speed=60
	local max_speed=300

	self.plane.xSpeed = self.plane.xSpeed + delta

	if (self.plane.xSpeed > max_speed) then
		self.plane.xSpeed = max_speed
	end

	if (self.plane.xSpeed < min_speed) then
		self.plane.xSpeed = min_speed
	end

	print("speed: " .. self.plane.xSpeed)


end


function Game:draw()
	local wAdjust = ((graphics.sun:getWidth() * 0.25) / 3)
	local hAdjust = (graphics.sun:getHeight() * 0.25) / 2

	if (not self.game_over) then

		-- word or sun
		love.graphics.setFont(font.large)
		for i,w in ipairs(self.words) do
			if (w.state == "word") then
				love.graphics.setColor(unpack(color.black))
				love.graphics.printf(w.word, w.x, w.y,800,'left')
			elseif (w.state == "sun") then
				love.graphics.setColor(unpack(color.overlay))
				love.graphics.draw(graphics.sun, w.x -wAdjust, w.y -hAdjust, 0, 0.25)
			end
		end

		-- objects
		love.graphics.setColor(unpack(color.white))
		for i,o in ipairs(self.objects) do
			love.graphics.draw(o.img, o.x, o.y,0,o.scale)
		end

	else
		-- buttons for game over
		love.graphics.setFont(font.large)
		for n,b in pairs(self.button) do
			b:draw()
		end

	end

	-- score
	love.graphics.setFont(font.default)
	love.graphics.setColor(unpack(color.black))
	local t_score = "score\n" .. self.score
	love.graphics.printf(t_score, 40, 500,800,'left')

	-- hits
	local t_hits = "hit words\n" .. self.hits
	love.graphics.printf(t_hits .. "/" .. self.max_hits, 650, 500,800,'left')

	-- draw rect for typed word
	love.graphics.rectangle("line", self.rx, self.ry, self.rw, self.rh)

	-- typed word
	love.graphics.setFont(font.large)
	love.graphics.printf(self.input, self.rx+10 ,500,800, 'left')


end


function Game:update(dt)

	for i,o in ipairs(self.objects) do
		love.graphics.draw(o.img, o.x, o.y)
		o.x = o.x + (o.xSpeed * dt)
	end

	-- check cloud off screen to the left
	if (self.cloud.x < -200) then
		self.cloud.x = 800
	end

	-- check plane off screen to the right
	if (self.plane.x > 805) then
		self.plane.x = -195
		self.cloud.x = 800
		self.plane.y, self.cloud.y = self.cloud.y, self.plane.y
		self.plane.line, self.cloud.line = self.cloud.line, self.plane.line

		self.line_count = self.line_count + 1
		if (self.line_count == 2) then
			-- add more active words
			self.line_count = 0
			self:changePlaneSpeed(-10)  -- slow down a little for new words
			self.word_list.size = self.word_list.size + 2
			if (self.word_list.size > self.word_list.max_size) then
				self.word_list.size = self.word_list.max_size
			end
			if (self.word_list.size  > 5) then
				self.min_index = self.word_list.size - 5
			end
			print("min_index: " .. self.min_index)
			print("max_index: " .. self.word_list.size)
		end

		-- count how many suns are on the screen
		local suns = 0
		for i,w in ipairs(self.words) do
			if (w.state=="sun") then
				suns = suns + 1
			end
		end

		-- adjust speed
		if (suns >= 5) then
			self:changePlaneSpeed(20)
		end

		if (suns <= 1) then
			self:changePlaneSpeed(-20)
		end

	end

	-- check if plane is over a word posiiton
	local px = self.plane.x
	local pl = self.plane.line

	for i, w in ipairs(self.words) do
		if (px > w.x and px < w.x+10 and pl==w.line and self.last_pos ~= i) then
			self.last_pos = i
			if (w.state=="word") then
				self.hits = self.hits + 1
				self:changePlaneSpeed(-10)  -- slow plane down
				w.word = ""
				w.state = "none"
			else
				w.word = self:randomWord()
				w.state = "word"
			end
		end
	end

	-- check if game is over
	if (self.hits >= self.max_hits) then
		-- freeze the moving things
		self.plane.xSpeed = 0
		self.cloud.xSpeed = 0
		self.game_over = true
	end

	-- update game over buttons
	if (self.game_over) then
		for n,b in pairs(self.button) do
			b:update(dt)
		end
	end

end


function Game:mousepressed(x,y,button)

	for n,b in pairs(self.button) do
		if b:mousepressed(x,y,button) then
			if n == "back" then
				state = Title.create()
			elseif n == "again" then
				state = Game.create(data)
			end
		end
	end

end

function Game:keypressed(key)
	return
end

function Game:keypressed(key)
	if key == "escape" then
		state = Title.create()
	elseif key == "return" then
		if (game_over) then return end

		love.audio.stop()
		love.audio.play(sound.beep)

		-- check if input matches a displayed word
		for i,w in ipairs(self.words)do
			if (w.word == self.input and w.state=="word") then
				w.word=""
				w.state="sun"
				self.score = self.score + self.num_letters
				break;
			end
		end

		self.input = ""
		self.num_letters = 0

	elseif (key == "backspace") then
		-- do nothing
	elseif ( key == "rshift" or
			key == "lshift")  then
			self.uppercase = true
	else
		if (game_over) then return end

		if (self.uppercase) then
			-- convert to upper case
			key = string.upper(key)
			self.uppercase = false
		end

		self.input = self.input .. key
		self.num_letters = self.num_letters + 1
		if (self.num_letters == 8) then
			self.input=""
			self.num_letters = 0
			love.audio.stop()
			love.audio.play(sound.beep)
		end

	end
end






