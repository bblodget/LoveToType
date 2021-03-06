-- data_1a.lua
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

name="Lesson 1-A"
-- home row

target_wpm = 15
actual_wpm = 0
nonsense_len = 2

nonsense = {}
nonsense.size = 16
nonsense.words_per_index = 1
nonsense[1] = "aaa"
nonsense[2] = "jjj"
nonsense[3] = "sss"
nonsense[4] = "kkk"
nonsense[5] = "ddd"
nonsense[6] = "lll"
nonsense[7] = "fff"
nonsense[8] = ";;;"
nonsense[9] = "kkk"
nonsense[10] = "sss"
nonsense[11] = ";;;"
nonsense[12] = "fff"
nonsense[13] = "jjj"
nonsense[14] = "aaa"
nonsense[15] = "lll"
nonsense[16] = "ddd"

intro = {}
intro.size = 8
intro[1] = "key:   home\nHome row"
intro[2] = intro[1]
intro[3] = intro[1]
intro[4] = intro[1]
intro[5] = intro[1]
intro[6] = intro[1]
intro[7] = intro[1]
intro[8] = intro[1]
intro[9] = intro[1]
intro[10] = intro[1]
intro[11] = intro[1]
intro[12] = intro[1]
intro[13] = intro[1]
intro[14] = intro[1]
intro[15] = intro[1]
intro[16] = intro[1]

letter = {}
letter.size = 8
letter[1] = "a"
letter[2] = "s"
letter[3] = "d"
letter[4] = "f"
letter[5] = "j"
letter[6] = "k"
letter[7] = "l"
letter[8] = ";"

short ={}
short.size = 15
short.words_per_index = 1
short[1] = "skd"
short[2] = "add"
short[3] = "all"
short[4] = "as"
short[5] = "kaf"
short[6] = "sad"
short[7] = "fad"
short[8] = "ja;"
short[9] = "ask;"
short[10] = "all;"
short[11] = "jal"
short[12] = "lad"
short[13] = "dad"
short[14] = "ads"
short[15] = "ask"

long ={}
long.size = 19
long.words_per_index = 1
long[1] = "lads"
long[2] = "daks"
long[3] = "lakf"
long[4] = "dlsk"
long[5] = "ajds"
long[6] = "jal;"
long[7] = "salad"
long[8] = "flask"
long[9] = "lass"
long[10] = "jakl"
long[11] = "falls"
long[12] = "alas"
long[13] = "adds"
long[14] = "asks"
long[15] = "dads"
long[16] = "fads"
long[17] = "fall"
long[18] = "flak"
long[19] = "sass"

