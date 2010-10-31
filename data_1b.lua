-- data_1b.lua
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

module(..., package.seeall);

name="Lesson 1-B"
-- e n g o

target_wpm = 15
actual_wpm = 0
nonsense_len = 2

nonsense = {}
nonsense.size = 24
nonsense.words_per_index = 1
nonsense[1] = "ded"
nonsense[2] = "led"
nonsense[3] = "fed"
nonsense[4] = "jed"
nonsense[5] = "jnj"
nonsense[6] = "snj"
nonsense[7] = "dnj"
nonsense[8] = "knj"
nonsense[9] = "fgf"
nonsense[10] = "jgf"
nonsense[11] = "kgf"
nonsense[12] = "dgf"
nonsense[13] = "lol"
nonsense[14] = "sol"
nonsense[15] = "aol"
nonsense[16] = "kol"
nonsense[17] = "aA;"
nonsense[18] = "fF;"
nonsense[19] = "eE;"
nonsense[20] = "sS;"
nonsense[21] = "gG;"
nonsense[22] = "aA;"
nonsense[23] = "dD;"
nonsense[24] = "fF;"

intro = {}
intro.size = 24
intro[1] = "key:   e\nleft hand\n3rd row\n2nd finger"
intro[2] = intro[1]
intro[3] = intro[1]
intro[4] = intro[1]
intro[5] = "key:   n\nright hand\n1st row\n1st finger"
intro[6] = intro[5]
intro[7] = intro[5]
intro[8] = intro[5]
intro[9] = "key:   g\nleft hand\nHome row\n1st finger"
intro[10] = intro[9]
intro[11] = intro[9]
intro[12] = intro[9]
intro[13] = "key:   o\nright hand\n3rd row\n3rd finger"
intro[14] = intro[13]
intro[15] = intro[13]
intro[16] = intro[13]
intro[17] = "key:   shift\nright hand\n1st row\n4th finger"
intro[18] = intro[17]
intro[19] = intro[17]
intro[20] = intro[17]
intro[21] = intro[17]
intro[22] = intro[17]
intro[23] = intro[17]
intro[24] = intro[17]

letter = {}
letter.size = 16
letter[1] = "a"
letter[2] = "s"
letter[3] = "d"
letter[4] = "f"
letter[5] = "j"
letter[6] = "k"
letter[7] = "l"
letter[8] = ";"
-- new letters
letter[9] = "e"
letter[10] = "n"
letter[11] = "g"
letter[12] = "o"
-- again to make them appear more often
letter[13] = "e"
letter[14] = "n"
letter[15] = "g"
letter[16] = "o"


short ={}
short.size = 13
short.words_per_index = 1
short[1] = "so"
short[2] = "do"
short[3] = "dog"
short[4] = "ago"
short[5] = "of"
short[6] = "sea"
short[7] = "no"
short[8] = "an"
short[9] = "old"
short[10] = "on"
short[11] = "go"
short[12] = "see"
short[13] = "end"

long ={}
long.size = 12
long.words_per_index = 1
long[1] = "feel"
long[2] = "done"
long[3] = "less"
long[4] = "Jones"
long[5] = "land"
long[6] = "soon"
long[7] = "glad"
long[8] = "food"
long[9] = "good"
long[10] = "send"
long[11] = "does"
long[12] = "long"






