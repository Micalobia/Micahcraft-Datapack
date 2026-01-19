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
    with ctx.inject(Logger).push("colorable") as logger:
        logger.info("Building...")
        recipes = ctx.inject(Recipes)
        colorable_json: dict[str, str] = json.loads(pathlib.Path("./config/colorable.json").read_text("utf-8"))
        for item, tag in colorable_json.items():
            for color in COLORS:
                identifier = f"{ctx.project_id}:generated/recolors/{item}/{color}"
                ctx.data[identifier] = Recipe(
                    {
                        "type": "crafting_shaped",
                        "pattern": ["###", "#D#", "###"],
                        "key": {"#": f"#{tag}", "D": f"{color}_dye"},
                        "result": {"id": f"{color}_{item}", "count": 8},
                    }
                )
                ctx.data[identifier] = recipes.advancement(f"#{tag}", identifier)
        for color in COLORS:
            identifier = f"micahcraft:helmet_banner/{color}"
            ctx.data[identifier] = Recipe(ctx.template.render("recipes/wearable_banner.json.j2", color=color))
            ctx.data[identifier] = recipes.advancement("#minecraft:banners", identifier)
