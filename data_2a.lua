-------------------------------------------------------------------------
-- data_2a.lua
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

name="Lesson 2-A"
-- [t i h c]

target_wpm = 15
actual_wpm = 0
nonsense_len = 2

nonsense = {}
nonsense.size = 24
nonsense.words_per_index = 1
nonsense[1] = "ftf"
nonsense[2] = "ntf"
nonsense[3] = "stf"
nonsense[4] = "otf"

nonsense[5] = "kik"
nonsense[6] = "aik"
nonsense[7] = "gik"
nonsense[8] = "lik"

nonsense[9] = "jhj"
nonsense[10] = "dhj"
nonsense[11] = "khj"
nonsense[12] = "ehj"

nonsense[13] = "dcd"
nonsense[14] = "lcd"
nonsense[15] = "fcd"
nonsense[16] = "acd"

nonsense[17] = "jJa"
nonsense[18] = "iIa"
nonsense[19] = "kKa"
nonsense[20] = "nNa"
nonsense[21] = "lLa"
nonsense[22] = "oOa"
nonsense[23] = "hHa"
nonsense[24] = "jJa"

intro = {}
intro.size = 24
intro[1] = "key:   t\nleft hand\n3rd row\n1st finger"
intro[2] = intro[1]
intro[3] = intro[1]
intro[4] = intro[1]
intro[5] = "key:   i\nright hand\n3rd row\n2nd finger"
intro[6] = intro[5]
intro[7] = intro[5]
intro[8] = intro[5]
intro[9] = "key:   h\nright hand\nHome row\n1st finger"
intro[10] = intro[9]
intro[11] = intro[9]
intro[12] = intro[9]
intro[13] = "key:   c\nleft hand\n1st row\n2nd finger"
intro[14] = intro[13]
intro[15] = intro[13]
intro[16] = intro[13]
intro[17] = "key:   shift\nleft hand\n1st row\n4th finger"
intro[18] = intro[17]
intro[19] = intro[17]
intro[20] = intro[17]
intro[21] = intro[17]
intro[22] = intro[17]
intro[23] = intro[17]
intro[24] = intro[17]


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
-- new letters
letter[13] = "t"
letter[14] = "i"
letter[15] = "h"
letter[16] = "c"
-- again to make them appear more often
letter[17] = "t"
letter[18] = "i"
letter[19] = "h"
letter[20] = "c"

short ={}
short.size = 17
short.words_per_index = 1
short[1] = "if"
short[2] = "set"
short[3] = "has"
short[4] = "in"
short[5] = "got"
short[6] = "it"
short[7] = "can"
short[8] = "at"
short[9] = "did"
short[10] = "she"
short[11] = "too"
short[12] = "is"
short[13] = "to"
short[14] = "he"
short[15] = "let"
short[16] = "the"
short[17] = "eat"

long ={}
long.size = 25
long.words_per_index = 1
long[1] = "this"
long[2] = "then"
long[3] = "idea"
long[4] = "most"
long[5] = "note"
long[6] = "head"
long[7] = "face"
long[8] = "again"
long[9] = "these"
long[10] = "tell"
long[11] = "held"
long[12] = "life"
long[13] = "still"
long[14] = "took"
long[15] = "each"
long[16] = "shift"
long[17] = "kind"
long[18] = "might"
long[19] = "tone"
long[20] = "find"
long[21] = "total"
long[22] = "list"
long[23] = "thank"
long[24] = "that"
long[25] = "once"



