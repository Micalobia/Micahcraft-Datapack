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

print("Reading advancement config")
with open("./recipe_advancements.json", "r") as f:
    advancements = json.load(f)

advancements: dict[str, set[str]] = {k: set(v) for k, v in advancements.items()}


def add_advancement(item: str, recipe: str):
    if recipe.endswith(".json"):
        backslash = "\\"
        recipe = f"micahcraft:{recipe.split('recipe')[-1].replace(backslash,'/')[1:-5]}"
    if ":" not in item:
        t = item.split("#")
        t[-1] = f"minecraft:{t[-1]}"
        item = "#".join(t)
    if item in advancements:
        advancements[item].add(recipe)
    else:
        advancements[item] = {recipe}


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


def cutting_recipe(ingredient, result, count=1, is_item=False):
    return {
        "type": "stonecutting",
        "ingredient": {"item" if is_item else "tag": ingredient},
        "result": {"id": result, "count": count},
    }


def recipe_advancement(item, recipes):
    criteria = {
        "has_the_item": {
            "trigger": "minecraft:inventory_changed",
            "conditions": {"items": [{"items": item}]},
        }
    }
    for i, recipe in enumerate(recipes):
        criteria[f"has_the_recipe_{i + 1}"] = {
            "conditions": {"recipe": recipe},
            "trigger": "minecraft:recipe_unlocked",
        }
    return {
        "parent": "minecraft:recipes/root",
        "criteria": criteria,
        "requirements": [["has_the_item", *[f"has_the_recipe_{_ + 1}" for _ in range(len(recipes))]]],
        "rewards": {"recipes": recipes},
    }


print("Writing variant tags and stonecutting recipes...")
for tag, values in tags.items():
    name = tag.split(":")[-1]
    i = f"micahcraft:generated/variant/{name}"
    with opend(tag_path("item", "variant", name), "w") as f:
        j = {"replace": False, "values": values}
        json.dump(j, f, indent=4, default=sorted_list)
    for item in all_outputs[tag]:
        iname = item.split(":")[-1]
        path = recipe_path("variant", iname)
        add_advancement(f"#{i}", path)
        with opend(path, "w") as f:
            j = cutting_recipe(
                i,
                item,
                2 if iname.endswith("_slab") else 1,
            )
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


class LogType(BaseModel):
    name: str
    stem: bool = False

    @property
    def log(self):
        return f"{self.name}_{'stem' if self.stem else 'log'}"

    @property
    def wood(self):
        return f"{self.name}_{'hyphae' if self.stem else 'wood'}"

    @property
    def stripped_log(self):
        return f"stripped_{self.name}_{'stem' if self.stem else 'log'}"

    @property
    def stripped_wood(self):
        return f"stripped_{self.name}_{'hyphae' if self.stem else 'wood'}"

    @property
    def logs(self):
        return f"{self.log}s"

    @property
    def woods(self):
        return f"micahcraft:generated/wood/{self.name}"

    @property
    def boat(self):
        if self.stem:
            return "minecraft:air"
        else:
            return f"{self.name}_boat"

    @property
    def fence(self):
        return f"{self.name}_fence"

    @property
    def gate(self):
        return f"{self.name}_fence_gate"

    @property
    def planks(self):
        return f"{self.name}_planks"

    @property
    def slab(self):
        return f"{self.name}_slab"

    @property
    def stairs(self):
        return f"{self.name}_stairs"

    @property
    def trapdoor(self):
        return f"{self.name}_trapdoor"


woods = [
    LogType(name="acacia"),
    LogType(name="birch"),
    LogType(name="cherry"),
    LogType(name="crimson", stem=True),
    LogType(name="dark_oak"),
    LogType(name="jungle"),
    LogType(name="mangrove"),
    LogType(name="oak"),
    LogType(name="spruce"),
    LogType(name="warped", stem=True),
]

print("Generating woodcutting tags...")
for wood in woods:
    tag = {"replace": False, "values": [wood.wood, wood.stripped_wood]}
    with opend(tag_path("item", "wood", wood.name), "w") as f:
        json.dump(tag, f, indent=4)


print("Generating woodcutting recipes...")
for wood in woods:
    if not wood.stem:
        with opend(recipe_path("woodcutting", wood.name, "boat_from_wood"), "w") as f:
            json.dump(cutting_recipe(wood.woods, wood.boat), f, indent=4)
    r = {
        "fence_from_wood": cutting_recipe(wood.woods, wood.fence, 3),
        "fence_gate_from_wood": cutting_recipe(wood.woods, wood.gate),
        "planks_from_log": cutting_recipe(wood.logs, wood.planks, 4),
        "slabs_from_log": cutting_recipe(wood.logs, wood.slab, 8),
        "slabs_from_planks": cutting_recipe(wood.planks, wood.slab, 2, True),
        "stairs_from_log": cutting_recipe(wood.logs, wood.stairs, 4),
        "stairs_from_planks": cutting_recipe(wood.planks, wood.stairs, 1, True),
        "stripped_log": cutting_recipe(wood.log, wood.stripped_log, 1, True),
        "stripped_wood": cutting_recipe(wood.wood, wood.stripped_wood, 1, True),
        "trapdoor_from_log": cutting_recipe(wood.logs, wood.trapdoor),
    }
    for k, v in r.items():
        path = recipe_path("woodcutting", wood.name, k)
        add_advancement(f"#{wood.logs}", path)
        add_advancement(wood.planks, path)
        with opend(path, "w") as f:
            json.dump(v, f, indent=4)

print("Generating advancement recipes...")
s = set()
for item, recipe in advancements.items():
    a = recipe_advancement(item, recipe)
    p = item.replace(":", "/").split("/")[-1]
    if p in s:
        raise Exception(f"Duplicate thingy {p}")
    s.add(p)
    with opend(advancement_path("recipes", p), "w") as f:
        json.dump(a, f, indent=4, default=sorted_list)

print("Finished")
