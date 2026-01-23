from beet import Context, ItemTag
from beet.contrib.vanilla import Vanilla
from tools.utility import Recipes, Tags
from tools.logger import Logger
import re
from dataclasses import dataclass


def run(ctx: Context):
    with ctx.inject(Logger).push("woodcutting") as logger:
        tags = ctx.inject(Tags)
        recipes = ctx.inject(Recipes)
        vanilla = ctx.inject(Vanilla)
        pattern = re.compile(r"^minecraft:(?!stripped_)(\w+?)_(log|stem)$")
        micahcraft = ctx.data[ctx.project_id]
        woodcutter_recipes: list[WoodcutterRecipe] = ctx.meta["woodcutter"]
        resolved = tags.resolve_tag("minecraft:logs", vanilla.data.item_tags)
        type_count = 0
        for id in resolved:
            match = pattern.match(id)
            if match is None:
                continue
            type_count += 1
            name = match[1]
            wood = LogType(name, match[2])
            micahcraft[f"generated/wood/{name}"] = ItemTag({"values": [wood.wood, wood.stripped_wood]})
            micahcraft[f"generated/log/{name}"] = ItemTag({"values": [wood.log, wood.stripped_log]})
            for recipe in woodcutter_recipes:
                if recipe.log_only and wood.type != "log":
                    continue
                path = f"generated/woodcutting/{name}/{recipe.title}"
                micahcraft[path] = recipes.stonecutter(wood.variable(recipe.input), wood.variable(recipe.output), recipe.count)
                micahcraft[f"{path}/logs"] = recipes.advancement(wood.logs, f"{ctx.project_id}:{path}")
                micahcraft[f"{path}/planks"] = recipes.advancement(wood.planks, f"{ctx.project_id}:{path}")
        stem_recipe_count = len([_ for _ in woodcutter_recipes if not _.log_only])
        logger.info(f"{stem_recipe_count}/{len(woodcutter_recipes)} recipes, {type_count} stem/log types")


@dataclass(frozen=True)
class WoodcutterRecipe:
    title: str
    input: str
    output: str
    log_only: bool
    count: int


@dataclass
class LogType:
    name: str
    type: str = "log"

    @property
    def _log(self) -> str:
        match self.type:
            case "log":
                return "log"
            case "stem":
                return "stem"
        raise Exception("Not a log or stem!")

    @property
    def _wood(self) -> str:
        match self.type:
            case "log":
                return "wood"
            case "stem":
                return "hyphae"
        raise Exception("Not a log or stem!")

    def variable(self, key: str) -> str:
        match key:
            case "boat":
                return self.boat
            case "door":
                return self.door
            case "fence":
                return self.fence
            case "gate":
                return self.gate
            case "just_logs":
                return self.just_logs
            case "log":
                return self.log
            case "logs":
                return self.logs
            case "planks":
                return self.planks
            case "shelf":
                return self.shelf
            case "slab":
                return self.slab
            case "stairs":
                return self.stairs
            case "stripped_log":
                return self.stripped_log
            case "stripped_wood":
                return self.stripped_wood
            case "trapdoor":
                return self.trapdoor
            case "wood":
                return self.wood
            case "woods":
                return self.woods
        raise Exception(f"Invalid key: {key}")

    @property
    def log(self) -> str:
        return f"{self.name}_{self._log}"

    @property
    def wood(self) -> str:
        return f"{self.name}_{self._wood}"

    @property
    def stripped_log(self) -> str:
        return f"stripped_{self.name}_{self._log}"

    @property
    def stripped_wood(self) -> str:
        return f"stripped_{self.name}_{self._wood}"

    @property
    def logs(self) -> str:
        return f"#{self.log}s"

    @property
    def woods(self) -> str:
        return f"#micahcraft:generated/wood/{self.name}"

    @property
    def just_logs(self) -> str:
        return f"#micahcraft:generated/log/{self.name}"

    @property
    def boat(self) -> str:
        return f"{self.name}_boat"

    @property
    def fence(self) -> str:
        return f"{self.name}_fence"

    @property
    def gate(self) -> str:
        return f"{self.name}_fence_gate"

    @property
    def planks(self) -> str:
        return f"{self.name}_planks"

    @property
    def slab(self) -> str:
        return f"{self.name}_slab"

    @property
    def stairs(self) -> str:
        return f"{self.name}_stairs"

    @property
    def trapdoor(self) -> str:
        return f"{self.name}_trapdoor"

    @property
    def door(self) -> str:
        return f"{self.name}_door"

    @property
    def shelf(self) -> str:
        return f"{self.name}_shelf"
