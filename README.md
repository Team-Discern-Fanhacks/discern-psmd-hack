# discern psmd hack
The code for an hackrom currently being worked on

# use on windows
To use this tool on windows (64 bit), you need to:
- download this repository: https://github.com/marius851000/psmd-hack-bin-win86_64
- rename it at win86_64-binary and move it to the discern-psmd-hack folder
- open config.mk, add an '#' before "include config/linux-system.mk" and remove the one before "#include config/windows-x86_64-prebuilt.mk"

That's for the configuration, to use it, open a terminal of your choice (powershell is better than cmd.exe) and navigate to the "discern-psmd-hack" folder, that contain this file and the file called "Makefile"

You then need to use the command:

"win86_64-binary/make.exe (argument)"

replacing (argument) with possibly:

- "patch" to generate the patch folder, that contain the patch to be applied to the romfs
- "install" to generate and place the patch in the romfs patch folder of citra for the US version of the patch, allowing quick test (you need a recent version of citra, however)
- "patch.zip" to generate the patch.zip folder, that can be redistrubed
