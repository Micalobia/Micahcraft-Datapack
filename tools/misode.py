from beet import Context
import json
from pathlib import Path
from urllib.request import urlopen
from typing import cast


class Misode:
    _version: str
    _item_ids: list[str] | None

    def __init__(self, ctx: Context):
        self._version = ctx.minecraft_version
        self._item_ids = None

    def item_ids(self) -> list[str]:
        if self._item_ids is not None:
            return self._item_ids
        else:
            url = f"https://raw.githubusercontent.com/misode/mcmeta/refs/tags/{self._version}-registries/item/data.min.json"
            with urlopen(url) as r:
                self._item_ids = cast(list[str], json.load(r))
            return self._item_ids
