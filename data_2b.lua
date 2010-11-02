-------------------------------------------------------------------------
-- data_2b.lua
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

name="Lesson 2-B"
-- [r u v p .]

target_wpm = 15
actual_wpm = 0
nonsense_len = 2

nonsense = {}
nonsense.size = 24
nonsense.words_per_index = 1
nonsense[1] = "frf"
nonsense[2] = "hrf"
nonsense[3] = "crf"
nonsense[4] = "lrf"

nonsense[5] = "l.l"
nonsense[6] = "s.l"
nonsense[7] = "t.l"
nonsense[8] = "d.l"

nonsense[9] = "juj"
nonsense[10] = "euj"
nonsense[11] = "guj"
nonsense[12] = "kuj"

nonsense[13] = "fvf"
nonsense[14] = ".vf"
nonsense[15] = "avf"
nonsense[16] = "ivf"

nonsense[17] = ";p;"
nonsense[18] = "gp;"
nonsense[19] = "hp;"
nonsense[20] = "cp;"

nonsense[21] = "rR;"
nonsense[22] = "uUa"
nonsense[23] = "vV;"
nonsense[24] = "pPa"

intro = {}
intro.size = 24
intro[1] = "key:   r\nleft hand\n3rd row\n1st finger"
intro[2] = intro[1]
intro[3] = intro[1]
intro[4] = intro[1]
intro[5] = "key:   .\nright hand\n1st row\n3rd finger"
intro[6] = intro[5]
intro[7] = intro[5]
intro[8] = intro[5]
intro[9] = "key:   u\nright hand\n3rd row\n1st finger"
intro[10] = intro[9]
intro[11] = intro[9]
intro[12] = intro[9]
intro[13] = "key:   v\nleft hand\n1st row\n1st finger"
intro[14] = intro[13]
intro[15] = intro[13]
intro[16] = intro[13]
intro[17] = "key:   p\nright hand\n3rd row\n4th finger"
intro[18] = intro[17]
intro[19] = intro[17]
intro[20] = intro[17]
intro[21] = "key:   shift\n\n1st row\n4th finger"
intro[22] = intro[21]
intro[23] = intro[21]
intro[24] = intro[21]


letter = {}
letter.size = 20
letter[1] = "a"
letter[2] = "s"
letter[3] = "d"
letter[4] = "f"
letter[5] = "j"
letter[6] = "k"
letter[7] = "l"
letter[8] = ";"
letter[9] = "e"
letter[10] = "n"
letter[11] = "g"
letter[12] = "o"
letter[13] = "t"
letter[14] = "i"
letter[15] = "h"
letter[16] = "c"
-- new letters
letter[17] = "r"
letter[18] = "u"
letter[19] = "v"
letter[20] = "p"
letter[20] = "."
-- again to make them appear more often
letter[21] = "r"
letter[22] = "u"
letter[23] = "v"
letter[24] = "p"
letter[25] = "."

short ={}
short.size = 17
short.words_per_index = 1
short[1] = "us"
short[2] = "air"
short[3] = "her"
short[4] = "run"
short[5] = "out"
short[6] = "cut"
short[7] = "or"
short[8] = "our"
short[9] = "sun"
short[10] = "red"
short[11] = "for"
short[12] = "up"
short[13] = "or"
short[14] = "are"
short[15] = "top"
short[16] = "far"
short[17] = "put"

long ={}
long.size = 29
long.words_per_index = 1
long[1] = "deep"
long[2] = "care"
long[3] = "group"
long[4] = "found"
long[5] = "live"
long[6] = "learn"
long[7] = "issue"
long[8] = "sound"
long[9] = "under"
long[10] = "group"
long[11] = "front"
long[12] = "there"
long[13] = "true"
long[14] = "hear"
long[15] = "five"
long[16] = "great"
long[17] = "such"
long[18] = "paper"
long[19] = "open"
long[20] = "green"
long[21] = "fire"
long[22] = "press"
long[23] = "first"
long[24] = "just"
long[25] = "hard"
long[26] = "gave"
long[27] = "upon"
long[28] = "four"
long[29] = "point"


