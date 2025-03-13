-- conf.lua
-- 
-- Copyright 2010, 2011 Brandon Blodget
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

function love.conf(t)
	t.title = "LoveToType"
	t.author = "Brandon Blodget"
	
	-- Updated from t.screen to t.window for LÖVE 11.5 compatibility
	t.window = t.window or {}  -- Create window table if it doesn't exist
	t.window.width = 800
	t.window.height = 600
	
	-- Updated from numeric code to string format
	t.version = "11.5"  -- This tells LÖVE which version we're targeting
	
	-- Additional modern settings
	t.console = false
	t.window.resizable = false
	t.window.minwidth = 800
	t.window.minheight = 600
end

