-------------------------------------------------------------------------
-- data_3b.lua
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

name="Lesson 3-B"
-- [w y z ,]

target_wpm = 15
actual_wpm = 0
nonsense_len = 2

nonsense = {}
nonsense.size = 20
nonsense.words_per_index = 1
nonsense[1] = "sws"
nonsense[2] = "ows"
nonsense[3] = "vws"
nonsense[4] = "nws"

nonsense[5] = "jyj"
nonsense[6] = "oyj"
nonsense[7] = "pyj"
nonsense[8] = "cyj"

nonsense[9] = "aza"
nonsense[10] = "nza"
nonsense[11] = "yza"
nonsense[12] = "vza"

nonsense[13] = "k,k"
nonsense[14] = "w,k"
nonsense[15] = "l,k"
nonsense[16] = "e,k"

nonsense[17] = "wW;"
nonsense[18] = "yYa"
nonsense[19] = "zZ;"
nonsense[20] = "yYa"


intro = {}
intro.size = 20
intro[1] = "key:   w\nleft hand\n3rd row\n3rd finger"
intro[2] = intro[1]
intro[3] = intro[1]
intro[4] = intro[1]
intro[5] = "key:   y\nright hand\n3rd row\n1st finger"
intro[6] = intro[5]
intro[7] = intro[5]
intro[8] = intro[5]
intro[9] = "key:   z\nleft hand\n1st row\n4th finger"
intro[10] = intro[9]
intro[11] = intro[9]
intro[12] = intro[9]
intro[13] = "key:   ,\nright hand\n1st row\n2nd finger"
intro[14] = intro[13]
intro[15] = intro[13]
intro[16] = intro[13]
intro[17] = "key:   shift\n\n1st row\n4th finger"
intro[18] = intro[17]
intro[19] = intro[17]
intro[20] = intro[17]

letter = {}
letter.size = 34
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
letter[17] = "r"
letter[18] = "u"
letter[19] = "v"
letter[20] = "p"
letter[21] = "."
letter[22] = "q"
letter[23] = "m"
letter[24] = "x"
letter[25] = "b"
letter[26] = ":"
-- new letters
letter[27] = "w"
letter[28] = "y"
letter[29] = "z"
letter[30] = ","
-- again to make them appear more often
letter[31] = "w"
letter[32] = "y"
letter[33] = "z"
letter[34] = ","

short ={}
short.size = 21
short.words_per_index = 1
short[1] = "say"
short[2] = "way"
short[3] = "why"
short[4] = "pay"
short[5] = "few"
short[6] = "buy"
short[7] = "boy"
short[8] = "sky"
short[9] = "own"
short[10] = "you"
short[11] = "who"
short[12] = "eye"
short[13] = "zoo"
short[14] = "zap"
short[15] = "zip"
short[16] = "web"
short[17] = "tow"
short[18] = "saw"
short[19] = "yak"
short[20] = "wit"
short[21] = "yes"

long ={}
long.size = 25
long.words_per_index = 1
long[1] = "many"
long[2] = "every"
long[3] = "quiz"
long[4] = "play"
long[5] = "word"
long[6] = "week"
long[7] = "world"
long[8] = "copy"
long[9] = "want"
long[10] = "reply"
long[11] = "yeah"
long[12] = "early"
long[13] = "yearn"
long[14] = "when"
long[15] = "ally"
long[16] = "away"
long[17] = "byte"
long[18] = "buzz"
long[19] = "cozy"
long[20] = "hazy"
long[21] = "twig"
long[22] = "zippy"
long[23] = "snowy"
long[24] = "topaz"
long[25] = "zebra"



