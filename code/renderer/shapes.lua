function drawHexagon(cx,cy,mode,color,width,height,rotation)
	
	height = height or 0
	rotation = -rotation or 0 
	
	if width==0 and height==0 then print("both cant be 0 lmao") return end
	
	local sqrt3 = math.sqrt(3) 
	local s2o3 = 2/sqrt3
	
	if width==0 then 
		width=height*sqrt3/2
	end
	if height==0 then 
		height=width*s2o3
	end
	
	local vertices = {}
	local piover3 = math.pi/3
	
	if rotation%piover3==0 then
		local heightover2 = height/2
		vertices = {
		cx, cy+height,
		cx+width, cy+heightover2,
		cx+width, cy-heightover2,
		cx, cy-height,
		cx-width, cy-heightover2,
		cx-width, cy+heightover2
		}
	elseif rotation%piover3==piover3/2 then
		local heightover2 = height/2
		vertices = {
		cx+height, cy,
		cx+heightover2, cy+width,
		cx-heightover2, cy+width,
		cx-height, cy,
		cx-heightover2, cy-width,
		cx+heightover2, cy-width
		}
	else
		vertices = {
		cx+width*s2o3*math.sin(rotation), cy+height*math.cos(rotation),
		cx+width*s2o3*math.sin(rotation+piover3), cy+height*math.cos(rotation+piover3),
		cx+width*s2o3*math.sin(rotation+2*piover3), cy+height*math.cos(rotation+2*piover3),
		cx+width*s2o3*math.sin(rotation+3*piover3), cy+height*math.cos(rotation+3*piover3),
		cx+width*s2o3*math.sin(rotation+4*piover3), cy+height*math.cos(rotation+4*piover3),
		cx+width*s2o3*math.sin(rotation+5*piover3), cy+height*math.cos(rotation+5*piover3)
		}
	end
	
	love.graphics.setColor(color)
	love.graphics.polygon(mode, vertices)
end

function drawBorderedHexagon(cx,cy,mode,border,color,bordercolor,width,height,rotation)
	
	if not width==0 and width-border<=0 then print("border too big :( [width]") end
	if not height==0 and height-border<=0 then print("border too big :( [height]") end
	
	if width==0 and height==0 then print("both cant be 0 lmao") return end
		drawHexagon(cx,cy,mode,color,width,height,rotation)
		drawHexagon(cx,cy,mode,color,width,height,rotation)
	if width==0 then
		drawHexagon(cx,cy,mode,bordercolor,0,height,rotation)
		drawHexagon(cx,cy,mode,color,0,height-border,rotation)
	elseif height==0 then
		drawHexagon(cx,cy,mode,bordercolor,width,0,rotation)
		drawHexagon(cx,cy,mode,color,width-border,0,rotation)
	else
		drawHexagon(cx,cy,mode,bordercolor,width-border,height-border,rotation)
		drawHexagon(cx,cy,mode,color,width-border,height-border,rotation)
	end
end