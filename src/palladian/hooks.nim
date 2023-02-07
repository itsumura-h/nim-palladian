import std/jsffi
import std/json

{.emit:"""
import { useState, useEffect, useMemo } from 'https://cdn.jsdelivr.net/npm/preact@10.11.3/hooks/+esm';
import { signal, Signal } from 'https://cdn.jsdelivr.net/npm/@preact/signals@1.1.3/+esm';
""".}


type BoolStateSetter = proc(arg: bool)

proc boolUseState(arg: bool): JsObject {.importcpp: "useState(#)".}
proc useState*(arg: bool): (bool, BoolStateSetter) =
  let state = boolUseState(arg)
  let value = to(state[0], bool)
  let setter = to(state[1], BoolStateSetter)
  return (value, setter)


type IntStateSetter = proc(arg: int)

proc intUseState(arg: int): JsObject {.importcpp: "useState(#)".}
proc useState*(arg: int): (int, IntStateSetter) =
  let state = intUseState(arg)
  let value = to(state[0], int)
  let setter = to(state[1], IntStateSetter)
  return (value, setter)


type FloatStateSetter = proc(arg: float)

proc floatUseState(arg: float): JsObject {.importcpp: "useState(#)".}
proc useState*(arg: float): (float, FloatStateSetter) =
  let state = floatUseState(arg)
  let value = to(state[0], float)
  let setter = to(state[1], FloatStateSetter)
  return (value, setter)


type StrStateSetter = proc(arg: cstring)

proc strUseState(arg: cstring): JsObject {.importcpp: "useState(#)".}
proc useState*(arg: cstring): (cstring, StrStateSetter) =
  let state = strUseState(arg)
  let value = to(state[0], cstring)
  let setter = to(state[1], StrStateSetter)
  return (value, setter)


type ObjectStateSetter = proc(arg: JsObject)

proc objUseState(arg: JsObject): JsObject {.importcpp: "useState(#)".}
proc useState*(arg: JsObject): (JsObject, ObjectStateSetter) =
  let state = objUseState(arg)
  let value = to(state[0], JsObject)
  let setter = to(state[1], ObjectStateSetter)
  return (value, setter)


type JsonStateSetter = proc(arg: JsonNode)

proc objUseState(arg: JsonNode): JsObject {.importcpp: "useState(#)".}
proc useState*(arg: JsonNode): (JsonNode, JsonStateSetter) =
  let state = objUseState(arg)
  let value = to(state[0], JsonNode)
  let setter = to(state[1], JsonStateSetter)
  return (value, setter)




type States = cstring|int|float|bool

proc useEffect*(cb: proc()) {.importcpp: "useEffect(#)".}
  ## Side-Effects are at the heart of many modern Apps.
  ## Whether you want to fetch some data from an API or trigger an effect on the document, you'll find that the useEffect fits nearly all your needs.
  ## It's one of the main advantages of the hooks API, that it reshapes your mind into thinking in effects instead of a component's lifecycle.
proc useEffect*(cb: proc(), dependency:seq[States]) {.importcpp: "useEffect(#, #)".}
  ## With Dependancy
  ##
  ## Side-Effects are at the heart of many modern Apps.
  ## Whether you want to fetch some data from an API or trigger an effect on the document, you'll find that the useEffect fits nearly all your needs.
  ## It's one of the main advantages of the hooks API, that it reshapes your mind into thinking in effects instead of a component's lifecycle.

type BoolSignal = object of JsObject
type BoolSignalValue* = cstring
proc signal*(arg:bool):BoolSignal {.importcpp:"signal(#)".}
proc value*(self:BoolSignal):BoolSignalValue {.importcpp:"#.value".}
proc `value=`*(self:BoolSignal, val:bool) {.importcpp: "#.value = #".}

type IntSignal = object of JsObject
proc signal*(arg:int):IntSignal {.importcpp:"signal(#)".}
proc value*(self:IntSignal):int {.importcpp:"#.value".}
proc `value=`*(self:IntSignal, val:int) {.importcpp: "#.value = #".}

type FloatSignal = object of JsObject
type FloatSignalValue* = cstring
proc signal*(arg:float):FloatSignal {.importcpp:"signal(#)".}
proc value*(self:FloatSignal):FloatSignalValue {.importcpp:"#.value".}
proc `value=`*(self:FloatSignal, val:float) {.importcpp: "#.value = #".}

type StrSignal = object of JsObject
type StrSignalValue* = cstring
proc signal*(arg:cstring):StrSignal {.importcpp:"signal(#)".}
proc value*(self:StrSignal):StrSignalValue {.importcpp:"#.value".}
proc `value=`*(self:StrSignal, val:cstring) {.importcpp: "#.value = #".}
