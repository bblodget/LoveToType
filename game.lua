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


function Game.create(nonsense_words, short_words, long_words)
	local self = Game

	self.nonsense_words = nonsense_words
	self.short_words = short_words
	self.long_words = long_words

	self.index = 0
	self.prev_index = 0

	self.word_list = self.short_words

	self.y1 = 120
	self.y2 = 220

	self.plane = { img = graphics.plane, x=0, y=self.y1, xSpeed=120, scale=0.25 };
	self.cloud = { img = graphics.cloud, x=800, y=self.y2, xSpeed=-200, scale=0.50 };


	self.objects = {
		self.plane,
		self.cloud
	}

	self.words = {
		{ word = self:randomWord(), x=200, y=150, state="none"},
		{ word = self:randomWord(), x=400, y=175, state="none"},
		{ word = self:randomWord(), x=600, y=200, state="none"},
		{ word = self:randomWord(), x=200, y=250, state="none"},
		{ word = self:randomWord(), x=400, y=275, state="none"},
		{ word = self:randomWord(), x=600, y=300, state="none"}
	}

	love.graphics.setBackgroundColor(unpack(color.light_blue))
	love.graphics.setColor(unpack(color.white))
	love.graphics.setFont(font.large)

	return self

end

-- Return random word from the word_list.
-- Make sure we don't choose the same word twice in a row.
function Game:randomWord()
	local s = self

	while (s.index == s.prev_index) do
		s.index =math.random(s.word_list.size)
	end

	s.prev_index = s.index
	return s.word_list[s.index]
end


function Game:draw()
	local wAdjust = ((graphics.sun:getWidth() * 0.25) / 3)
	local hAdjust = (graphics.sun:getHeight() * 0.25) / 2

	-- text
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
	end

	-- show word?
	if (self.plane.y == self.y1) then
		-- top line
		if (self.plane.x > 200 and self.plane.x < 210) then
			self.words[1].state="word"
		elseif (self.plane.x > 400 and self.plane.x < 410) then
			self.words[2].state="word"
		elseif (self.plane.x > 600 and self.plane.x < 610) then
			self.words[3].state="word"
		end
	else
		-- bottom line
		if (self.plane.x > 200 and self.plane.x < 210) then
			self.words[4].state="word"
		elseif (self.plane.x > 400 and self.plane.x < 410) then
			self.words[5].state="word"
		elseif (self.plane.x > 600 and self.plane.x < 610) then
			self.words[6].state="word"
		end
	end
end


function Game:mousepressed(x,y,button)
	return
end

function Game:keypressed(key)
	return
end

function Game:keypressed(key)
	if key == "escape" then
		state = Title.create()
	end
end





