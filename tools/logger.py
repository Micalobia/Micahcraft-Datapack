import os
from typing import Any

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

    def info(self, msg: Any):
        print(f"[INFO] {self._prefix}{msg}")

    def warn(self, msg: Any):
        print(f"{YELLOW}[WARNING]{RESET} {self._prefix}{msg}")

    def error(self, msg: Any):
        print(f"{RED}[ERROR] {self._prefix}{msg}{RESET}")

    def __enter__(self) -> Logger:
        self._scope_depths.append(len(self._paths))
        return self

    def __exit__(self, exc_type, exc, tb) -> bool:
        depth_before = self._scope_depths.pop() if self._scope_depths else len(self._paths)

        def _where(tbx) -> str:
            if tbx is None:
                return ""
            last = tbx
            while last.tb_next is not None:
                last = last.tb_next
            frame = last.tb_frame
            filename = os.path.basename(frame.f_code.co_filename)
            func = frame.f_code.co_name
            return f"{filename}:{last.tb_lineno} in {func} — "

        try:
            if exc_type is None:
                return False

            if issubclass(exc_type, LoggerFailFastError):
                assert isinstance(exc, LoggerFailFastError)
                if not exc.logged:
                    cause = exc.__cause__
                    if cause is not None:
                        loc = _where(getattr(cause, "__traceback__", None))
                        self.error(f"{loc}{type(cause).__name__}: {cause}")
                    else:
                        loc = _where(tb)
                        self.error(f"{loc}{exc_type.__name__}: {exc}")
                    exc.logged = True
                return False

            if issubclass(exc_type, Exception):
                loc = _where(tb)
                self.error(f"{loc}{exc_type.__name__}: {exc}")
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
            def _where(tbx) -> str:
                if tbx is None:
                    return ""
                last = tbx
                while last.tb_next is not None:
                    last = last.tb_next
                frame = last.tb_frame
                filename = os.path.basename(frame.f_code.co_filename)
                func = frame.f_code.co_name
                return f"{filename}:{last.tb_lineno} in {func} — "

            try:
                if exc_type is None:
                    return False

                if issubclass(exc_type, LoggerFailFastError):
                    assert isinstance(exc, LoggerFailFastError)
                    if not exc.logged:
                        cause = exc.__cause__
                        if cause is not None:
                            loc = _where(getattr(cause, "__traceback__", None))
                            self._logger.error(f"{loc}{type(cause).__name__}: {cause}")
                        else:
                            loc = _where(tb)
                            self._logger.error(f"{loc}{exc_type.__name__}: {exc}")
                        exc.logged = True
                    return False

                if not issubclass(exc_type, Exception):
                    return False

                loc = _where(tb)
                self._logger.error(f"{loc}{exc_type.__name__}: {exc}")

                if self._swallow:
                    return True
                raise LoggerFailFastError(True) from exc
            finally:
                if len(self._logger._paths) > self._depth_before:
                    del self._logger._paths[self._depth_before :]
