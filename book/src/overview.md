# overview

vocabulary:
- PSMD: Pokemon Super Mystery Dungeon
- GTI: pokemon mystery dungeon: Gates To Infinite

The psmd-discern-hack repository contain the code of a PSMD hack (that I will just call the discern hack)

This book will show you how to develop the discern hack with tools I (marius851000) made, which are integrated into this repository (but may also be a good reading if you to gain knowledge in PSMD or GTI rom-hacking)

First, there are 4 different type of file used by this hack as of today:
- `lua` file, contain the code of the cinematic by themselves.
- `plb` file, that contain additional metadata on the cinematic, most importantly, initial position of character/item, and camera info (where probably meant to be used with a proprioritary graphical tool).
- `script_entry_list.bin`, a unique file that list all the cinematic that exist, and link some content (like the `lua` and `plb` files).
- `script_flow_data.bin`, another unique file that contain the order of cinematic that will happen in-game. This also include FreeMove, Dungeon and more content, but may need more research to modify those, as they probably depend on other files.

This guide has two part for those files:
- [script](./script/general.md), about the `plb`s and `lua`s files
- [order](./order/general.md), about the `script_entry_list.bin` and `script_flow_data.bin` files

The game use compiled `plb`s, `script_entry_list.bin` and `script_flow_data.bin` files, but those files are stored in a human-readable format in this repository, that will be transformed to file readable by the game.
While the original game use compiled `lua`s file, it can also read uncompiled ones, and we use this possibility in the discern hack. We still do some processing in the `lua`s files to simplify some task.

You can find more on how to use those in the [compilation](./compilation.md) part.
