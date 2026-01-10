from typing import TypeVar, Iterator, Iterable, Callable

T = TypeVar("T")


def where(xs: Iterable[T], predicate: Callable[[T], bool]) -> Iterator[T]:
    return (x for x in xs if predicate(x))


def require(d: dict[str, T], key: str) -> T:
    if key in d:
        return d[key]
    raise ValueError(f"Missing `{key}`!")


def one(xs: Iterable[T]) -> T:
    it = iter(xs)
    try:
        x = next(it)
        try:
            next(it)
            raise ValueError("Expected exactly one match, got multiple")
        except StopIteration:
            return x
    except StopIteration:
        raise ValueError("Expected exactly one match, got none")


def act(xs: Iterable[T], func: Callable[[T], None]) -> int:
    count = 0
    for x in xs:
        func(x)
        count += 1
    return count

def remove_where(xs: list[T], predicate: Callable[[T], bool]) -> list[T]:
    removed = [x for x in xs if predicate(x)]
    xs[:] = (x for x in xs if not predicate(x))
    return removed