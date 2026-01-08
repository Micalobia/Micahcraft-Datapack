from beet import Context, Function, Advancement
from tools.logger import Logger
from dataclasses import dataclass, field
from typing import Any
import re

# @score_trigger
# scoreboard mk.example
# !value 6000..7000
# predicates micahcraft:check1,micahcraft:check2
# no_reset

# Reset only removes the advancement, it doesn't reset any scoreboards

RE_SCORE_TRIGGER = re.compile(r"^#\s*@score_trigger\s*$")
RE_SCOREBOARD = re.compile(r"^#\s*scoreboard\s+([0-9a-zA-Z_.+-]+)\s*$")
RE_VALUE = re.compile(r"^#\s*(!?)value\s+((?:-?\d+(?:\.\.)?)|(?:(?:-?\d+)?(?:\.\.)-?\d+))\s*$")
RE_NO_RESET = re.compile(r"^#\s*no_reset\s*$")
RE_ID_TEMPLATE = r"[0-9a-z_.-]+:(?:[0-9a-z_.-]+(?:/[0-9a-z_.-]+)*)"
RE_PREDICATES = re.compile(rf"^#\s*predicates\s+((?:{RE_ID_TEMPLATE})(?:,(?:{RE_ID_TEMPLATE}))*)\s*$")


@dataclass(frozen=True, slots=True)
class ScoreValue:
    value: int | tuple[int | None, int | None]
    inverted: bool

    def predicate(self, scoreboard: str):
        if isinstance(self.value, int):
            range = self.value
        else:
            range = {}
            if self.value[0]:
                range["min"] = self.value[0]
            if self.value[1]:
                range["max"] = self.value[1]
        pred = {"condition": "minecraft:entity_scores", "entity": "this", "scores": {scoreboard: range}}
        if self.inverted:
            return {"condition": "minecraft:inverted", "term": pred}
        else:
            return pred


def run(ctx: Context):
    with ctx.inject(Logger).push("functions.score_triggers") as logger:
        logger.info("Processing...")
        for id, function in ctx.data.functions.items():
            reading = False
            invalid: str | None = None
            start: int | None = None
            end: int | None = None
            scoreboard: str | None = None
            value: ScoreValue | None = None
            predicates: list[str] | None = None
            reset = True
            for i, line in enumerate(function.lines):
                if not line.startswith("#"):
                    if reading:
                        end = i + 1
                        break
                    else:
                        continue
                if reading:
                    match = RE_SCOREBOARD.match(line)
                    if match:
                        if scoreboard:
                            invalid = "Duplicate scoreboard name"
                            break
                        scoreboard = match.group(1)
                        continue
                    match = RE_VALUE.match(line)
                    if match:
                        if value:
                            invalid = "Duplicate score value/range"
                            break
                        inverted = match.group(1) == "!"
                        n = match.group(2).split("..")
                        if len(n) == 2:
                            min = int(n[0]) if n[0] else None
                            max = int(n[1]) if n[1] else None
                            value = ScoreValue((min, max), inverted)
                        else:
                            value = ScoreValue(int(n[0]), inverted)
                        continue
                    match = RE_PREDICATES.match(line)
                    if match:
                        if predicates:
                            invalid = "Duplicate predicate list"
                            break
                        predicates = match.group(1).split(",")
                        continue
                    match = RE_NO_RESET.match(line)
                    if match:
                        if not reset:
                            invalid = "Duplicate no-reset flag"
                            break
                        reset = False
                    end = i + 1
                    break
                else:
                    match = RE_SCORE_TRIGGER.match(line)
                    if match:
                        reading = True
                        start = i
            if start is None or end is None:
                continue
            if not invalid:
                if not scoreboard and not predicates:
                    invalid = "Score trigger missing either scoreboard or predicates"
                if value and not scoreboard:
                    invalid = "Erroneous values"
            if invalid:
                logger.error(f"Invalid score trigger in '{id}': '{invalid}'")
                continue
            if scoreboard and not value:
                value = ScoreValue(0, True)
            preds: list[dict[str, Any]] = [{"condition": "minecraft:reference", "name": _} for _ in predicates] if predicates else []
            if value and scoreboard:
                preds.append(value.predicate(scoreboard))
            path = ":score_triggers/".join(id.split(":"))
            ctx.data[path] = Advancement(
                {
                    "criteria": {
                        "unlocked": {
                            "trigger": "minecraft:tick",
                            "conditions": {"player": preds},
                        }
                    },
                    "rewards": {"function": id},
                }
            )
            del function.lines[start:end]
            if reset:
                function.lines.insert(0, f"advancement revoke @s only {path}")
            ctx.data[id] = function
