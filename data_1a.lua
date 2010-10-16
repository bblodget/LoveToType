-- data_1a.lua

module(..., package.seeall);

name="Lesson 1-A"

target_wpm = 15
actual_wpm = 0
nonsense_rep = 1

nonsense = {}
nonsense.size = 8
nonsense.words_per_index = 2
nonsense[1] = "aaa jjj"
nonsense[2] = "sss kkk"
nonsense[3] = "ddd lll"
nonsense[4] = "fff ;;;"
nonsense[5] = "kkk sss"
nonsense[6] = ";;; fff"
nonsense[7] = "jjj aaa"
nonsense[8] = "lll ddd"

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
short.size = 13
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

long ={}
long.size = 13
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
long[10] = "lads"
long[11] = "jakl"
long[12] = "falls"
long[13] = "alas"

-- The Flow
-- nonsense x1 (first time x2 2nd time) (intro text)
-- letter
-- nonsense x1 (first time x2 2nd time) (no intro text)
-- letter
-- short x2 x8 (timed)
-- actual wpm / target wpm 15
-- long x4 x4 (timed)
-- actual wpm / target wpm 15 (repeat or continue)





