#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

import typing as _typing
from thrift.py3.server import RequestContext, ServiceInterface
from abc import abstractmethod

import module.types as _module_types

_RaiserInterfaceT = _typing.TypeVar('_RaiserInterfaceT', bound='RaiserInterface')


class RaiserInterface(
    ServiceInterface
):

    @staticmethod
    def pass_context_doBland(
        fn: _typing.Callable[[_RaiserInterfaceT, RequestContext],_typing.Awaitable[None]]
    ) -> _typing.Callable[[_RaiserInterfaceT],_typing.Awaitable[None]]: ...

    @abstractmethod
    async def doBland(
        self
    ) -> None: ...

    @staticmethod
    def pass_context_doRaise(
        fn: _typing.Callable[[_RaiserInterfaceT, RequestContext],_typing.Awaitable[None]]
    ) -> _typing.Callable[[_RaiserInterfaceT],_typing.Awaitable[None]]: ...

    @abstractmethod
    async def doRaise(
        self
    ) -> None: ...

    @staticmethod
    def pass_context_get200(
        fn: _typing.Callable[[_RaiserInterfaceT, RequestContext],_typing.Awaitable[str]]
    ) -> _typing.Callable[[_RaiserInterfaceT],_typing.Awaitable[str]]: ...

    @abstractmethod
    async def get200(
        self
    ) -> str: ...

    @staticmethod
    def pass_context_get500(
        fn: _typing.Callable[[_RaiserInterfaceT, RequestContext],_typing.Awaitable[str]]
    ) -> _typing.Callable[[_RaiserInterfaceT],_typing.Awaitable[str]]: ...

    @abstractmethod
    async def get500(
        self
    ) -> str: ...

