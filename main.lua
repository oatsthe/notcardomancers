require "code/hexutils"
require "code/renderer/shapes"
require "code/renderer/board"
require "code/mouse"

function defineVars()
board = {
offX = 0,
offY = 0,
zoom = 40,
tiles = {{0,0,0},{1,-1,0},{1,0,-1},{0,1,-1},{0,-1,1},{-1,1,0},{-1,0,1}
,{2,-2,0},{0,2,-2},{2,0,-2},{-2,0,2},{-2,2,0},{0,-2,2},{2,-1,-1},{-2,1,1},{1,-2,1},{-1,2,-1},{-1,-1,2},{1,1,-2}
,{3,-2,-1},{-3,2,1},{3,-1,-2},{-3,1,2},{2,-3,1},{-2,3,-1},{1,-3,2},{-1,3,-2},{-1,-2,3},{1,2,-3},{-2,-1,3},{2,1,-3},{3,-3,0},{-3,3,0},{0,3,-3},{0,-3,3},{3,0,-3},{-3,0,3}}
}
globalTimer = 0
end



function love.load()
	defineVars()
    love.window.setMode(960,540)
end

function love.update(dt)
	fps = 1/dt
	globalTimer = globalTimer + dt
	handleMouseInput()
end

function love.draw()
	drawBoard()
	love.graphics.setColor(1,1,1)
	love.graphics.print(fps)
end

function love.wheelmoved(x, y)
    board.zoom = board.zoom * (1 + 0.1*y)
end
