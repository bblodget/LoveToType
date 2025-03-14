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

	self.data = data
	self.nonsense_words = data.nonsense
	self.short_words = data.short
	self.long_words = data.long

	self.PIXELS_PER_WORD = 70  -- estimate
	self.AVG_OVER = 3		-- number of words to avg time over
	self.START_TIME = 180 -- seconds (3 minutes)
	self.START_SPEED = 60  -- initial speed of plane
	self.time_left = self.START_TIME
	self.time = 0		-- counts seconds since start of game
	self.timer_start = love.timer.getTime()
	self.display_time_left = 0
	self.first_time = true	-- just started the game

	self.score = 0
	self.hits = 0
	self.max_hits = 5
	self.uppercase = false
	self.input = ""
	self.num_letters = 0
	self.last_pos = 0   -- the last word pos of plane
	self.min_index = 1	-- min index for choosing random word from word_list
	self.max_speed = self.START_SPEED -- the maximum speed achieved so far
	self.final_speed = 0 -- speed of plane at end of game

	-- timing member vars
	self.timer_on = false
	self.stime = 0
	self.etime = 0
	self.word_time = {0,0,0,0,0,0}  -- time to type last 6 correct words
	self.ti	= 1 -- time index into self.word_time
	self.avg_time = 1		-- avg per word time

	self.word_list = {}

	-- merge all the lists into one
	self:initWordList()


	self.y1 = 100
	self.y2 = 250

	self.game_over = false
	self.line_count = 0  -- count of how many lines the plane has flown over

	self.button = {
		game_over = Button.createTextButton("Time is up!", 400, 250,false),
		back = Button.createTextButton("Back", 300, 350), 
		again = Button.createTextButton("Again", 500, 350)
	}

	self.plane = { img = graphics.plane, line=1, x=0, y=self.y1, xSpeed=self.START_SPEED};
	self.cloud = { img = graphics.cloud, line=2, x=800, y=self.y2, xSpeed=-200};

	self.objects = {
		self.plane,
		self.cloud
	}

	self.words = {
		{ word = "", line=1, x=200, y=self.y1+0, state="none"},
		{ word = "", line=1, x=400, y=self.y1+30, state="none"},
		{ word = "", line=1, x=600, y=self.y1+55, state="none"},
		{ word = "", line=2, x=200, y=self.y2+0, state="none"},
		{ word = "", line=2, x=400, y=self.y2+30, state="none"},
		{ word = "", line=2, x=600, y=self.y2+55, state="none"}
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
	if (self.nonsense_words) then
		for k,v in ipairs(self.nonsense_words) do 
			self.word_list[i] = v 
			i = i + 1
		end
	end

	if (self.short_words) then
		for k,v in ipairs(self.short_words) do 
			self.word_list[i] = v 
			i = i + 1
		end
	end

	if (self.long_words) then
		for k,v in ipairs(self.long_words) do 
			self.word_list[i] = v 
			i = i + 1
		end
	end

	self.word_list.max_size = # self.word_list

	-- if nonsense_words exist start with small list size
	-- if no nonsense words then this is a review level
	-- so include all the words
	if (self.nonsense_words) then
		self.word_list.size = 2  -- start size
	else
		self.word_list.size = self.word_list.max_size  -- start size
	end

end

-- Initialize possition for typed word box
function Game:initBox()
	local max_str = "abcdefghj"
	love.graphics.setFont(font.large)
	self.rw = font.large:getWidth(max_str)
	self.rh = font.large:getHeight() * 2
	self.rx = 400 - (self.rw/2)
	-- self.ry = 500 - (self.rh / 1.5)
	self.ry = 500  - (self.rh / 4)

end

-- Return random word from the word_list.
function Game:randomWord()
	local s = self
	local index
	local new_word = ""
	local done = false

	-- if this is a review level (no nonsense words)
	-- then set the min_index = 1 so we get the whole list
	if (not s.nonsense_words) then
		s.min_index = 1
	end

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


-- increases the speed of the plane
function Game:incPlaneSpeed()
	-- local max_speed=400
	local speed = math.floor(self.PIXELS_PER_WORD/self.avg_time) + 20

	-- compare current speed to new speed
	local delta = speed - self.plane.xSpeed

	if (delta > 10) then
		self.plane.xSpeed = speed
	else 
		self.plane.xSpeed = self.plane.xSpeed + 10
	end


	--if (self.plane.xSpeed > max_speed) then
	--	self.plane.xSpeed = max_speed
	--end

	-- keep track of max_speed
	if (self.plane.xSpeed > self.max_speed) then
		self.max_speed = self.plane.xSpeed
		-- increase cloud speed in neg direction
		if (self.max_speed > 200) then
			self.cloud.xSpeed = -(self.max_speed + 50)
		end
	end




	--print("plane_speed: " .. self.plane.xSpeed)
end

-- decrease the speed of the plane
function Game:decPlaneSpeed()
	local min_speed=40
	local dec_amount = 20

	self.plane.xSpeed = self.plane.xSpeed - dec_amount

	if (self.plane.xSpeed < min_speed) then
		self.plane.xSpeed = min_speed
	end

	--print("speed: " .. self.plane.xSpeed)


end


function Game:draw()
	local wAdjust = graphics.sun:getWidth()  / 3
	local hAdjust = graphics.sun:getHeight()  / 2

	if (not self.game_over) then

		-- word or sun
		love.graphics.setFont(font.large)
		for i,w in ipairs(self.words) do
			if (w.state == "word") then
				love.graphics.setColor(unpack(color.black))
				love.graphics.printf(w.word, w.x, w.y,800,'left')
			elseif (w.state == "sun") then
				love.graphics.setColor(unpack(color.overlay))
				love.graphics.draw(graphics.sun, w.x -wAdjust, w.y -hAdjust, 0)
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
	-- love.graphics.setFont(font.default)
	-- love.graphics.setColor(unpack(color.black))
	-- local t_score = "score\n" .. self.score
	-- love.graphics.printf(t_score, 40, 500,800,'left')

	-- show speed
	love.graphics.setFont(font.default)
	love.graphics.setColor(unpack(color.black))
	local t_cspeed = "speed " .. self.plane.xSpeed
	local t_mspeed = "max speed " .. self.max_speed
	if (self.game_over) then
		t_cspeed = "final speed " .. self.final_speed
	end
	love.graphics.printf(t_cspeed, 40, 500,800,'left')
	love.graphics.printf(t_mspeed, 40, 550,800,'left')

	-- hits
	--local t_hits = "hit words\n" .. self.hits
	--love.graphics.printf(t_hits .. "/" .. self.max_hits, 650, 500,800,'left')

	-- time
	love.graphics.printf("count down\n" .. self.display_time_left, 650, 500,800,'left')


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

	-- update timers
	if (not self.game_over) then
		local timer_end = 0
		timer_end = love.timer.getTime()
		self.time = math.floor(timer_end - self.timer_start)
		self.time_left = self.START_TIME - self.time
		if (self.time_left > 10) then
			self.display_time_left = math.floor(self.time_left/10)
		else
			self.display_time_left = self.time_left/10
		end

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

			-- adjust word list size according to plane speed
			if (self.plane.xSpeed > 120) then
				self.word_list.size = self.word_list.size + 4
				self.min_index = self.min_index + 2
			elseif (self.plane.xSpeed > 100) then
				self.word_list.size = self.word_list.size + 2
				self.min_index = self.min_index + 1
			elseif (self.plane.xSpeed >= 60) then
				self.word_list.size = self.word_list.size + 1
			end
				
			if (self.word_list.size > self.word_list.max_size) then
				self.word_list.size = self.word_list.max_size
			end
			if (self.min_index  > self.word_list.max_size -10) then
				self.min_index = self.min_index - 10
			end
			--print("min_index: " .. self.min_index)
			--print("max_index: " .. self.word_list.size)
		end

		-- count how many suns are on the screen
		local suns = 0
		for i,w in ipairs(self.words) do
			if (w.state=="sun") then
				suns = suns + 1
			end
		end

		
		-- the first time on the first line
		-- add 3 suns (for the 2nd line)
		-- this gets us up to speed faster
		if (self.first_time) then
			self.first_time = false
			suns = suns + 3
		end

		-- adjust plane speed
		if (suns > 3) then
			self:incPlaneSpeed()
		elseif (suns <= 2) then
			self:decPlaneSpeed()
		end

		-- print("speed: " .. self.plane.xSpeed)


	end

	-- check if plane is over a word posiiton
	local px = self.plane.x
	local pl = self.plane.line

	for i, w in ipairs(self.words) do
		if (px > w.x and px < w.x+10 and pl==w.line and self.last_pos ~= i) then
			self.last_pos = i
			if (w.state=="word") then
				self.hits = self.hits + 1
				self:decPlaneSpeed()  -- slow plane down
				w.word = ""
				w.state = "none"
			else
				w.word = self:randomWord()
				w.state = "word"
			end
		end
	end

	-- check if game is over
	--if (self.hits >= self.max_hits) then
	if (self.time_left <= 0 and not self.game_over) then
		self.final_speed = self.plane.xSpeed

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
				state = GameMenu.create()
			elseif n == "again" then
				state = Game.create(self.data)
			end
		end
	end

end

function Game:keypressed(key)
	if key == "escape" then
		state = GameMenu.create()
	elseif (key == "return" or key == "space") then
		if (game_over) then return end

		self.etime = love.timer.getTime() -- get time before audio

		love.audio.stop()
		love.audio.play(sound.beep)

		-- check if input matches a displayed word
		for i,w in ipairs(self.words)do
			if (w.word == self.input and w.state=="word") then
				w.word=""
				w.state="sun"
				self.score = self.score + self.num_letters

				-- stop timing to get time for word
				self.timer_on = false;
				self.word_time[self.ti] = self.etime-self.stime
				-- print("word_time: " .. self.word_time[self.ti])
				if (self.ti == self.AVG_OVER) then self.ti = 0 end
				self.ti = self.ti + 1

				-- avg time for last 6 words
				local n = 0
				local sum = 0
				--for i,t in ipairs(self.word_time) do
				for i=1,self.AVG_OVER do
					t = self.word_time[i]
					if (t>0) then
						sum = sum + t
						n = n + 1
					end
				end
				self.avg_time = sum / n
				-- print("avg_time: " .. self.avg_time)

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

		-- Special case for space key in LÖVE 11.5
		if key == "space" then
			key = " "  -- Convert "space" to a single space character
		end
		
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
		self.num_letters = self.num_letters + 1

		if (not self.timer_on) then
			-- start timing a new word
			self.timer_on = true
			self.stime = love.timer.getTime()
		end

		-- handle too many letters typed
		if (self.num_letters == 8) then
			self.input=""
			self.num_letters = 0
			love.audio.stop()
			love.audio.play(sound.beep)
		end

	end
end






