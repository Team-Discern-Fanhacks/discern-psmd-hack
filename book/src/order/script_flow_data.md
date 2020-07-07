# script_flow_data

`script_flow_data.bin` is the file in the game that list the order of cutscenes. It also have condition, and allow to add freemove and dungeon part (althought this need more research). This format is harder than the other to understand, so you just need to know that, to add the cutscene id `entry` list, in the appropriate order (that will work until we want to add gameplay/condition).

If you want to test a cutscene, just add it to the top the list, and ensure it is at its good place when commiting. The cutscene play in the order they are listed.
