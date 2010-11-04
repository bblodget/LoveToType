-------------------------------------------------------------------------
-- data_3a.lua
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

name="Lesson 3-A"
-- [q m x b :]

target_wpm = 15
actual_wpm = 0
nonsense_len = 2

nonsense = {}
nonsense.size = 24
nonsense.words_per_index = 1
nonsense[1] = "aqa"
nonsense[2] = "nqa"
nonsense[3] = "dqa"
nonsense[4] = "oqa"

nonsense[5] = "jmj"
nonsense[6] = "tmj"
nonsense[7] = "smj"
nonsense[8] = "gmj"

nonsense[9] = "sxs"
nonsense[10] = "hxs"
nonsense[11] = "rxs"
nonsense[12] = "ixs"

nonsense[13] = ";:a"
nonsense[14] = "t:a"
nonsense[15] = "i:a"
nonsense[16] = "k:a"

nonsense[17] = "fbf"
nonsense[18] = "lbf"
nonsense[19] = "sbf"
nonsense[20] = "mbf"

nonsense[21] = "qQ;"
nonsense[22] = "mMa"
nonsense[23] = "xX;"
nonsense[24] = "bB;"

intro = {}
intro.size = 24
intro[1] = "key:   q\nleft hand\n3rd row\n4th finger"
intro[2] = intro[1]
intro[3] = intro[1]
intro[4] = intro[1]
intro[5] = "key:   m\nright hand\n1st row\n1st finger"
intro[6] = intro[5]
intro[7] = intro[5]
intro[8] = intro[5]
intro[9] = "key:   x\nleft hand\n1st row\n3rd finger"
intro[10] = intro[9]
intro[11] = intro[9]
intro[12] = intro[9]
intro[13] = "key:   :\nright hand\nhome row\n4th finger"
intro[14] = intro[13]
intro[15] = intro[13]
intro[16] = intro[13]
intro[17] = "key:   b\nleft hand\n1st row\n1st finger"
intro[18] = intro[17]
intro[19] = intro[17]
intro[20] = intro[17]
intro[21] = "key:   shift\n\n1st row\n4th finger"
intro[22] = intro[21]
intro[23] = intro[21]
intro[24] = intro[21]

letter = {}
letter.size = 31
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
-- new letters
letter[22] = "q"
letter[23] = "m"
letter[24] = "x"
letter[25] = "b"
letter[26] = ":"
-- again to make them appear more often
letter[27] = "q"
letter[28] = "m"
letter[29] = "x"
letter[30] = "b"
letter[31] = ":"

short ={}
short.size = 21
short.words_per_index = 1
short[1] = "big"
short[2] = "me"
short[3] = "six"
short[4] = "gum"
short[5] = "am"
short[6] = "fix"
short[7] = "am"
short[8] = "man"
short[9] = "bill"
short[10] = "box"
short[11] = "aim"
short[12] = "arm"
short[13] = "bus"
short[14] = "elm"
short[15] = "jam"
short[16] = "mug"
short[17] = "sum"
short[18] = "tux"
short[19] = "vim"
short[20] = "fox"
short[21] = "amp"

long ={}
long.size = 25
long.words_per_index = 1
long[1] = "bike"
long[2] = "quite"
long[3] = "quick"
long[4] = "began"
long[5] = "some"
long[6] = "quill"
long[7] = "small"
long[8] = "basis"
long[9] = "claim"
long[10] = "best"
long[11] = "same"
long[12] = "table"
long[13] = "both"
long[14] = "atom"
long[15] = "axon"
long[16] = "bank"
long[17] = "milk"
long[18] = "mint"
long[19] = "team"
long[20] = "tuba"
long[21] = "alarm"
long[22] = "bagel"
long[23] = "magma"
long[24] = "public"
long[25] = "quark"



