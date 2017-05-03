  -- TODO: Persist data between save and load of game?
  -- TODO: Add clear navigation command?

if onServer() then
	
printlog("NAV: On Server")

  -- Imports
  package.path = package.path .. ";data/scripts/lib/?.lua"
  require( "stringutility" )
  require( "faction" )


  -- Module Scoped Variables
  local factionNavigationTargets
  
  
  -- Initialization Function: Process the Navigate command
  function initialize( coords, factionIndex, ... )

    -- Initialize Module Variables
    factionNavigationTargets = {}
	
	-- If no faction index is provided then set it based on the calling entity
	if not factionIndex then
		factionIndex = Entity().factionIndex
	end
	
    local faction = Faction( factionIndex )

    -- Set on faction object for retrieval by players who connect later
    faction:setValue( 'navigate_to_x', coords.x )
    faction:setValue( 'navigate_to_y', coords.y )

    -- Update the module's table for persistant storage
    factionNavigationTargets[ factionIndex ] = coords

    -- Propegate navigation command to all online players in the current player's faction
    local players = { Server():getOnlinePlayers() }
    for _, player in ipairs( players ) do
      if player.index == factionIndex then
        player:sendChatMessage( "Server", 0, "Faction navigation target set to (" .. coords.x .. ":" .. coords.y .. ")" )
        invokeClientFunction( player, "showSector", coords.x, coords.y )
      end
    end
	
    -- Finish execution and unload lua module
    terminate()
	
  end


  
-- Instruct the player to navigate to a particular location
function showSector( x, y )
--  GalaxyMap():setSelectedCoordinates( x, y )
--  GalaxyMap():lookAt( x, y )
  GalaxyMap():show( x, y )
end

  
end


