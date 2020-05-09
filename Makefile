.PHONY: clean install uninstall patch patch/script/script_flow_data_all

patch: patch/script/script_entry_list.bin patch/script/script_flow_data_all patch/script/discern

patch/script/script_entry_list.bin: script_entry_list.json
	mkdir -p patch/script
	script_entry_list_tool --input script_entry_list.json --output patch/script/script_entry_list.bin fromjson


patch/script/script_flow_data_all: patch/script/script_flow_data_us.bin patch/script/script_flow_data_fr.bin patch/script/script_flow_data_ge.bin patch/script/script_flow_data_it.bin patch/script/script_flow_data_sp.bin patch/script/script_flow_data.bin

patch/script/script_flow_data.bin: script_flow_data.json
	mkdir -p patch/script
	flowtool --input script_flow_data.json --output patch/script/script_flow_data.bin fromjson

patch/script/script_flow_data_us.bin: patch/script/script_flow_data.bin
	cp --reflink=auto patch/script/script_flow_data.bin patch/script/script_flow_data_us.bin

patch/script/script_flow_data_fr.bin: patch/script/script_flow_data.bin
	cp --reflink=auto patch/script/script_flow_data.bin patch/script/script_flow_data_fr.bin

patch/script/script_flow_data_ge.bin: patch/script/script_flow_data.bin
	cp --reflink=auto patch/script/script_flow_data.bin patch/script/script_flow_data_ge.bin

patch/script/script_flow_data_sp.bin: patch/script/script_flow_data.bin
	cp --reflink=auto patch/script/script_flow_data.bin patch/script/script_flow_data_sp.bin

patch/script/script_flow_data_it.bin: patch/script/script_flow_data.bin
	cp --reflink=auto patch/script/script_flow_data.bin patch/script/script_flow_data_it.bin


patch/script/discern: patch/script/discern/chapter01/scene01/talk.lua

patch/script/discern/chapter01/scene01/talk.lua: discern/chapter01/scene01/talk.lua
	mkdir -p patch/script/discern/chapter01/scene01/
	cp discern/chapter01/scene01/talk.lua patch/script/discern/chapter01/scene01/talk.lua

uninstall:
	rm -rv ~/.local/share/citra-emu/load/mods/0004000000174600/romfs

install: patch
	mkdir -p ~/.local/share/citra-emu/load/mods/0004000000174600/romfs
	cp -rv patch/* ~/.local/share/citra-emu/load/mods/0004000000174600/romfs

clean:
	rm -rv patch/
