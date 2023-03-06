import std/asyncjs
import std/dom
import std/jsffi
import std/macros

when defined(doc):
  import ./palladian/cli/palladian_cli

{.emit:"""
import {h, render} from 'https://esm.sh/preact@10.12.1';
import htm from 'https://esm.sh/htm@3.1.1';
import {
  useState,
  useEffect,
  useLayoutEffect,
  useMemo,
  useRef,
  useCallback
} from 'https://esm.sh/preact@10.12.1/hooks';
import { signal, Signal } from 'https://esm.sh/@preact/signals@1.1.3?deps=preact@10.12.1';
import { Router } from 'https://esm.sh/preact-router@4.1.0?deps=preact@10.12.1';
import { Link } from 'https://esm.sh/preact-router@4.1.0/match?deps=preact@10.12.1';
const html = htm.bind(h);
""".}

type Component* = JsObject

proc html*(arg:cstring):Component {.importjs:"eval('html`' + # + '`')".}
template html*(arg:string):Component = html(arg.cstring)


{.emit: """
function renderApp(component, dom){
  render(html``<${component} />``, dom)
}
""".}
proc renderApp*(component: proc():Component, dom: Element) {.importjs: "renderApp(#, #)".}


type ComponentProps* = JsObject
proc children*(self:ComponentProps):cstring {.importjs:"#.children".}


proc fmt*(arg:cstring):cstring {.importjs: "#".}
  ## for just easy to look JSX in IDE with no effect.
template fmt*(arg:string):cstring = fmt(arg.cstring)
  ## for just easy to look JSX in IDE with no effect.


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


type States* = cstring|int|float|bool|JsObject
type CleanUpCallback* = proc()

proc useEffect*(cb: proc()) {.importjs: "useEffect(#)".}
proc useEffect*(cb: proc(), dependency: array) {.importjs: "useEffect(#, [])".}
proc useEffect*(cb: proc(), dependency: seq[States]) {.importjs: "useEffect(#, #)".}
proc useEffect*(cb: proc(): Future[void]) {.importjs: "useEffect(#)".}
proc useEffect*(cb: proc(): Future[void], dependency: array) {.importjs: "useEffect(#, [])".}
proc useEffect*(cb: proc(): Future[void], dependency: seq[States]) {.importjs: "useEffect(#, #)".}
proc useEffect*(cb: proc(): CleanUpCallback) {.importjs: "useEffect(#)".}
proc useEffect*(cb: proc(): CleanUpCallback, dependency: array) {.importjs: "useEffect(#, [])".}
proc useEffect*(cb: proc(): CleanUpCallback, dependency: seq[States]) {.importjs: "useEffect(#, #)".}


proc useLayoutEffect*(cb: proc()) {.importjs: "useLayoutEffect(#)".}
proc useLayoutEffect*(cb: proc(), dependency: array) {.importjs: "useLayoutEffect(#, [])".}
proc useLayoutEffect*(cb: proc(), dependency: seq[States]) {.importjs: "useLayoutEffect(#, #)".}
proc useLayoutEffect*(cb: proc(): Future[void]) {.importjs: "useLayoutEffect(#)".}
proc useLayoutEffect*(cb: proc(): Future[void], dependency: array) {.importjs: "useLayoutEffect(#, [])".}
proc useLayoutEffect*(cb: proc(): Future[void], dependency: seq[States]) {.importjs: "useLayoutEffect(#, #)".}
proc useLayoutEffect*(cb: proc(): CleanUpCallback) {.importjs: "useLayoutEffect(#)".}
proc useLayoutEffect*(cb: proc(): CleanUpCallback, dependency: array) {.importjs: "useLayoutEffect(#, [])".}
proc useLayoutEffect*(cb: proc(): CleanUpCallback, dependency: seq[States]) {.importjs: "useLayoutEffect(#, #)".}


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


type RefObject* = object
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


# https://gist.github.com/developit/af2a4488de152a84bff83e035bb8afc1
{.emit:"""
let Item = ({ v, k, f }) => f(v, k);

export function For({ each, children: f }) {
  let c = useMemo(() => new Map, []);
  // let value = each.value;
  let value;
  if(typeof each === "object"){
    if("value" in each){ // Signal
      value = each.value
    }else{ // JsObject
      value = each
    }
  }else if(typeof each === "function"){
    value = each()
  }else{
    value = each
  }
  if (!Array.isArray(value)) return html``<${Item} v=${value} f=${f} />``;
  return value.map((v, k, x) => c.get(v) || (c.set(v, x = html``<${Item} v=${v} k=${k} f=${f} />``), x));
}

Signal.prototype.map = function(fn) { return html``<${For} each=${this} children=${fn} />`` };


export function Show({ when, fallback, children: f }) {
  let v;
  if(typeof when === "object"){
    if("value" in when){ // Signal
      v = when.value
    }else{ // JsObject
      v = when
    }
  }else if(typeof when === "function"){
    v = when()
  }else{
    v = when
  }
  return Boolean(v) ? typeof f === 'function' ? html``<${Item} v=${v} f=${f} />`` : f : fallback;
}
""".}


proc len*(arg:JsObject):int {.importjs:"Object.keys(#).length".}
