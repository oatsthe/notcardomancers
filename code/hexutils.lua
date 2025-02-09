local function round(value)
    return math.floor(value + 0.5)
end

function qrstoxy(qn,rn,sn)
	local sqrt3 = math.sqrt(3)
	return qn-sn, qn/sqrt3 + rn*-2/sqrt3 + sn/sqrt3
end

function xytoqrs(x,y)
	local sqrt3 = math.sqrt(3)
	local qn = sqrt3*(x+y*sqrt3/3)/3*sqrt3/2
	local rn = -2*y/3*sqrt3/2
	local sn = -qn-rn
	if qn+rn+sn~=0 then print("what (non real???)") return end
	return qn, rn, sn
end

function closestHexToQRS(qn,rn,sn)
	local qnr, rnr, snr = round(qn), round(rn), round(sn)
	local h = qnr+rnr+snr
	if h==0 then
		return qnr,rnr,snr
	else
		local vx, vy = qrstoxy(qn,rn,sn)
		local vxr, vyr = qrstoxy(qnr,rnr,snr)
		local sqrt3 = math.sqrt(3)
		local vq = (vxr - h*sqrt3/2 - vx)^2 + (vyr-h*0.5 - vy)^2
		local vr = (vxr - vx)^2 + (vyr+h-vy)^2
		local vs = (vxr + h*sqrt3/2 - vx)^2 + (vyr-h*0.5 - vy)^2
		if vq<=vr and vq<=vs then
			return xytoqrs(vxr - h , vyr-h*0.5*2/sqrt3)
		elseif vr<vq and vr<=vs then
			return xytoqrs(vxr , vyr+h*2/sqrt3)
		elseif vs<vq and vs<vr then
			return xytoqrs(vxr + h , vyr-h*0.5*2/sqrt3)
		else
			print("what the fuck")
		end
	end
end