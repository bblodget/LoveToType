

function love.load()
	font = love.graphics.newFont(34) -- font size
	font2 = love.graphics.newFont("Miama/Miama.ttf",24)
	love.graphics.setBackgroundColor(128,128,255) -- light blue
	love.graphics.setColor(0,0,0)  -- black
    love.graphics.setCaption("Touch Typing Tutor")
	
	changed = false
	full_screen = false
end

function love.draw()
	love.graphics.setFont(font)

	love.graphics.printf("Touch Typing Tutor",0,120,800, 'center')
	love.graphics.printf("1. Lessons\n" .. 
						 "2. Diagnostic\n" ..
						 "3. Game\n", 
				280,220,800, 'left')

	love.graphics.printf("Your Choice? ",400,400,800, 'left')
end


function love.keypressed(key, unicode)
	if key == "escape" then
		if (not full_screen) then
			-- change to full screen
			changed = love.graphics.toggleFullscreen()
			if (changed) then
				full_screen = true
			end
		else
			-- change to window mode
			changed = love.graphics.setMode(800,600,false,true)
			if (changed) then
				full_screen = false
			end
		end
	end

	if key == "q" then
	end

end


