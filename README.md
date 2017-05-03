# avorion-navigation-mod
A mod for the game Avorion to provide Navigation features.

## Status

### Good Things
* Navigate command can be invoked by a player
* A chat message is broadcast to all members of the faction with the target coordinates when the navigate command is invoked

### Not-so-good Things
* Navigate command can be invoked by the server console but **will not** execute server side script
* Galaxy Map implementation is not working (invokeClientFunction isn't working the way I thought it might?)
* Yet to add faction waypoint retention between server save/load
* Yet to add multi-waypoint and/or navigation path feature
* Yet to add in-space-ui marker pointing to target sector

## Usage
Invoke `/navigate` in the chat window to set your Faction's waypoint to your current sector.

Invoke `/navigate x:y` in the chat window to set your Faction's waypoint to the sector at `x:y`.

Invoke `/navigate x:y factionIndex` in the admin chat window to set the Faction waypoint for `factionIndex` to the sector at `x:y`.
