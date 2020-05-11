# overview

before everything else:
- PSMD: Pokemon Super Mystery Dungeon
- GTI: pokemon mystery dungeon: Gates To Infinite

The psmd-discern-hack repository contain the code of a PSMD hack (that I will just call discern)

This book will show you how to develop the hack with the tool I (marius851000) made, which are integred into this repository (but may also be a good reading if you to gain knowledge in PSMD or GTI rom-hacking)

First, there are 4 different type of file used by this hack:
- LUA file, that contain the code of the cinematic by itself
- PLB file, that contain additional metadata on the cinematic, most importantly, initial position of character/item, and camera info (where probably meant to be used with a proprioritary graphical tool).
- script_entry_list, that list all the cinematic that exist, and link some content.
- script_flow_data, that indicate the order of cinematic that will happen in-game. This also include FreeMove, Dungeon and more content, but may need more research to modify those, as they probably depend on other files.

This guide has two part for those files:
- [script](./script/general.md), about the plb and lua files
- [order](./order/general.md), about the script_entry_list and script_flow_data files

The game use compiled plb, script_entry_list and script_flow_data file, but those files are in a human-readable format here, that will be transformed to file readable by the game. It also do some transformation in the LUA file.

You can find more on how to use it in the [compilation](./compilation.md) part.
