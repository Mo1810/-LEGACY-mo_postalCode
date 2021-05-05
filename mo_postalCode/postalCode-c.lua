--[[--------------------------]]--
--[[  Created by Mo1810#4230  ]]--
--[[--------------------------]]--

RegisterCommand("postcode", function(source, args, raw)
	if args[1] ~= nil then
		local postalCode = args[1]
		setWaypoint(postalCode)
	else
		notify(Config.Prefix.. "Marker ~r~wasn\'t ~s~set. ~r~Error: Unknown target!")
	end
end, false)

function notify(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(true, false)
end

function setWaypoint(postalCode)
	local postalCode_coords = vector2(0,0)
	for i = 1, #Config.postalcodes, 1 do
		if Config.postalcodes[i].code == postalCode then
			postalCode_coords = vector2(Config.postalcodes[i].x, Config.postalcodes[i].y)
		end
	end
	
	if postalCode_coords.x ~= 0.0 and postalCode_coords.y ~= 0.0then
		SetNewWaypoint(postalCode_coords.x, postalCode_coords.y)
		notify(Config.Prefix.. "Marker was set ~g~successfully~s~. ~y~Postcode~s~: ~y~" ..postalCode)
	else
		notify(Config.Prefix.. "Marker ~r~wasn\'t ~s~set. ~r~Error: Unknown target!")
	end
	
end

TriggerEvent('chat:addSuggestion', '/postcode', 'set marker at target position', {
    { name="postal code", help="postal code of target (e.g. 001)" }
})

--[[--------------------------]]--
--[[  Created by Mo1810#4230  ]]--
--[[--------------------------]]--