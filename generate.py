import tkinter as tk
import json
import jsonpatch
from shutil import rmtree
import zipfile
import sys
import data
from data import Colorable, IdentifierLike, AnyIdentifier, Stonecutter, Result
import pathlib
import os

# Goals:
# - Stonecutter Variants
# - Woodcutter Recipes
# - Painting Stonecutter variants
# - Recipe Advancements
# - Scoreboard Advancements
# - Colorable Recipes
# - Waxcutter recipes
# - Edit Vanilla Recipes (for future proofing reasons)


rmtree("./data/micahcraft/advancement/generated", ignore_errors=True)
for pp in ["item",]:  # fmt: skip
    rmtree(f"./data/micahcraft/tags/{pp}/generated", ignore_errors=True)

root = tk.Tk()
root.withdraw()

if len(sys.argv) > 1:
    minecraft_path = sys.argv[1]
else:
    minecraft_path = data.pick_file_dialog()

if minecraft_path is None:
    exit()

print("Reading advancement configs...")
with open("./recipe_advancements.json", "r") as f:
    advancements: dict[AnyIdentifier, list[IdentifierLike]] = json.load(f)

with open("./score_advancements.json", "r") as f:
    s = json.load(f)
    score_advancements: dict[str, data.ScoreAdvancement] = {k: data.ScoreAdvancement.model_validate(v) for k, v in s.items()}


for k, v in score_advancements.items():
    path = data.advancement_path("score_triggers", k)
    v.write_advancement(path)


def add_advancement(item: AnyIdentifier, recipe: IdentifierLike):
    if recipe.endswith(".json"):
        recipe = f"micahcraft:{recipe.split('recipe')[-1].replace("\\", '/')[1:-5]}"
    if ":" not in item:
        t = item.split("#")
        t[-1] = f"minecraft:{t[-1]}"
        item = "#".join(t)
    if item in advancements:
        advancements[item].append(recipe)
    else:
        advancements[item] = [recipe]


recipes = []
with zipfile.ZipFile(minecraft_path) as zf:
    print("Reading all recipes...")
    recipe_root = zipfile.Path(zf, "data/minecraft/recipe/")

    files = [p for p in data.zwalk(recipe_root, ".json")]

    for p in files:
        with p.open("r") as f:
            recipes.append(json.load(f))
    
    print("Reading all paintings...")
    painting_root = zipfile.Path(zf, "data/minecraft/painting_variant/")
    vanilla_files = [p.stem for p in data.zwalk(painting_root, ".json")]
    custom_files = [p.stem for p in pathlib.Path("./data/micahcraft/painting_variant").glob("*.json")]
    painting_ids = [f"minecraft:{_}" for _ in vanilla_files] + [f"micahcraft:{_}" for _ in custom_files]

    print("Modifying vanilla stuff...")
    with data.opend("./patch.json", "r") as f:
        patch_data: dict[str, list] = json.load(f)
    for path, patches in patch_data.items():
        if path == "$schema":
            continue
        path = data.vanilla_path(path)
        r = zipfile.Path(zf, path)
        with r.open("r") as f:
            r_data = json.load(f)
        jsonpatch.apply_patch(r_data, patches, in_place=True)
        w_path = os.path.join(".", path)
        with data.opend(w_path, "w") as f:
            json.dump(r_data, f, indent=4)


stonecutter_recipes = [Stonecutter.model_validate(_) for _ in recipes if _["type"] == "minecraft:stonecutting"]

inputs: set[str] = set()
outputs: set[str] = set()

for recipe in stonecutter_recipes:
    inputs.update([recipe.ingredient] if isinstance(recipe.ingredient, str) else recipe.ingredient)
    outputs.add(recipe.result.id)

groups = inputs.difference(outputs)

tags: dict[str, set[str]] = {_: {_} for _ in inputs}
for recipe in stonecutter_recipes:
    if isinstance(recipe.ingredient, str):
        tags[recipe.ingredient].add(recipe.result.id)
    else:
        for ing in recipe.ingredient:
            tags[ing].add(recipe.result.id)

temp: dict[str, set[str]] = {_: set() for _ in groups}

for k, v in tags.items():
    if k in temp:
        temp[k].update(v)
    else:
        for k2, v2 in tags.items():
            if k2 in temp and k in v2:
                temp[k2].update(v2)

tags = temp
all_outputs = temp.copy()
bad_inputs = (
    "_slab",
    "_stairs",
    "_wall",
)

for k, v in tags.items():
    n = set()
    for block in v:
        flag = False
        for bad in bad_inputs:
            if block.endswith(bad):
                break
        else:
            n.add(block)
    tags[k] = n

print("Writing variant files...")
for tag, values in tags.items():
    name = tag.split(":")[-1]
    i = f"micahcraft:generated/variant/{name}"
    with data.opend(data.tag_path("item", "variant", name), "w") as f:
        f.write(data.Tag(values=list(values)).model_dump_json(indent=4))
    for item in all_outputs[tag]:
        iname = item.split(":")[-1]
        path = data.recipe_path("variant", iname)
        add_advancement(f"#{i}", path)
        cutting_recipe = Stonecutter.from_tag(i, item, 2 if iname.endswith("_slab") else 1)
        cutting_recipe.write_file(path)


print("Generating painting recipes...")
for name in painting_ids:
    painting_recipe = Stonecutter(ingredient="minecraft:painting",result=Result(id="minecraft:painting",components={"minecraft:painting/variant":name}))
    painting_recipe.write_file(data.recipe_path("painting",*name.split(":")))


woods = data.LogType.parse_list(json.loads(pathlib.Path("./logs.json").read_text("utf-8")))

print("Generating woodcutting tags...")
for wood in woods:
    tag = data.Tag(values=[wood.wood, wood.stripped_wood])
    tag.write_file(data.tag_path("item", "wood", wood.name))
    tag = data.Tag(values=[wood.log, wood.stripped_log])
    tag.write_file(data.tag_path("item", "log", wood.name))

print("Generating woodcutting recipes...")
for wood in woods:
    if wood.type == "log":
        Stonecutter.from_tag(wood.woods, wood.boat).write_file(data.recipe_path("woodcutting", wood.name, "boat_from_wood"))
    r = {
        "planks_from_log": Stonecutter.from_tag(wood.just_logs, wood.planks, 4),
        "planks_from_wood": Stonecutter.from_tag(wood.woods, wood.planks, 5),
        "slabs_from_log": Stonecutter.from_tag(wood.just_logs, wood.slab, 8),
        "slabs_from_wood": Stonecutter.from_tag(wood.woods, wood.slab, 10),
        "stairs_from_log": Stonecutter.from_tag(wood.just_logs, wood.stairs, 4),
        "stairs_from_wood": Stonecutter.from_tag(wood.woods, wood.stairs, 5),
        "trapdoor_from_log": Stonecutter.from_tag(wood.just_logs, wood.trapdoor),
        "trapdoor_from_wood": Stonecutter.from_tag(wood.woods, wood.trapdoor, 2),
        "stripped_log": Stonecutter.from_item(wood.log, wood.stripped_log),
        "stripped_wood": Stonecutter.from_item(wood.wood, wood.stripped_wood),
        "fence_from_wood": Stonecutter.from_tag(wood.woods, wood.fence, 3),
        "fence_from_logs": Stonecutter.from_tag(wood.just_logs, wood.fence, 2),
        "fence_gate_from_logs": Stonecutter.from_tag(wood.logs, wood.gate),
        "slabs_from_planks": Stonecutter.from_item(wood.planks, wood.slab, 2),
        "stairs_from_planks": Stonecutter.from_item(wood.planks, wood.stairs),
        "door_from_logs": Stonecutter.from_tag(wood.logs, wood.door, 2),
    }
    for k, v in r.items():
        path = data.recipe_path("woodcutting", wood.name, k)
        add_advancement(f"#{wood.logs}", path)
        add_advancement(wood.planks, path)
        v.write_file(path)

colors = [
    "white",
    "orange",
    "magenta",
    "light_blue",
    "yellow",
    "lime",
    "pink",
    "gray",
    "light_gray",
    "cyan",
    "purple",
    "blue",
    "brown",
    "green",
    "red",
    "black",
]


colored = [
    Colorable(name="wool", tag="minecraft:wool"),
    Colorable(name="carpet", tag="minecraft:wool_carpets"),
    Colorable(name="stained_glass", tag="micahcraft:dyeable/glass"),
    Colorable(name="stained_glass_pane", tag="micahcraft:dyeable/glass_panes"),
    Colorable(name="terracotta", tag="minecraft:terracotta"),
    Colorable(name="concrete", tag="micahcraft:dyeable/concrete"),
    Colorable(name="concrete_powder", tag="micahcraft:dyeable/concrete_powder"),
]


print("Generating color recipes...")
for item in colored:
    for color in colors:
        path = data.recipe_path("recolors", item.name, color)
        add_advancement(f"#{item.tag}", path)
        item.recipe(color).write_file(path)


print("Generating waxcutting recipes...")
waxed: IdentifierLike = json.loads(pathlib.Path("./waxed.json").read_text("utf-8"))
for item in waxed:
    recipe = Stonecutter.from_item(item, item[6:])
    path = data.recipe_path("remove_wax", item)
    recipe.write_file(path)
    add_advancement(item, path)


print("Generating recipe advancements...")
s = set()
for item, recipe in advancements.items():
    a = data.recipe_advancement(item, recipe)
    p = item.replace(":", "/").replace("#", "")
    if p in s:
        raise Exception(f"Duplicate thingy {p}")
    s.add(p)
    path = pathlib.Path(data.advancement_path("recipes", p))
    with data.opend(path, "w") as f:
        json.dump(a, f, indent=4)


print("Finished")
