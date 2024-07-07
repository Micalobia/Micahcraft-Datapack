import tkinter as tk
from tkinter import filedialog
import os
import json
from pydantic import BaseModel
from typing import Optional
import pathlib


class Ingredient(BaseModel):
    item: Optional[str] = None
    tag: Optional[str] = None

    @property
    def id(self):
        return self.item or self.tag


class Result(BaseModel):
    count: int
    id: str


class Stonecutter(BaseModel):
    type: str
    ingredient: Ingredient
    result: Result


def opend(path, mode):
    pathlib.Path(os.path.dirname(path)).mkdir(parents=True, exist_ok=True)
    return open(path, mode)


def sorted_list(obj):
    return sorted(list(obj))


root = tk.Tk()
root.withdraw()

minecraft = filedialog.askdirectory()
recipe_path = os.path.join(minecraft, "minecraft/recipe")

if not recipe_path:
    exit()

files = [
    os.path.join(dirpath, f)
    for (dirpath, dirnames, filenames) in os.walk(recipe_path)
    for f in filenames
]


files = [_ for _ in files if _.endswith("json")]

recipes = {}

print("Reading all recipes")
for file in files:
    with open(file, "r") as f:
        recipes[file] = json.load(f)

stonecutter: list[Stonecutter] = [
    Stonecutter.parse_obj(_)
    for _ in recipes.values()
    if _["type"] == "minecraft:stonecutting"
]

inputs = set()
outputs = set()

for stone in stonecutter:
    inputs.add(stone.ingredient.id)
    outputs.add(stone.result.id)

groups = inputs.difference(outputs)

tags = {_: {_} for _ in inputs}
for stone in stonecutter:
    tags[stone.ingredient.id].add(stone.result.id)

temp = {_: set() for _ in groups}

for k, v in tags.items():
    if k in temp:
        temp[k].update(v)
    else:
        for k2, v2 in tags.items():
            if k2 in temp and k in v2:
                temp[k2].update(v2)

tags = temp
all_outputs = temp.copy()
bad_inputs = ["_slab", "_stairs", "_wall"]

for k, v in tags.items():
    n = set()
    for block in v:
        flag = False
        for bad in bad_inputs:
            flag |= block.endswith(bad)
        if flag:
            continue
        n.add(block)
    tags[k] = n


print(json.dumps(all_outputs, indent=4, default=sorted_list))


def tag_path(t, *s):
    return os.path.join(
        f"./data/micahcraft/tags/{t}/generated", *s[:-1], f"{s[-1]}.json"
    )


def recipe_path(*s):
    return os.path.join("./data/micahcraft/recipe/generated", *s[:-1], f"{s[-1]}.json")


def advancement_path(*s):
    return os.path.join(
        "./data/micahcraft/advancement/generated", *s[:-1], f"{s[-1]}.json"
    )


print("Writing variant tags and stonecutting recipes...")
for tag, values in tags.items():
    name = tag.split(":")[-1]
    with opend(tag_path("item", "variant", name), "w") as f:
        j = {"replace": False, "values": values}
        json.dump(j, f, indent=4, default=sorted_list)
    for item in all_outputs[tag]:
        iname = item.split(":")[-1]
        with opend(recipe_path("variant", iname), "w") as f:
            j = {
                "type": "stonecutting",
                "ingredient": {"tag": f"micahcraft:generated/variant/{name}"},
                "result": {"id": item, "count": 2 if iname.endswith("_slab") else 1},
            }
            json.dump(j, f, indent=4, default=sorted_list)


print("Clearing vanilla stonecutting recipes...")
for path, recipe in recipes.items():
    if recipe["type"] != "minecraft:stonecutting":
        continue
    empty = {
        "type": "crafting_shapeless",
        "ingredients": [{"tag": "micahcraft:empty"}],
        "result": {"id": "air", "count": 1},
    }
    p = f"./data{path.split('data')[-1]}"
    with opend(p, "w") as f:
        json.dump(empty, f)

print("Finished")
