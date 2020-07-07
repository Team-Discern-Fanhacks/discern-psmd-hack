# lua

`lua`s files are the core of the cutscene. `Lua` is an actual programming language, widely used in videogame, and is well documented, so I won't learn you how to use it (TODO: point to resource useful to learn it).

The following of the page assume you have basic knowledge in `lua`, including calling and creating function.

## How to quickly test things with `lua`

If you just want to do some experiment, that's easy:
- edit content in the `discern_c01_s01_01_start` function in the file `discern/chapter01/scene01/talk.lua` (correspond to the first cutscene in the hack).
- compile and install the patch with `make install`
- start citra
- delete the save if any (after having made a backup if you want to conserve it)
- watch the modified cutscene
- once finished, you can remove the modification via git.

## How cutscene work in PSMD
Each cutscene have an id (in the discern hack) with the form `discern_cXX_sYY_ZZ` (see the [script overview page](./general.md) for more detail). Each scene have a `talk.lua` file (named in this way, as there are restriction on possible script name, and this seemed the most generic one). The script contain multiple part

### The header
import various content into the running `lua` content. They shouldn't change between file, except for some specific reason. They are:

```lua
dofile("script/include/inc_all.lua")
dofile("script/include/inc_event.lua")
```

There is also some function definition, that doesn't seem to serve any specific function, but that are present in every script file. You're better put them in the header just in case.
```lua
function groundInit()
end
function groundStart()
end
function groundEnd()
end
```

### The sequence
Each sequence have three function defined in the lua file. Two of them seems to be unused.

(replace SEQUENCEID with the sequence id, like `discern_cXX_sYY_ZZ`)
- SEQUENCEID_init
- SEQUENCEID_start
- SEQUENCEID_end

please note tha SEQUENCEID_init and SEQUENCEID_end doesn't contain anyting useful, and are command without effect and without input.

The SEQUENCEID_start contain all the important code, where you can write the cutscene. Here is a basic code for a sequence.

```lua
function SEQUENCEID_init()
end

function SEQUENCEID_start()
	-- your script come here ...
	-- here is a basic example
	-- assume the existence of HERO however
	WINDOW_Talk(SymAct("HERO"), "Hello, world")
end

function SEQUENCEID_end()
end
```

## writing a sequence cutscene
Once you have defined all useful function, you need to edit the SEQUENCEID_start() function. Althougth it need more work, here is some basic function and information that are useful.

### Fadding in the camera
At the beggining of a cutscene, the screen is black. You can use the `SCREEN_A:FadeIn(TimeSec(TIME), true)`, to made a fadeout of `TIME` second (replace it with the good time in second), and wait the end of the fadeout
### WINDOW_Talk
WINDOW_Talk is a function used at compile time, that transform to WINDOW:Talk (made a character speak). You can write it like `WINDOW_Talk(SymAct("HERO"), "Hello world")`. The compilation will ensure that the space are preserved
### About space
Function that display space doesn't work as-is. Space need to be replaced with the japanese character `쐃` (ensure you save your file with the utf-8 codec if you don't use WINDOW_Talk)
### return value
If you call `return` in your script, it will stop running the script, and skip to the next (as you can expect). If you use something like `return "XXX"`, `XXX` (or any other string) can be capted by the flow, permitting to made decision over multiple scene/sequence/chapter (contact me (marius851000) if you want to do that).

## list of function
there is some basic function definition in the file [script/lua/definition](./definition/overview.md) and it's subchapter

## Finding function
If you need to find function, you can search throught the decompiled file (that I shared on github (TODO: put link here)).

Name are usually explicit. Something important to note is the use of number (posititive or negative) instead of string. They reference to the content a string that is stored in a separate file, used for translation. You can replace them with the string you want, taking into account the special status of space.
