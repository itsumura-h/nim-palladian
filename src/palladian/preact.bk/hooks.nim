import std/asyncjs
import std/dom
import std/jsffi
import std/json
import std/macros
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


macro useState*(arg:typedesc):untyped =
  let typ = arg.getTypeImpl
  result = quote do:
    type TypeStateSetter = proc(arg: `arg`)

    proc typeUseState(arg: `arg`):JsObject {.importjs: "useState(#)".}

    proc useStateImpl(arg: `arg`): (`arg`, TypeStateSetter) =
      let state = typeUseState(`arg`())
      let value = to(state[0], `arg`)
      let setter = to(state[1], TypeStateSetter)
      return (value, setter)
    useStateImpl(`arg`())
  # echo result.repr


type States* = cstring|int|float|bool|JsonNode|JsObject

proc useEffect*(cb: proc()) {.importjs: "useEffect(#)".}
proc useEffect*(cb: proc(), dependency: array) {.importjs: "useEffect(#, [])".}
proc useEffect*(cb: proc(), dependency: seq[States]) {.importjs: "useEffect(#, #)".}
proc useEffect*(cb: proc (): Future[void]) {.importjs: "useEffect(#)".}
proc useEffect*(cb: proc (): Future[void], dependency: array) {.importjs: "useEffect(#, [])".}
proc useEffect*(cb: proc (): Future[void], dependency: seq[States]) {.importjs: "useEffect(#, #)".}

proc useLayoutEffect*(cb: proc()) {.importjs: "useLayoutEffect(#)".}
proc useLayoutEffect*(cb: proc(), dependency: array) {.importjs: "useLayoutEffect(#, [])".}
proc useLayoutEffect*(cb: proc(), dependency: seq[States]) {.importjs: "useLayoutEffect(#, #)".}
proc useLayoutEffect*(cb: proc (): Future[void]) {.importjs: "useLayoutEffect(#)".}
proc useLayoutEffect*(cb: proc (): Future[void], dependency: array) {.importjs: "useLayoutEffect(#, [])".}
proc useLayoutEffect*(cb: proc (): Future[void], dependency: seq[States]) {.importjs: "useLayoutEffect(#, #)".}


proc useMemo*(cb: proc():bool):bool {.importjs: "useMemo(#)".}
proc useMemo*(cb: proc():bool, dependency: array):bool {.importjs: "useMemo(#, [])".}
proc useMemo*(cb: proc():bool, dependency: seq[States]):bool {.importjs: "useMemo(#, #)".}

proc useMemo*(cb: proc():int):int {.importjs: "useMemo(#)".}
proc useMemo*(cb: proc():int, dependency: array):int {.importjs: "useMemo(#, [])".}
proc useMemo*(cb: proc():int, dependency: seq[States]):int {.importjs: "useMemo(#, #)".}

proc useMemo*(cb: proc():float):float {.importjs: "useMemo(#)".}
proc useMemo*(cb: proc():float, dependency: array):float {.importjs: "useMemo(#, [])".}
proc useMemo*(cb: proc():float, dependency: seq[States]):float {.importjs: "useMemo(#, #)".}

proc useMemo*(cb: proc():cstring):cstring {.importjs: "useMemo(#)".}
proc useMemo*(cb: proc():cstring, dependency: array):cstring {.importjs: "useMemo(#, [])".}
proc useMemo*(cb: proc():cstring, dependency: seq[States]):cstring {.importjs: "useMemo(#, #)".}

proc useMemo*(cb: proc():JsObject):JsObject {.importjs: "useMemo(#)".}
proc useMemo*(cb: proc():JsObject, dependency: array):JsObject {.importjs: "useMemo(#, [])".}
proc useMemo*(cb: proc():JsObject, dependency: seq[States]):JsObject {.importjs: "useMemo(#, #)".}


proc useCallback*(cb: proc()):(proc()) {.importjs: "useCallback(#)", discardable.}
proc useCallback*(cb: proc(), dependency: array):(proc()) {.importjs: "useCallback(#, [])", discardable.}
proc useCallback*(cb: proc(), dependency: seq[States]):(proc()) {.importjs: "useCallback(#, #)", discardable.}


type RefObject = object
  current*:Element

proc useRef*():RefObject {.importjs:"useRef(null)".}


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
