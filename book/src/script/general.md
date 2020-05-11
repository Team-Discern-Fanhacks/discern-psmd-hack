# script

Scripts are made of two file: a `lua` and a `plb` file.

First of all, it is important to know how those cutscene are divided. They are:
- divided by chapter
- then by scene
- then by sequence

This order is for practical reason. There is a no specific way to tell when you should change of chapter, but it is important that you should create a new scene only when gameplay are expected to be in between, or when the chapter change. (please note this isn't a strict rule, but it's how it's done in the base game).

Then, you change sequence when you need to change map without gameplay. Each scene share the same lua file, but have a different plb per sequence.

those chapter/scene/sequence are numbered. I recommand using two character when you write the number, beggining with 1 (as in 01, 02, 03 ... 09, 10, 11 ... 99). If you need more than 99 chapter/scene/sequence, it is possible to use longer number, but some care should be taken. contact me (marius851000).

Every sequence have a unique assigned id. It is `discern_cXX_sYY_ZZ`, where XX is the chapter id (2 letter), YY is the scene id and ZZ is the sequence id.

Everything written above about ordering are flexible, so, if you need, for example, to add an additional sequence behind two of them, contact me (marius851000). I will help you do that.

## About LUA
`Lua` files are the core of the cutscene. `Lua` is a true programming language, that are often used in videogame, due to their simplicity and low footprint on the system when used for high-level stuff (like cutscene). The game store it's lua cutsene in a compressed form, but that compressed form is widely used in many other game, and is public. Tools exist to tranform those lua file in decompressed file (without any comment, however).

The game can also read uncompressed file, so we don't need to compress them in this hack.

This hack use one lua file by scene, as in the base game.

To learn how to use lua, read the [lua subchapter](./script/lua.md).

## About PLB
`PLB` files contain additional information about a sequence, such as the initial position of character/object, camera data, and a list of named coordinate, thus they can potentially be selected with a graphical tool (that we don't have, so we need to use the eddyk28 mod to get those).

To learn how to use plb, read the [plb chapter](./script/plb.md)
