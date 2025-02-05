function loadmousedragging()
	local mouseX, mouseY = 0,0
	local lastMouseX, lastMouseY = 0,0
	local lastOffX, lastOffY = board.offX, board.offY
end

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