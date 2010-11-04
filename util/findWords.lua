-------------------------------------------------------------------------
-- util/findWords.lua
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
--
-------------------------------------------------------------------------
--
-- Description
--
-- This file is a standalone utility shell script for making
-- word list for the "Love To Type" program.  It find words
-- in a dictionary that match a given list of constraints.
--
-- usage: lua findWords.lua <level> <word_length>
-- 			<level> = 1a, 1b, 2a, 2b etc
--			<word_length> = number of characters in words returned
-------------------------------------------------------------------------

local dictionary = "/usr/share/dict/words"

local home_row = "asdfjkl;"

local need_all = {
	["1a"] = "asdfjkl;",
	["1b"] = "asdfjkl;engo",
	["2a"] = "asdfjkl;engotihc",
	["2b"] = "asdfjkl;engotihcruvp.",
	["3a"] = "asdfjkl;engotihcruvp.qmxb:"
}

local need_one = {
	["1a"] = "asdfjkl;",
	["1b"] = "engo",
	["2a"] = "tihc",
	["2b"] = "ruvp.",
	["3a"] = "qmxb:"
}

local word = {}
word[1] = {}
word[2] = {} -- two letter words
word[3] = {} -- three letter words
word[4] = {} -- four letter words
word[5] = {} -- five letter words

local count = 0
local good = true

local all_str = need_all[arg[1]]
local one_str = need_one[arg[1]]

local word_size = arg[2]

print("all_str: " .. all_str)
print("one_str: " .. one_str)

for line in io.lines(dictionary) do 

	-- check each char in line to see if in all_str
	good = true
	for i=1,# line do
		c = string.sub(line,i,i)
		if (not string.find(all_str,c)) then
			good = false
			break
		end
	end

	-- make sure at least one char is in one_str
	if (good) then
		good = false  -- need to find one char in one_str
		for i=1,# line do
			c = string.sub(line,i,i)
			if (string.find(one_str,c)) then
				good = true
				break
			end
		end
	end

	local word_len = # line
	if (good) then
		if (word_len >= 2 and word_len <=5) then
			table.insert(word[word_len],line)
			count = count + 1
		end
	end
		
end

print("number of lines: " .. count)

print("word2: " .. # word[2])
print("word3: " .. # word[3])
print("word4: " .. # word[4])
print("word5: " .. # word[5])

print("selected word length: " .. word_size)

-- print select words
local size = tonumber(word_size)
for i,w in ipairs(word[size]) do
	print(w)
end



