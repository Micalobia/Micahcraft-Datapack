from beet import Context, Recipe
from tools.utility import Recipes
from tools.logger import Logger
import json
import pathlib

COLORS = [
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

def run(ctx: Context):
    with ctx.inject(Logger) as logger:
        logger.info("Building color recipes...")
        recipes = ctx.inject(Recipes)
        micahcraft = ctx.data[ctx.project_id]
        colorable_json: dict[str, str] = json.loads(pathlib.Path("./config/colorable.json").read_text("utf-8"))
        for item, tag in colorable_json.items():
            for color in COLORS:
                path = f"generated/recolors/{item}/{color}"
                micahcraft[path] = Recipe({
                    "type": "crafting_shaped",
                    "pattern": ["###","#D#","###"],
                    "key": {"#":f"#{tag}","D":f"{color}_dye"},
                    "result":{"id":f"{color}_{item}","count":8}
                })
                micahcraft[path] = recipes.advancement(f"#{tag}",f"{ctx.project_id}:{path}")