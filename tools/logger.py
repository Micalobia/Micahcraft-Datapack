from beet import Context

RESET = "\x1b[0m"
RED = "\x1b[31m"
YELLOW = "\x1b[33m"
GRAY = "\x1b[90m"


class LoggerFailFastError(Exception):
    logged: bool

    def __init__(self, logged: bool = False):
        super().__init__("fail-fast")
        self.logged = logged


class Logger:
    _paths: list[str]
    _scope_depths: list[int]

    def __init__(self, ctx: Context):
        self._paths = []
        self._scope_depths = []

    def push(self, path: str, swallow: bool = True) -> _PushCtx:
        depth_before = len(self._paths)
        self._paths.append(path)
        return Logger._PushCtx(self, depth_before, swallow)

    def pop(self) -> str:
        return self._paths.pop()

    def swap(self, path: str) -> str:
        old = self._paths[-1]
        self._paths[-1] = path
        return old

    @property
    def _prefix(self) -> str:
        return f"({'.'.join(self._paths)}) " if self._paths else ""

    def info(self, msg: str):
        print(f"[INFO] {self._prefix}{msg}")

    def warn(self, msg: str):
        print(f"{YELLOW}[WARNING]{RESET} {self._prefix}{msg}")

    def error(self, msg: str):
        print(f"{RED}[ERROR] {self._prefix}{msg}{RESET}")

    def __enter__(self) -> Logger:
        self._scope_depths.append(len(self._paths))
        return self

    def __exit__(self, exc_type, exc, tb) -> bool:
        depth_before = self._scope_depths.pop() if self._scope_depths else len(self._paths)
        try:
            if exc_type is None:
                return False
            if issubclass(exc_type, LoggerFailFastError):
                assert isinstance(exc, LoggerFailFastError)
                if not exc.logged:
                    cause = exc.__cause__
                    if exc.__cause__ is not None:
                        self.error(f"{type(cause).__name__}: {cause}")
                    else:
                        self.error(f"{exc_type.__name__}: {exc}")
                    exc.logged = True
                return False
            if issubclass(exc_type, Exception):
                self.error(f"{exc_type.__name__}: {exc}")
                return True
            return False
        finally:
            if len(self._paths) > depth_before:
                del self._paths[depth_before:]

    class _PushCtx:
        _logger: Logger
        _depth_before: int
        _swallow: bool

        def __init__(self, logger: Logger, depth_before: int, swallow: bool):
            self._logger = logger
            self._depth_before = depth_before
            self._swallow = swallow

        def __enter__(self) -> Logger:
            return self._logger

        def __exit__(self, exc_type, exc, tb) -> bool:
            try:
                if exc_type is None:
                    return False
                if issubclass(exc_type, LoggerFailFastError):
                    assert isinstance(exc, LoggerFailFastError)
                    if not exc.logged:
                        cause = exc.__cause__
                        if exc.__cause__ is not None:
                            self._logger.error(f"{type(cause).__name__}: {cause}")
                        else:
                            self._logger.error(f"{exc_type.__name__}: {exc}")
                        exc.logged = True
                    return False
                if not issubclass(exc_type, Exception):
                    return False
                self._logger.error(f"{exc_type.__name__}: {exc}")
                if self._swallow:
                    return True
                raise LoggerFailFastError(True) from exc
            finally:
                if len(self._logger._paths) > self._depth_before:
                    del self._logger._paths[self._depth_before :]
