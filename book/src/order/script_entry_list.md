# script_entry_list

`script_entry_list` is the file that list all the cutscene in the game. In the discern hack you can edit the `json` representation of `script_entry_list.bin`. It will be compiled into this file at compilation.

## editing `script_entry_list.json`

This file is a json `file`. It have a list of cutscene. A cutscene entry contain:

## adding a new sequence
I recommend you to copy the original game sequence in the `script_entry_list.json` file, and copy them after all other custom cutscene (or in between, if appropriate). I recommend you keep the flags and the map the same, but you need to change 3 entry:
- `entity_name`: replace the original cutscene name by the cutscene id
- `lua_path`: replace the original lua path by the path of the cutscene in the `discern` folder (including `discern/`)
- `plb_path`: the cutscene id, followed by `.plb`

Here is an example section:
```json
{
	"entity_name": "discern_c01_s01_01",
	"map_name": "hanyou_tsuginoasa01",
	"lua_path": "discern/chapter01/scene01/talk.lua",
	"plb_path": "discern_c01_s01_01.plb",
	"flags": [
		0,
		1,
		1,
		0
	]
}
```

The game need more research about the flags and map_name section, trought.

For this to have any effect, you also need to edit the `script_flow_data.json` file. The procedure is describded in [its page](./script_flow_data.md).
