from beet import Context, Function
from tools.logger import Logger

from typing import Literal
from dataclasses import dataclass


@dataclass(frozen=True)
class Group:
    name: str
    skip: bool
    priority: int = 0


@dataclass(frozen=True)
class SoundGroup:
    name: str
    sound: str
    volume: float
    pitch: float
    priority: int = 0
    skip: Literal[False] = False


def beet_default(ctx: Context):
    with ctx.inject(Logger).push("veinmining") as logger:
        groups: list[Group] = ctx.meta["veinmining/groups"]
        sounds: list[SoundGroup] = ctx.meta["veinmining/sounds"]
        ctx.data["micahcraft:enchantments/veinmining/data/group"] = Function(
            ctx.template.render("function/veinmining/group.mcfunction.j2", groups=groups)
        )
        ctx.data["micahcraft:enchantments/veinmining/data/sound_group"] = Function(
            ctx.template.render("function/veinmining/group.mcfunction.j2", groups=sounds)
        )
        ctx.data["micahcraft:enchantments/veinmining/sound"] = Function(
            ctx.template.render("function/veinmining/sound.mcfunction.j2", groups=sounds)
        )
        logger.info(f"{len(groups)} groups, {len(sounds)} sound groups")