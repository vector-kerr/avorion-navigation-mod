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

## Installation
Copy the files from `src/scripts` here to the corresponding folders in `Avorion/data/scripts` in your Avorion installation path.

No existing files are overwritten so you should not experience any conflicts.


## Setup
Once you have installed the files, you will also need to add permissions to execute the `/navigate` command.
This is done on a per-galaxy basis. To make this change (probably while your galaxy isn't running):

1. Find the save folder for your galaxy (e.g., on Windows, %appdata%/Avorion/galaxies/<your_galaxy_name)
2. Make a backup copy of `admin.xml`, just in case :)
3. Edit the `admin.xml` file with a plain text editor such as [Notepad++](https://notepad-plus-plus.org/)
4. Under the `/Administration/administration/defaultAuthorizationGroup/commands` element, add the following new command: `<command name="navigate" />`
5. Save and exit


## Usage
Invoke `/navigate` in the chat window to set your Faction's waypoint to your current sector.

Invoke `/navigate x:y` in the chat window to set your Faction's waypoint to the sector at `x:y`.

Invoke `/navigate x:y factionIndex` in the admin chat window to set the Faction waypoint for `factionIndex` to the sector at `x:y`.
