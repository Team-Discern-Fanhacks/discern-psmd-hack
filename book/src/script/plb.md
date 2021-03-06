# plb

`plb`s files store information about the initial state of the scene. Their is one `plb` per [sequence](./general.md).

The `plb` file store:
- the id of the cutscene
- list of personnages in the cutscene and their initial placement
- list of items in the cutscene and their initial placement
- various named coordinate, that can be refered in cutscene
- other stuff

In the discern hack, `plb` files are store in a decompressed file, generated by the `plbEdit` tool of EddyK28. To extract a cutscene, you need to run `plbEdit /wj sourceFile.plb targetFile.json` (be sure to replace `sourceFile.plb` and `targetFile.json`, and add a `.exe` after `plbEdit` on window). For a sequence, it need to be placed in the folder `discern/chapterXX/sceneYY`, and named `placementZZ.json`, where `ZZ` is replaced by the sequence id.

When creating a new cutscene, I recommend decompressing an already existing `PLB` file, and then edit it.

## Editing a `plb`

First, read a short guide on json. It is a common language in programming to store ordered data. [this one seem to be a good guide, and you can ignore the content about XML](https://www.digitalocean.com/community/tutorials/an-introduction-to-json).

The first thing you need to edit in a `plb` file is the sequence id. It is at the top of the file, after `"name" :`. You need to replace this with the [sequence id](./general.md), so it look like:
```json
{
  "sections": [
    {
      "name": "discern_c01_s01_01",
			...
```

It is important to change this, as otherwise, the sequence won't load ingame.

I haven't did much research about this format -- but it seem relatively easy to modify.

I suggest you try by yourself. You can import and export json file from plbEdit, and edit them with a GUI. Alternatively, you can use a graphical json editor.

If you want to get point coordinate, you can use the freecam from EddyK28 if you need to get coordinate of a point that can be accessed by freemove. Otherwise it may need a bit more work. Contact me (marius851000).
