include config.mk

.PHONY: clean install uninstall patch patch/script/script_flow_data_all patch/script/discern SUBALL submake.mk ALLSUBMAKE

patch: patch/script/script_entry_list.bin patch/script/script_flow_data_all ALLSUBMAKE

ALLSUBMAKE: submake.mk
	${MAKE} -f submake.mk

submake.mk: generate_sub_makefile.py
	python3 generate_sub_makefile.py

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


uninstall:
	rm -rv ~/.local/share/citra-emu/load/mods/0004000000174600/romfs

install: patch
	mkdir -p ~/.local/share/citra-emu/load/mods/0004000000174600/romfs
	cp -rv patch/* ~/.local/share/citra-emu/load/mods/0004000000174600/romfs

clean:
	rm -rfv patch/
	rm -fv submake.mk
