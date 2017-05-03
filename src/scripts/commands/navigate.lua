package.path = package.path .. ";data/scripts/lib/?.lua"

require( "galaxy" )

function execute( sender, commandName, navigateToCoords, factionIndex, ... )

	local player = Player( sender )
	if player then
		
		-- Retrieve current sector coordinates
		local coords

		if navigateToCoords ~= nil then
		  -- If coordinates are provided, then decode and use those instead
		  local x, y = string.match( navigateToCoords, "(-?[%d]+):(-?[%d]+)" )
		  
		  if x ~= nil then
			  x = tonumber( x )
		  end
		  
		  if y ~= nil then
			  y = tonumber( y )
		  end
		  
		  local validX = ( x ~= nil and x >= -499 and x <= 500 )
		  local validY = ( y ~= nil and y >= -499 and y <= 500 )
		  if validX and validY then
		    coords = vec2( x, y )
		  else
		    return 0, "", ""
		  end
		else
		  coords = vec2( Sector():getCoordinates() )
		end
		
		factionIndex = player.index
			
		Server():broadcastChatMessage( "", 0, "Received command to navigate to (" .. coords.x .. ":" .. coords.y .. ")" )
		player:addScriptOnce( "cmd/navigate.lua", coords, factionIndex, ... )
		
	else
		Server():broadcastChatMessage( "", 0, "Received admin command to navigate to (" .. navigateToCoords .. ")" )
		Server():broadcastChatMessage( "", 0, "Note that this is not yet implemented. Must navigate from a Player in game" )
	end
    
	return 0, "", ""
	
end

function getDescription()
    return "Allows a player to set a navigation target for their faction"
end

function getHelp()
  return "Allows a player to set a navigation target for their faction. Usage: /navigate x:y"
end
