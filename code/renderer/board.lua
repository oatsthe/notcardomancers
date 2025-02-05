function qrstoxy(qn,rn,sn)
	if qn+rn+sn~=0 then print("qrs coords dont add up!") return end
	
	local sqrt3 = math.sqrt(3)
	return qn-sn, qn/sqrt3 + rn*-2/sqrt3 + sn/sqrt3
end

function drawBoard()
	for k, v in ipairs(board.tiles) do
		local q, r, s = v[1],v[2],v[3]
		local x, y = qrstoxy(q,r,s)
		x, y = board.zoom * (40 * x + board.offX) + love.graphics.getWidth()/2, board.zoom * (40 * y + board.offY) + love.graphics.getHeight()/2
		local size = 40 * board.zoom
		drawBorderedHexagon(x,y,"fill",2,{0.15,0.15,0.15},{0.3,0.3,0.3},size,0,0)
	end
end