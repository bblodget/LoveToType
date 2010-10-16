-- results.lua

module(..., package.seeall);

require "do_lesson"


local name_ = ""
local isEnd_ = false
local actual_wpm_ = ""
local target_wpm_ = ""
local isGood_ = false
local message_ = ""

local good_ = {
	"Way to go!",
	"Looking good!",
	"Good work!",
	"Good for you!"
}

local bad_ = {
	"Type a little faster.",
	"More practice is needed."
}

-- name: The name of lesson e.g. "Lesson 1-A"
-- isEnd: boolean.  True=end of lesson
-- actual_wpm:  The word per minute of previous exercies
-- target_wpm.  The target word per minue
function load(name,isEnd,actual_wpm,target_wpm)
	name_ = "End of\n" .. name
	isEnd_ = isEnd

	if (actual_wpm >= target_wpm) then
		isGood_ = true
		message_ = good_[math.random(# good_)]
	else
		isGood_ = false
		message_ = bad_[math.random(# bad_)]
	end

	actual_wpm_ = "Actual\nWPM\n"..actual_wpm
	target_wpm_ = "Target\nWPM\n"..target_wpm


	love.graphics.setBackgroundColor(128,128,255) -- light blue
	love.draw = draw
	love.keypressed = keypressed
end

function draw()
	love.graphics.setFont(bigfont)

	if (isEnd_) then
		love.graphics.printf(name_, 50, 50 ,750, 'left') 
	end

	love.graphics.printf(actual_wpm_, 400, 50 ,600, 'left') 
	love.graphics.printf(target_wpm_, 620, 50 ,800, 'left') 

	love.graphics.printf(message_,50,300,750,'center')

	if (not isEnd_)then
		love.graphics.printf("Now, try some more.",0,400,800, 'center')
	end


	love.graphics.printf("Press any key to continue",0,500,800, 'center')
end

function keypressed(key, unicode)
	do_lesson.load()
end


