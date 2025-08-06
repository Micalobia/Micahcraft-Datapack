import pathlib
import os
from pydantic import BaseModel, Field, StringConstraints, ConfigDict, model_validator, field_serializer
from typing import Annotated, Iterable, Literal, Iterator, IO, AnyStr, Any, Type, TypeVar
import zipfile
from os import PathLike
import json
from dataclasses import dataclass

StrPath = str | pathlib.Path | PathLike[str]


# Creates a parent directory for a file before creating a file
def opend(path: StrPath, mode: str) -> IO[AnyStr]:
    p = pathlib.Path(path)
    p.parent.mkdir(parents=True, exist_ok=True)
    return p.open(mode)


def zwalk(path: zipfile.Path, extensions: str | set[str] | None = None) -> Iterator[zipfile.Path]:
    if extensions:
        if isinstance(extensions, str):
            extensions = {extensions}
        extensions = {(e.lower() if e.startswith(".") else "." + e.lower()) for e in extensions}

    def _walk(p: zipfile.Path) -> Iterator[zipfile.Path]:
        for child in p.iterdir():
            if child.is_dir():
                yield from _walk(child)
            else:
                if extensions is None or child.suffix.lower() in extensions:
                    yield child

    if path.is_file():
        if extensions is None or path.suffix.lower() in extensions:
            yield path
        return

    yield from _walk(path)


def pick_file_dialog() -> str | None:
    # Lazy-import Tk so CLI-only usage doesn’t pull in GUI bits
    from tkinter import Tk, filedialog

    root = Tk()
    root.withdraw()
    return (
        filedialog.askopenfilename(
            title="Select Minecraft JAR/ZIP",
            filetypes=(("ZIP/JAR", "*.zip *.jar"), ("All files", "*.*")),
        )
        or None
    )  # None if user cancels


def tag_path(t: str, *s: str) -> str:
    return os.path.join(f"./data/micahcraft/tags/{t}/generated", *s[:-1], f"{s[-1]}.json")


def advancement_path(*s: str) -> str:
    return os.path.join("./data/micahcraft/advancement/generated", *s[:-1], f"{s[-1]}.json")


def recipe_path(*s):
    return os.path.join("./data/micahcraft/recipe/generated", *s[:-1], f"{s[-1]}.json")


_namespace = r"[a-z0-9_.-]+"
_path = r"[a-z0-9_/.\-]+"

IdentifierPath = Annotated[str, StringConstraints(pattern=rf"^{_path}$")]
Identifier = Annotated[str, StringConstraints(pattern=rf"^{_namespace}:{_path}$")]
IdentifierLike = IdentifierPath | Identifier
TagPath = Annotated[str, StringConstraints(pattern=rf"^#{_path}$")]
TagIdentifier = Annotated[str, StringConstraints(pattern=rf"^#{_namespace}:{_path}$")]
TagLike = TagPath | TagIdentifier
AnyIdentifier = IdentifierLike | TagIdentifier
Scoreboard = Annotated[str, StringConstraints(pattern=r"^[a-zA-Z0-9-+._]+$")]

Ingredient = IdentifierLike | TagLike | list[IdentifierLike]
LootContext = Literal["this", "attacker", "direct_attacker", "attacking_player"]


def recipe_advancement(item: AnyIdentifier, recipes: list[IdentifierLike]):
    recipes = sorted(recipes)
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


T = TypeVar("T", bound="SimpleModel")


class SimpleModel(BaseModel):
    model_config = ConfigDict(extra="forbid")

    def model_dump(self, *args, **kwargs):
        kwargs.setdefault("exclude_none", True)
        return super().model_dump(*args, **kwargs)

    def model_dump_json(self, *args, **kwargs):
        kwargs.setdefault("exclude_none", True)
        return super().model_dump_json(*args, **kwargs)

    def write_file(self, path: StrPath, *, indent: int = 4):
        p = pathlib.Path(path)
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(self.model_dump_json(indent=indent))

    @classmethod
    def parse_list(cls: Type[T], data: Iterable[Any]) -> list[T]:
        return [cls.model_validate(obj) for obj in data]


class Tag(SimpleModel):
    replace: bool = False
    values: list[AnyIdentifier]

    @field_serializer("values", when_used="json")
    def ordered_values(self, values: list[AnyIdentifier], _info) -> list[AnyIdentifier]:
        return sorted(values)


class Range(SimpleModel):
    min: int | None = None
    max: int | None = None


class Predicate(SimpleModel):
    pass


class EntityScorePredicate(Predicate):
    condition: Literal["minecraft:entity_scores"] = "minecraft:entity_scores"
    entity: LootContext = "this"
    scores: dict[str, int | Range]


class InvertedPredicate(Predicate):
    condition: Literal["minecraft:inverted"] = "minecraft:inverted"
    term: "PredicateLike"


class ReferencePredicate(Predicate):
    condition: Literal["minecraft:reference"] = "minecraft:reference"
    name: IdentifierLike


PredicateLike = Annotated[
    EntityScorePredicate | InvertedPredicate | ReferencePredicate, Field(discriminator="condition")
]


class ScoreValue(SimpleModel):
    range: int | Range
    inverted: bool = False

    def to_predicate(self, scoreboard: Scoreboard) -> PredicateLike:
        base = EntityScorePredicate(scores={scoreboard: self.range})
        return InvertedPredicate(term=base) if self.inverted else base

    @classmethod
    def predicate(cls, scoreboard: Scoreboard, range: int | Range, inverted: bool = False) -> PredicateLike:
        return ScoreValue(range=range, inverted=inverted).to_predicate(scoreboard)


class ScoreAdvancement(SimpleModel):
    scoreboard: str | None = None
    value: ScoreValue | None = None
    function: IdentifierLike
    predicates: list[ReferencePredicate] = Field(default_factory=list)

    @model_validator(mode="before")
    @classmethod
    def coerce_values(cls, data: Any):
        if isinstance(data, dict) and isinstance(data.get("predicates"), list):
            data["predicates"] = [
                v if isinstance(v, ReferencePredicate) else ReferencePredicate(name=v) for v in data["predicates"]
            ]
        return data

    def to_advancement(self) -> dict:
        preds: list[PredicateLike] = []

        if self.scoreboard is not None:
            preds = [
                (ScoreValue(range=0, inverted=True) if self.value is None else self.value).to_predicate(self.scoreboard)
            ]
        preds = [*preds, *self.predicates]
        p = [_.model_dump() for _ in preds]
        return {
            "criteria": {
                "unlocked": {
                    "trigger": "minecraft:tick",
                    "conditions": {"player": p},
                }
            },
            "rewards": {"function": self.function},
        }

    def write_advancement(self, path: StrPath, *, indent: int = 4):
        p = pathlib.Path(path)
        a = self.to_advancement()
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(json.dumps(a, indent=indent))


class Result(SimpleModel):
    id: IdentifierLike
    count: int = 1
    components: dict | None = None


class Stonecutter(SimpleModel):
    type: Literal["minecraft:stonecutting"] = "minecraft:stonecutting"
    ingredient: Ingredient
    result: Result

    @classmethod
    def from_item(cls, item: IdentifierLike, result: IdentifierLike, count: int = 1) -> "Stonecutter":
        return cls(ingredient=item, result=Result(id=result, count=count))

    @classmethod
    def from_tag(cls, tag: AnyIdentifier, result: IdentifierLike, count: int = 1) -> "Stonecutter":
        _tag: TagLike = tag if tag.startswith("#") else f"#{tag}"
        return cls(ingredient=_tag, result=Result(id=result, count=count))

    @classmethod
    def from_items(cls, items: list[IdentifierLike], result: IdentifierLike, count: int = 1) -> "Stonecutter":
        return cls(ingredient=items, result=Result(id=result, count=count))


class LogType(SimpleModel):
    name: Annotated[str, StringConstraints(pattern=r"[a-z_]+")]
    type: Literal["log", "stem"] = "log"

    @property
    def _log(self) -> str:
        match self.type:
            case "log":
                return "log"
            case "stem":
                return "stem"

    @property
    def _wood(self) -> str:
        match self.type:
            case "log":
                return "wood"
            case "stem":
                return "hyphae"

    @property
    def log(self) -> Identifier:
        return f"{self.name}_{self._log}"

    @property
    def wood(self) -> Identifier:
        return f"{self.name}_{self._wood}"

    @property
    def stripped_log(self) -> Identifier:
        return f"stripped_{self.name}_{self._log}"

    @property
    def stripped_wood(self) -> Identifier:
        return f"stripped_{self.name}_{self._wood}"

    @property
    def logs(self) -> Identifier:
        return f"{self.log}s"

    @property
    def woods(self) -> Identifier:
        return f"micahcraft:generated/wood/{self.name}"

    @property
    def just_logs(self) -> Identifier:
        return f"micahcraft:generated/log/{self.name}"

    @property
    def boat(self) -> Identifier:
        match self.type:
            case "log":
                return f"{self.name}_boat"
            case "stem":
                return "minecraft:air"

    @property
    def fence(self) -> Identifier:
        return f"{self.name}_fence"

    @property
    def gate(self) -> Identifier:
        return f"{self.name}_fence_gate"

    @property
    def planks(self) -> Identifier:
        return f"{self.name}_planks"

    @property
    def slab(self) -> Identifier:
        return f"{self.name}_slab"

    @property
    def stairs(self) -> Identifier:
        return f"{self.name}_stairs"

    @property
    def trapdoor(self) -> Identifier:
        return f"{self.name}_trapdoor"

    @property
    def door(self) -> Identifier:
        return f"{self.name}_door"


class ColorableRecipe(SimpleModel):
    type: Literal["crafting_shaped"] = "crafting_shaped"
    pattern: list[str] = ["###", "#D#", "###"]
    key: dict[str, AnyIdentifier]
    result: Result


@dataclass
class Colorable:
    name: str
    tag: str

    def id(self, color: str) -> Identifier:
        return f"minecraft:{self.full(color)}"

    def full(self, color: str) -> str:
        return f"{color}_{self.name}"

    def recipe(self, color: str) -> ColorableRecipe:
        return ColorableRecipe(
            key={"#": f"#{self.tag}", "D": f"{color}_dye"}, result=Result(id=self.id(color), count=8)
        )
