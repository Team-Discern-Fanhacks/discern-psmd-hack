# checklist for new cutscene

- create or edit the `discern/chapterXX/sceneYY/talk.lua`
- extract the original `plb` with `plbEdit /wj sourceFile.plb targetFile.json`, ensuring `targetFile` is `discern/chapterXX/sceneYY/placementZZ.json`
- edit the plb, at least to change the `name` to the cutscene id.
- copy an entry from `script_entry_list.json` (usually the same that you used to pick the `plb`)
- edit the `entity_name`, `lua_path` and `plb_path` entry of this file. ([see the dedicated page for more info](./order/script_entry_list.md))
- edit the `script_flow_data.json` file to add the new cutscene in the story ([see the dedicated page for more](./order/script_flow_data.md))
