function drawBoard()
	for k, v in ipairs(board.tiles) do
		local mx, my = getRelativeMousePos()
		local mq, mr, ms = xytoqrs(mx, my)
		local mqr, mrr, msr = closestHexToQRS(mq,mr,ms)
		local q, r, s = v[1],v[2],v[3]
		local x, y = qrstoxy(q,r,s)
		x, y = board.zoom * (x + board.offX) + love.graphics.getWidth()/2, board.zoom * (y + board.offY) + love.graphics.getHeight()/2
		local size = board.zoom
		local bcol = {0.3,0.3,0.3}
		if math.abs(mqr-q)+math.abs(mrr-r)+math.abs(msr-s)<0.01 then bcol = {0.3,0.3,1} end
		drawBorderedHexagon(x,y,"fill",2,{0.15,0.15,0.15},bcol,size,0,0)
	end
end