------------------------------------------------------------------------
-- gameMenu.lua
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


GameMenu = {}
GameMenu.__index = LessonMenu  -- inherits from LessonMenu


function GameMenu.create()
	setmetatable(GameMenu, GameMenu)
	LessonMenu.create("Game")
	return GameMenu
end


function GameMenu:instructions()
	state = GameInstruct.create()
end

function GameMenu:sub1()
	if (self.level == 1) then
		state = Game.create(data_1a)
	elseif (self.level == 2) then
		state = Game.create(data_2a)
	end

end


function GameMenu:sub2()
	if (self.level == 1) then
		state = Game.create(data_1b)
	elseif (self.level == 2) then
		state = Game.create(data_2b)
	end
end

function GameMenu:sub3()
	if (self.level == 1) then
		state = Game.create(data_1r)
	end
end



