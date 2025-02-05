require "code/renderer/shapes"
require "code/renderer/board"
require "code/mousedragging"

function defineVars()
board = {
offX = 0,
offY = 0,
zoom = 1,
tiles = {{0,0,0}}
}
globalTimer = 0
end



function love.load()
	defineVars()
	loadmousedragging()
    love.window.setMode(960,540)
end

function love.update(dt)
	globalTimer = globalTimer + dt
	handleMouseInput()
end

function love.draw()
	drawBoard()
	love.graphics.setColor(1,1,1)
	love.graphics.print(tostring(board.offX).." "..tostring(board.offY))
end

function love.wheelmoved(x, y)
    board.zoom = board.zoom + y / 10
end
