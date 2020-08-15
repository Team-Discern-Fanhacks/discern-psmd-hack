# list of tool for 3ds games
(note: I (marius851000) only tested those tools on PSMD, but GTI should work. If it doesn't, you can contact me, and I may try to make them work on them).
(also, I haven't tested them all)
(and a lot of tools are probably missing too. If you have a file format not referenced here, don't assume nobody worked on it).

## all in one
### sky editor
[sky editor](https://projectpokemon.org/tutorials/rom/editing-roms-with-sky-editor/).
Allow editing of:
- starters
- portrait (PSMD only)
- model (PSMD only)
- script
take care, however. It use the WPF, so it doesn't work on linux.
## specific tools
those tool are for editing a particular file. Those may be harder to use, but some of those tool may not be embedded in sky editor (or, if for any reason, you decide to not use it).
### unluac
[unluac](https://sourceforge.net/projects/unluac/) allow you to extract the script from "compiled" script of PSMD/GTI.
### plbEdit
[plbEdit](https://github.com/EddyK28/plbEdit) allow to edit `PLB` files, containing the initial data of cutscene (initialisation of those, like the camera, the map, who can be in this cutscene without special lua tricks).
### script_entry_list_tool
[script_entry_list_tool](https://github.com/marius851000/script_entry_list_tool) allow to edit the script_entry_list.bin, listing all cutscene in the game.
### flowtool
[flowtool](https://github.com/marius851000/flowtool) allow to edit flow file, that list the order of cinematic, and their link to freemove and dungeon.
### ffmpeg
ffmpeg and ffplay are two software that can play the `.bcstm` sound file
## additional note for other file format
- `fixed_pokemon.bin` have [existing documentation](https://projectpokemon.org/docs/mystery-dungeon-3ds/fixed_pokemonbin-r18/)
- `message.bin` also have a [program to read it](https://gist.github.com/mid-kid/8279635ee8dc57560e96) (untested)
- `pokemon_motion_database.bin` store some file name, that can be used with farc. See the sky editor code for more info on this file
- `SIR0` is a format shared throught many file. It store a list of position in the file. this format is reversed.
- `FARC` store a list of file, with their hash. It is often possible to extrapolate the name. An implementation of those file finder can be found in the sky editor code.
- `IMG` file: they have no header, but are a relatively simple format. An implementation is avalaible in the skyeditor source code.
- `BCH` store 3d model. They can be edited with the software SPICA or Ohana.
- `BCLS` store collision data for the cutscene.

some additional tools are also avalaible for some content of the script folder.
