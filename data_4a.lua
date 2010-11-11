-------------------------------------------------------------------------
-- data_4a.lua
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
-------------------------------------------------------------------------

module(..., package.seeall);

name="Lesson 4-A"
-- [/ ? ' "]

target_wpm = 7
actual_wpm = 0
nonsense_len = 2

nonsense = {}
nonsense.size = 16
nonsense.words_per_index = 1
nonsense[1] = "k/k"
nonsense[2] = "s/k"
nonsense[3] = "r/k"
nonsense[4] = "d/k"

nonsense[5] = "k?k"
nonsense[6] = "s?k"
nonsense[7] = "t?k"
nonsense[8] = "a?k"

nonsense[9] = "l'l"
nonsense[10] = "q'l"
nonsense[11] = "k'l"
nonsense[12] = "x'l"

nonsense[13] = "l\"l"
nonsense[14] = "r\"l"
nonsense[15] = "h\"l"
nonsense[16] = "c\"l"

intro = {}
intro.size = 16
intro[1] = "key:   /\nright hand\n1st row\n4th finger"
intro[2] = intro[1]
intro[3] = intro[1]
intro[4] = intro[1]
intro[5] = "key:   ?\nright hand\n1st row\n4th finger"
intro[6] = intro[5]
intro[7] = intro[5]
intro[8] = intro[5]
intro[9] = "key:   '\nright hand\nhome row\n4th finger"
intro[10] = intro[9]
intro[11] = intro[9]
intro[12] = intro[9]
intro[13] = "key:   \"\nright hand\nhome row\n4th finger"
intro[14] = intro[13]
intro[15] = intro[13]
intro[16] = intro[13]

letter = {}
letter.size = 19
letter[1] = "d"
letter[2] = "l"
letter[3] = "e"
letter[4] = "g"
letter[5] = "t"
letter[6] = "h"
letter[7] = "r"
letter[8] = "v"
letter[9] = "."
letter[10] = "m"
letter[11] = "b"
-- new letters
letter[12] = "/"
letter[13] = "?"
letter[14] = "'"
letter[15] = "\""
-- again to make them appear more often
letter[16] = "/"
letter[17] = "?"
letter[18] = "'"
letter[19] = "\""

short ={}
short.size = 21
short.words_per_index = 1
short[1] = "far?"
short[2] = "cut?"
short[3] = "are'"
short[4] = "far'"
short[5] = "us\""
short[6] = "out\""
short[7] = "air?"
short[8] = "for?"
short[9] = "her'"
short[10] = "up'"
short[11] = "are\""
short[12] = "put\""
short[13] = "run?"
short[14] = "her?"
short[15] = "red'"
short[16] = "/bin"
short[17] = "/usr"
short[18] = "'hi'"
short[19] = "\"hi\""
short[20] = "/var"
short[21] = "/etc"

long ={}
long.size = 31
long.words_per_index = 1
long[1] = "turn?"
long[2] = "later?"
long[3] = "offer'"
long[4] = "point'"
long[5] = "place\""
long[6] = "price\""
long[7] = "given?"
long[8] = "house?"
long[9] = "right'"
long[10] = "green'"
long[11] = "have\""
long[12] = "short\""
long[13] = "paid?"
long[14] = "under?"
long[15] = "paper'"
long[16] = "card'"
long[17] = "even\""
long[18] = "until\""
long[19] = "press?"
long[20] = "ship?"
long[21] = "ever'"
long[22] = "start'"
long[23] = "http://"
long[24] = "\"hello\""
long[25] = "'hello'"
long[26] = "/home"
long[27] = "/boot"
long[28] = "/a/b"
long[29] = ".org/"
long[30] = ".com/"
long[31] = ".edu/"



