from beet import Context, ItemTag
from beet.contrib.vanilla import Vanilla
from tools.utility import Recipes
from tools.logger import Logger


def run(ctx: Context):
    with ctx.inject(Logger).push("variants") as logger:
        vanilla = ctx.inject(Vanilla)
        recipe_helper = ctx.inject(Recipes)
        recipes = [recipe for _, recipe in vanilla.data.recipes.items() if recipe.data.get("type") == "minecraft:stonecutting"]
        inputs: set[str] = set()
        outputs: set[str] = set()

        for recipe in recipes:
            match recipe.data:
                case {"ingredient": ingredient, "result": {"id": id}}:
                    inputs.update([ingredient] if isinstance(ingredient, str) else ingredient)
                    outputs.add(id)

        groups = inputs.difference(outputs)

        tags: dict[str, set[str]] = {_: {_} for _ in inputs}
        for recipe in recipes:
            match recipe.data:
                case {"ingredient": ingredient, "result": {"id": id}}:
                    if isinstance(ingredient, str):
                        tags[ingredient].add(id)
                    else:
                        for ing in ingredient:
                            tags[ing].add(id)
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
        bad_inputs = ("_slab", "_stairs", "_wall")

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

        recipe_count = 0
        for tag, values in tags.items():
            name = tag.split(":")[-1]
            identifier = f"{ctx.project_id}:generated/variant/{name}"
            ctx.data[identifier] = ItemTag({"values": list(values)})
            for item in all_outputs[tag]:
                item_name = f"{identifier}/{item.split(":")[-1]}"
                ctx.data[item_name] = recipe_helper.stonecutter(f"#{identifier}", item, 2 if item.endswith("_slab") else 1)
                ctx.data[item_name] = recipe_helper.advancement(f"#{identifier}", identifier)
                recipe_count += 1
        logger.info(f"{len(tags)} block families, {recipe_count} recipes/advancements")
