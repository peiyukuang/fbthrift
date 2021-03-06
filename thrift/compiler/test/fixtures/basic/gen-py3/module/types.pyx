#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libcpp.memory cimport shared_ptr, make_shared, unique_ptr, make_unique
from libcpp.string cimport string
from libcpp cimport bool as cbool
from libcpp.iterator cimport inserter as cinserter
from cpython cimport bool as pbool
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t, uint32_t
from cython.operator cimport dereference as deref, preincrement as inc
import thrift.py3.types
cimport thrift.py3.types
cimport thrift.py3.exceptions
from thrift.py3.types import NOTSET as __NOTSET
from thrift.py3.types cimport translate_cpp_enum_to_python
cimport thrift.py3.std_libcpp as std_libcpp
from thrift.py3.serializer cimport IOBuf
from thrift.py3.serializer import Protocol
cimport thrift.py3.serializer as serializer
from thrift.py3.serializer import deserialize, serialize
from folly.optional cimport cOptional

import sys
import itertools
from collections import Sequence, Set, Mapping, Iterable
from enum import Enum
import warnings
import builtins as _builtins


class MyEnum(Enum):
    MyValue1 = <int> (MyEnum__MyValue1)
    MyValue2 = <int> (MyEnum__MyValue2)

    __hash__ = Enum.__hash__

    def __eq__(self, other):
        if not isinstance(other, self.__class__):
            warnings.warn(f"comparison not supported between instances of {type(self)} and {type(other)}", RuntimeWarning, stacklevel=2)
            return False
        return self.value == other.value


cdef cMyEnum MyEnum_to_cpp(value):
    if value == MyEnum.MyValue1:
        return MyEnum__MyValue1
    elif value == MyEnum.MyValue2:
        return MyEnum__MyValue2


cdef cMyStruct _MyStruct_defaults = cMyStruct()

cdef class MyStruct(thrift.py3.types.Struct):

    def __init__(
        MyStruct self, *,
        MyIntField=None,
        str MyStringField=None,
        MyDataItem MyDataField=None
    ):
        self._cpp_obj = move(MyStruct._make_instance(
          NULL,
          MyIntField,
          MyStringField,
          MyDataField,
        ))

    def __call__(
        MyStruct self,
        MyIntField=__NOTSET,
        MyStringField=__NOTSET,
        MyDataField=__NOTSET
    ):
        changes = any((
            MyIntField is not __NOTSET,

            MyStringField is not __NOTSET,

            MyDataField is not __NOTSET,
        ))

        if not changes:
            return self

        if None is not MyIntField is not __NOTSET:
            if not isinstance(MyIntField, int):
                raise TypeError(f'MyIntField is not a { int !r}.')

        if None is not MyStringField is not __NOTSET:
            if not isinstance(MyStringField, str):
                raise TypeError(f'MyStringField is not a { str !r}.')

        if None is not MyDataField is not __NOTSET:
            if not isinstance(MyDataField, MyDataItem):
                raise TypeError(f'MyDataField is not a { MyDataItem !r}.')

        inst = <MyStruct>MyStruct.__new__(MyStruct)
        inst._cpp_obj = move(MyStruct._make_instance(
          self._cpp_obj.get(),
          MyIntField,
          MyStringField,
          MyDataField,
        ))
        return inst

    @staticmethod
    cdef unique_ptr[cMyStruct] _make_instance(
        cMyStruct* base_instance,
        object MyIntField,
        object MyStringField,
        object MyDataField
    ) except *:
        cdef unique_ptr[cMyStruct] c_inst
        if base_instance:
            c_inst = make_unique[cMyStruct](deref(base_instance))
        else:
            c_inst = make_unique[cMyStruct]()

        if base_instance:
            # Convert None's to default value. (or unset)
            if MyIntField is None:
                deref(c_inst).MyIntField = _MyStruct_defaults.MyIntField
                deref(c_inst).__isset.MyIntField = False
                pass
            elif MyIntField is __NOTSET:
                MyIntField = None

            if MyStringField is None:
                deref(c_inst).MyStringField = _MyStruct_defaults.MyStringField
                deref(c_inst).__isset.MyStringField = False
                pass
            elif MyStringField is __NOTSET:
                MyStringField = None

            if MyDataField is None:
                deref(c_inst).MyDataField = _MyStruct_defaults.MyDataField
                deref(c_inst).__isset.MyDataField = False
                pass
            elif MyDataField is __NOTSET:
                MyDataField = None

        if MyIntField is not None:
            deref(c_inst).MyIntField = MyIntField
            deref(c_inst).__isset.MyIntField = True
        if MyStringField is not None:
            deref(c_inst).MyStringField = MyStringField.encode('UTF-8')
            deref(c_inst).__isset.MyStringField = True
        if MyDataField is not None:
            deref(c_inst).MyDataField = deref((<MyDataItem?> MyDataField)._cpp_obj)
            deref(c_inst).__isset.MyDataField = True
        # in C++ you don't have to call move(), but this doesn't translate
        # into a C++ return statement, so you do here
        return move_unique(c_inst)

    def __iter__(self):
        yield 'MyIntField', self.MyIntField
        yield 'MyStringField', self.MyStringField
        yield 'MyDataField', self.MyDataField

    def __bool__(self):
        return True or True or True

    @staticmethod
    cdef create(shared_ptr[cMyStruct] cpp_obj):
        inst = <MyStruct>MyStruct.__new__(MyStruct)
        inst._cpp_obj = cpp_obj
        return inst

    @property
    def MyIntField(self):

        return self._cpp_obj.get().MyIntField

    @property
    def MyStringField(self):

        return (<bytes>self._cpp_obj.get().MyStringField).decode('UTF-8')

    @property
    def MyDataField(self):

        if self.__MyDataField is None:
            self.__MyDataField = MyDataItem.create(make_shared[cMyDataItem](deref(self._cpp_obj).MyDataField))
        return self.__MyDataField


    def __hash__(MyStruct self):
        if not self.__hash:
            self.__hash = hash((
            self.MyIntField,
            self.MyStringField,
            self.MyDataField,
            ))
        return self.__hash

    def __repr__(MyStruct self):
        return f'MyStruct(MyIntField={repr(self.MyIntField)}, MyStringField={repr(self.MyStringField)}, MyDataField={repr(self.MyDataField)})'
    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(self, other))
        if not (
                isinstance(self, MyStruct) and
                isinstance(other, MyStruct)):
            if cop == 2:  # different types are never equal
                return False
            else:         # different types are always notequal
                return True

        cdef cMyStruct cself = deref((<MyStruct>self)._cpp_obj)
        cdef cMyStruct cother = deref((<MyStruct>other)._cpp_obj)
        cdef cbool cmp = cself == cother
        if cop == 2:
            return cmp
        return not cmp

    cdef bytes _serialize(MyStruct self, proto):
        cdef string c_str
        if proto is Protocol.COMPACT:
            serializer.CompactSerialize[cMyStruct](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.BINARY:
            serializer.BinarySerialize[cMyStruct](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.JSON:
            serializer.JSONSerialize[cMyStruct](deref(self._cpp_obj.get()), &c_str)
        return <bytes> c_str

    cdef uint32_t _deserialize(MyStruct self, const IOBuf* buf, proto):
        cdef uint32_t needed
        self._cpp_obj = make_shared[cMyStruct]()
        if proto is Protocol.COMPACT:
            needed = serializer.CompactDeserialize[cMyStruct](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.BINARY:
            needed = serializer.BinaryDeserialize[cMyStruct](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.JSON:
            needed = serializer.JSONDeserialize[cMyStruct](buf, deref(self._cpp_obj.get()))
        return needed

    def __reduce__(self):
        return (deserialize, (MyStruct, serialize(self)))


cdef cMyDataItem _MyDataItem_defaults = cMyDataItem()

cdef class MyDataItem(thrift.py3.types.Struct):

    def __init__(
        MyDataItem self, *
    ):
        self._cpp_obj = move(MyDataItem._make_instance(
          NULL,
        ))

    def __call__(
        MyDataItem self
    ):
        changes = any((        ))

        if not changes:
            return self
        inst = <MyDataItem>MyDataItem.__new__(MyDataItem)
        inst._cpp_obj = move(MyDataItem._make_instance(
          self._cpp_obj.get(),
        ))
        return inst

    @staticmethod
    cdef unique_ptr[cMyDataItem] _make_instance(
        cMyDataItem* base_instance
    ) except *:
        cdef unique_ptr[cMyDataItem] c_inst
        if base_instance:
            c_inst = make_unique[cMyDataItem](deref(base_instance))
        else:
            c_inst = make_unique[cMyDataItem]()

        if base_instance:
            # Convert None's to default value. (or unset)
            pass
        # in C++ you don't have to call move(), but this doesn't translate
        # into a C++ return statement, so you do here
        return move_unique(c_inst)

    def __iter__(self):
        return iter(())

    def __bool__(self):
        return True

    @staticmethod
    cdef create(shared_ptr[cMyDataItem] cpp_obj):
        inst = <MyDataItem>MyDataItem.__new__(MyDataItem)
        inst._cpp_obj = cpp_obj
        return inst


    def __hash__(MyDataItem self):
        if not self.__hash:
            self.__hash = hash((
            type(self)   # Hash the class there are no fields
            ))
        return self.__hash

    def __repr__(MyDataItem self):
        return f'MyDataItem()'
    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(self, other))
        if not (
                isinstance(self, MyDataItem) and
                isinstance(other, MyDataItem)):
            if cop == 2:  # different types are never equal
                return False
            else:         # different types are always notequal
                return True

        cdef cMyDataItem cself = deref((<MyDataItem>self)._cpp_obj)
        cdef cMyDataItem cother = deref((<MyDataItem>other)._cpp_obj)
        cdef cbool cmp = cself == cother
        if cop == 2:
            return cmp
        return not cmp

    cdef bytes _serialize(MyDataItem self, proto):
        cdef string c_str
        if proto is Protocol.COMPACT:
            serializer.CompactSerialize[cMyDataItem](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.BINARY:
            serializer.BinarySerialize[cMyDataItem](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.JSON:
            serializer.JSONSerialize[cMyDataItem](deref(self._cpp_obj.get()), &c_str)
        return <bytes> c_str

    cdef uint32_t _deserialize(MyDataItem self, const IOBuf* buf, proto):
        cdef uint32_t needed
        self._cpp_obj = make_shared[cMyDataItem]()
        if proto is Protocol.COMPACT:
            needed = serializer.CompactDeserialize[cMyDataItem](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.BINARY:
            needed = serializer.BinaryDeserialize[cMyDataItem](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.JSON:
            needed = serializer.JSONDeserialize[cMyDataItem](buf, deref(self._cpp_obj.get()))
        return needed

    def __reduce__(self):
        return (deserialize, (MyDataItem, serialize(self)))


