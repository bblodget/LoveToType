------------------------------------------------------------------------
-- data_2r.lua
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

module(..., package.seeall);

name="Review 2"
-- [t i h c]
-- [r u v p .]

target_wpm = 15
actual_wpm = 0

long ={}
local i = 1
for k,v in ipairs(data_2a.short) do 
	long[i] = v 
	i = i + 1
end
for k,v in ipairs(data_2a.long) do 
	long[i] = v 
	i = i + 1
end
for k,v in ipairs(data_2b.short) do 
	long[i] = v 
	i = i + 1
end
for k,v in ipairs(data_2b.long) do 
	long[i] = v 
	i = i + 1
end
long.size = # long
long.words_per_index = 1

