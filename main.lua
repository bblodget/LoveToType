

function love.load()
	font = love.graphics.newFont(34) -- font size
	font2 = love.graphics.newFont("Miama/Miama.ttf",24)
	love.graphics.setBackgroundColor(128,128,255) -- light blue
	love.graphics.setColor(0,0,0)  -- black
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


