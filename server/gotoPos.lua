function gotoPos(args)
    if string.find(args.text, "/gotopos") then
		local message = "Teleport to coords. Must be in x,y,z format, where y is the altitude. Press F5 and see help for more details. Usage Example: /gotopos -11949,240,5912"
		local color = Color(0, 255, 0)
		if args.text == "/gotopos" then
			Chat:Send(args.player, message, color)
			
			return false
		end
		local coordString = string.gsub(args.text, "/gotopos ", "")
		if string.len(coordString) < 3 then
			Chat:Send(args.player, message, color)
			
			return false
		else
			local coordTable = coordString:split(",")
			local xCoord = tonumber(coordTable[1])
			local yCoord = tonumber(coordTable[2])
			local zCoord = tonumber(coordTable[3])
			if (xCoord > 16000 or xCoord < -16000) then
				Chat:Send(args.player, "x coordinate is out of range (-16000 to 16000)", color)
				
				return false
			elseif (yCoord > 4000 or yCoord < 0) then
				Chat:Send(args.player, "y coordinate is out of range (0 to 4000)", color)
				
				return false
			elseif (zCoord > 16000 or zCoord < -16000) then
				Chat:Send(args.player, "z coordinate is out of range (-16000 to 16000)", color)
				
				return false
			end
			local myName = args.player:GetName()
			local newPos = Vector3(xCoord, yCoord, zCoord)
			local successMsg = myName .. " teleported to coords " .. tostring(newPos)
			args.player:SetPosition(newPos)
			Chat:Broadcast(successMsg,color)
			
			return false
		end
    end
 
    return true
end

Events:Subscribe("PlayerChat", gotoPos)