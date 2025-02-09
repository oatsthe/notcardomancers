function handleMouseInput()
	local mouseX, mouseY = love.mouse.getPosition()
	if not love.mouse.isDown(3) then
		lastMouseX, lastMouseY = love.mouse.getPosition()
		lastOffX, lastOffY = board.offX, board.offY
	else
		board.offX = lastOffX + (mouseX - lastMouseX) / board.zoom
		board.offY = lastOffY + (mouseY - lastMouseY) / board.zoom
	end
end

function getRelativeMousePos()
	local mouseX, mouseY = love.mouse.getPosition()
	mouseX, mouseY = (mouseX-love.graphics.getWidth()/2)/board.zoom - board.offX , (mouseY-love.graphics.getHeight()/2)/board.zoom - board.offY
	return mouseX, mouseY
end	