include config.mk

.PHONY: clean install uninstall patch patch/script/script_flow_data_all patch/script/discern SUBALL submake.mk ALLSUBMAKE

patch: patch/script/script_entry_list.bin patch/script/script_flow_data_all ALLSUBMAKE

ALLSUBMAKE: submake.mk
	${MAKE} -f submake.mk

submake.mk: generate_sub_makefile.py
	${PYTHON3} generate_sub_makefile.py


patch.zip: patch
	$(ZIP) -r patch.zip patch

patch/script/script_entry_list.bin: script_entry_list.json
	${MKDIR} -p patch/script
	$(SCRIPT_ENTRY_LIST_TOOL) --input script_entry_list.json --output patch/script/script_entry_list.bin fromjson


patch/script/script_flow_data_all: patch/script/script_flow_data_us.bin patch/script/script_flow_data_fr.bin patch/script/script_flow_data_ge.bin patch/script/script_flow_data_it.bin patch/script/script_flow_data_sp.bin patch/script/script_flow_data.bin

patch/script/script_flow_data.bin: script_flow_data.json
	${MKDIR} -p patch/script
	${FLOWTOOL} --input script_flow_data.json --output patch/script/script_flow_data.bin fromjson

patch/script/script_flow_data_us.bin: patch/script/script_flow_data.bin
	$(CP) patch/script/script_flow_data.bin patch/script/script_flow_data_us.bin

patch/script/script_flow_data_fr.bin: patch/script/script_flow_data.bin
	$(CP) patch/script/script_flow_data.bin patch/script/script_flow_data_fr.bin

patch/script/script_flow_data_ge.bin: patch/script/script_flow_data.bin
	$(CP) patch/script/script_flow_data.bin patch/script/script_flow_data_ge.bin

patch/script/script_flow_data_sp.bin: patch/script/script_flow_data.bin
	$(CP) patch/script/script_flow_data.bin patch/script/script_flow_data_sp.bin

patch/script/script_flow_data_it.bin: patch/script/script_flow_data.bin
	$(CP) patch/script/script_flow_data.bin patch/script/script_flow_data_it.bin


uninstall:
	$(RM) -rv $(INSTALLDIR)

install: patch
	${MKDIR} -p $(INSTALLDIR)
	${CP} -r patch/* $(INSTALLDIR)

clean:
	$(RMRECUR) patch
	$(RM) submake.mk
	$(RM) patch.zip
	$(RMRECUR) make_tmp
