-----------------------
-- Original source from Love 0.6.2 Demos
-- NO: A game of numbers
-- Created: 23.08.08 by Michael Enger
-- Version: 0.2
-- Website: http://www.facemeandscream.com
-- Licence: ZLIB
-----------------------
-- For use in Love To Type
-- Modified: 10/17/2010 by Brandon Blodget
-- Modified: 7/13/2011 by Brandon Blodget
-- Copyright 2010, 2011 Brandon Blodget
-- License: GPL v3 or later
-----------------------
-- Handles buttons and such.
-----------------------

Button = {}
Button.__index = Button

function Button.createImageButton(image,x,y,enable)
	
	local temp = {}
	setmetatable(temp, Button)
	temp.btype = "image"
	temp.hover = false -- whether the mouse is hovering over the button
	temp.click = false -- whether the mouse has been clicked on the button
	temp.image = image -- the image in the button
	temp.width = image:getWidth()
	temp.height = image:getHeight()
	temp.x = x - (temp.width / 2)
	temp.y = y - (temp.height / 2)
	if (enable == nil) then
		temp.enable = true	-- enabled if not specified
	else
		temp.enable = enable
	end
	return temp
	
end

function Button.createTextButton(text,x,y,enable)
	
	local temp = {}
	setmetatable(temp, Button)
	temp.btype = "text"
	temp.hover = false -- whether the mouse is hovering over the button
	temp.click = false -- whether the mouse has been clicked on the button
	temp.text = text -- the text in the button
	temp.width = font["large"]:getWidth(text)
	temp.height = font["large"]:getHeight()
	temp.x = x - (temp.width / 2)
	temp.y = y
	if (enable == nil) then
		temp.enable = true	-- enabled if not specified
	else
		temp.enable = enable
	end
	return temp
	
end

function Button:draw()
	
	if (self.btype =="text") then
		love.graphics.setFont(font["large"])
		if (self.hover and self.enable) then 
			love.graphics.setColor(unpack(color.bright_blue))
		else 
			love.graphics.setColor(unpack(color.black)) 
		end
		love.graphics.print(self.text, self.x, self.y - self.height)
	elseif (self.btype == "image") then
		love.graphics.setColor(unpack(color.overlay))  
		love.graphics.draw(self.image, self.x, self.y)
	end
	
end

function Button:update(dt)
	
	self.hover = false
	
	local x = love.mouse.getX()
	local y = love.mouse.getY()
	
	if x > self.x
		and x < self.x + self.width
		and y > self.y - self.height
		and y < self.y then
		self.hover = true
	end
	
end

function Button:mousepressed(x, y, button)
	
	if self.hover then
		if (audio and self.enable) then
			love.audio.stop()
			love.audio.play(sound["beep"])
		end
		return true
	end
	
	return false
	
end


