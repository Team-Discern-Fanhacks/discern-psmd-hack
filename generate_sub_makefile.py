import os

ROOT_DISCERN_FOLDER = ""
PATCH_FOLDER = os.path.join(ROOT_DISCERN_FOLDER, "patch")
TARGET_FILE = os.path.join(ROOT_DISCERN_FOLDER, "submake.mk")
TMP_FOLDER = os.path.join(ROOT_DISCERN_FOLDER, "make_tmp")
print("starting generation of the sub makefile")

#name: (input, script)
instruction = {
    ".PHONY": (["SCRIPTS", "PLBS", "SUBALL"], ""),
    "ALLSUB": (["SCRIPTS", "PLBS"], ""),
    "SCRIPTS": ([], ""),
    "PLBS": ([], ""),
}

discern_folder = os.path.join(ROOT_DISCERN_FOLDER, "discern")
for chapter_folder_name in os.listdir(discern_folder):
    chapter_folder = os.path.join(discern_folder, chapter_folder_name)
    chapter_id = chapter_folder_name.split("chapter")[1]
    for scene_folder_name in os.listdir(chapter_folder):
        scene_folder = os.path.join(chapter_folder, scene_folder_name)
        scene_id = scene_folder_name.split("scene")[1]

        files = os.listdir(scene_folder)

        if "talk.lua" not in files:
            raise BaseException("the folder {} doesn't have a talk.lua file".format(scene_folder))

        talk_file_path = os.path.join(scene_folder, "talk.lua")

        pos_patched_script = os.path.join(TMP_FOLDER, "script_scenario_managed", chapter_folder_name, scene_folder_name, "talk.lua")
        instruction[pos_patched_script] = ([talk_file_path, "patch_script.py"], "$(MKDIR) -p {}\n$(PYTHON3) patch_script.py {} {}".format(
            os.path.dirname(pos_patched_script),
            talk_file_path,
            pos_patched_script
        ))



        pos_script = os.path.join(PATCH_FOLDER, "script", "discern", chapter_folder_name, scene_folder_name, "talk.lua")
        instruction[pos_script] = ([pos_patched_script], "$(MKDIR) -p {}\n$(LUAC) -p {}\n$(CP) {} {}".format(
            os.path.dirname(pos_script),
            pos_patched_script,
            pos_patched_script,
            pos_script,
        ))
        files.remove("talk.lua")
        instruction["SCRIPTS"][0].append(pos_script)


        to_remove = []
        for file_name in files:
            if len(file_name) > 10:
                if file_name[0:9] == "placement":
                    if file_name[-5:] == ".json":
                        script_id = file_name.split("placement")[1].split(".json")[0]
                        plb_file_name = "discern_c{}_s{}_{}.plb".format(chapter_id, scene_id, script_id)
                        plb_pos = os.path.join(PATCH_FOLDER, "script", "placement_data", plb_file_name)
                        instruction[plb_pos] = ([os.path.join(scene_folder, file_name)], "$(MKDIR) -p {}\n$(PLBEDIT) /rj {} {}".format(
                            os.path.dirname(plb_pos),
                            os.path.join(scene_folder, file_name),
                            plb_pos,
                        ))
                        instruction["PLBS"][0].append(plb_pos)
                        to_remove.append(file_name)

        for r in to_remove:
            files.remove(r)

        if len(files) != 0:
            print("WARNING: some file in the folder {} havent been used: {}".format(scene_folder, files))



generated_makefile = "include config.mk\n"
for instruction_id in instruction:

    generated_makefile += instruction_id + " : "

    for dependancies in instruction[instruction_id][0]:
        generated_makefile += dependancies + " "

    generated_makefile += "\n"

    for line in instruction[instruction_id][1].split("\n"):
        generated_makefile += "\t" + line + "\n"
    generated_makefile += "\n"

print("writing the submakefile in {}".format(TARGET_FILE))

f = open(TARGET_FILE, "w")
f.write(generated_makefile)
f.close()
