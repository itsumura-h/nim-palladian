import std/asyncjs
import std/jsffi
import std/json
import ./importlibs

importPreactHooks()

type BoolStateSetter = proc(arg: bool)

proc boolUseState(arg: bool): JsObject {.importjs: "useState(#)".}
proc useState*(arg: bool): (bool, BoolStateSetter) =
  let state = boolUseState(arg)
  let value = to(state[0], bool)
  let setter = to(state[1], BoolStateSetter)
  return (value, setter)


type IntStateSetter = proc(arg: int)

proc intUseState(arg: int): JsObject {.importjs: "useState(#)".}
proc useState*(arg: int): (int, IntStateSetter) =
  let state = intUseState(arg)
  let value = to(state[0], int)
  let setter = to(state[1], IntStateSetter)
  return (value, setter)


type FloatStateSetter = proc(arg: float)

proc floatUseState(arg: float): JsObject {.importjs: "useState(#)".}
proc useState*(arg: float): (float, FloatStateSetter) =
  let state = floatUseState(arg)
  let value = to(state[0], float)
  let setter = to(state[1], FloatStateSetter)
  return (value, setter)


type StrStateSetter = proc(arg: cstring)

proc strUseState(arg: cstring): JsObject {.importjs: "useState(#)".}
proc useState*(arg: cstring): (cstring, StrStateSetter) =
  let state = strUseState(arg)
  let value = to(state[0], cstring)
  let setter = to(state[1], StrStateSetter)
  return (value, setter)


type ObjectStateSetter = proc(arg: JsObject)

proc objUseState(arg: JsObject): JsObject {.importjs: "useState(#)".}
proc useState*(arg: JsObject): (JsObject, ObjectStateSetter) =
  let state = objUseState(arg)
  let value = to(state[0], JsObject)
  let setter = to(state[1], ObjectStateSetter)
  return (value, setter)


type JsonStateSetter = proc(arg: JsonNode)

proc jsonUseState(arg: JsonNode): JsObject {.importjs: "useState(#)".}
proc useState*(arg: JsonNode): (JsonNode, JsonStateSetter) =
  let state = jsonUseState(arg)
  let value = to(state[0], JsonNode)
  let setter = to(state[1], JsonStateSetter)
  return (value, setter)


type States* = cstring|int|float|bool|JsonNode

proc useEffect*(cb: proc()) {.importjs: "useEffect(#)".}
  ## Side-Effects are at the heart of many modern Apps.
  ## Whether you want to fetch some data from an API or trigger an effect on the document, you'll find that the useEffect fits nearly all your needs.
  ## It's one of the main advantages of the hooks API, that it reshapes your mind into thinking in effects instead of a component's lifecycle.
proc useEffect*(cb: proc(), dependency: array) {.importjs: "useEffect(#, [])".}
proc useEffect*(cb: proc(), dependency: seq[States]) {.importjs: "useEffect(#, #)".}
  ## With Dependancy
  ##
  ## Side-Effects are at the heart of many modern Apps.
  ## Whether you want to fetch some data from an API or trigger an effect on the document, you'll find that the useEffect fits nearly all your needs.
  ## It's one of the main advantages of the hooks API, that it reshapes your mind into thinking in effects instead of a component's lifecycle.
proc useEffect*(cb: proc (): Future[void]) {.importjs: "useEffect(#)".}
proc useEffect*(cb: proc (): Future[void], dependency: array) {.importjs: "useEffect(#, [])".}
proc useEffect*(cb: proc (): Future[void], dependency: seq[States]) {.importjs: "useEffect(#, #)".}

type BoolSignal = object of JsObject
type BoolSignalValue* = bool
proc signal*(arg: bool): BoolSignal {.importjs: "signal(#)".}
proc value*(self: BoolSignal): BoolSignalValue {.importjs: "#.value".}
proc `value=`*(self: BoolSignal, val: bool) {.importjs: "#.value = #".}

type IntSignal = object of JsObject
proc signal*(arg: int): IntSignal {.importjs: "signal(#)".}
proc value*(self: IntSignal): int {.importjs: "#.value".}
proc `value=`*(self: IntSignal, val: int) {.importjs: "#.value = #".}

type FloatSignal = object of JsObject
type FloatSignalValue* = float
proc signal*(arg: float): FloatSignal {.importjs: "signal(#)".}
proc value*(self: FloatSignal): FloatSignalValue {.importjs: "#.value".}
proc `value=`*(self: FloatSignal, val: float) {.importjs: "#.value = #".}

type StrSignal = object of JsObject
type StrSignalValue* = cstring
proc signal*(arg: cstring): StrSignal {.importjs: "signal(#)".}
proc value*(self: StrSignal): StrSignalValue {.importjs: "#.value".}
proc `value=`*(self: StrSignal, val: cstring) {.importjs: "#.value = #".}

type ObjSignal = object of JsObject
type ObjSignalValue* = JsObject
proc signal*(arg: JsObject): ObjSignal {.importjs: "signal(#)".}
proc value*(self: ObjSignal): ObjSignalValue {.importjs: "#.value".}
proc `value=`*(self: ObjSignal, val: JsObject) {.importjs: "#.value = #".}

type JsonSignal = object of JsObject
type JsonSignalValue* = JsonNode
proc signal*(arg: JsonNode): JsonSignal {.importjs: "signal(#)".}
proc value*(self: JsonSignal): JsonSignalValue {.importjs: "#.value".}
proc `value=`*(self: JsonSignal, val: JsonNode) {.importjs: "#.value = #".}
