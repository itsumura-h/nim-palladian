import std/asyncjs
import std/dom
import std/jsffi
import std/json

{.emit:"""
import {
  createSignal,
  createEffect,
  createRenderEffect,
  createMemo,
  onCleanup,
  Show,
  For
} from "https://esm.sh/solid-js@1.6.11";
import {render} from "https://esm.sh/solid-js@1.6.11/web";
import { Router, Routes, Route, A } from "https://esm.sh/@solidjs/router@0.7.0?deps=solid-js@1.6.11";
import html from "https://esm.sh/solid-js@1.6.11/html";
""".}

type Component* = JsObject

proc html*(arg:cstring):Component {.importjs:"eval('html`' + # + '`')".}
template html*(arg:string):Component = html(arg.cstring)


{.emit: """
function renderApp(component, dom){
  render(component, dom)
}
""".}
proc renderApp*(component: proc():Component, dom: Element) {.importjs: "renderApp(#, #)".}
proc render*(component: proc():Component, dom: Element) {.importjs: "render(#, #)".}

type ComponentProps* = JsObject
proc children*(self:ComponentProps):cstring {.importjs:"#.children".}


proc fmt*(arg:cstring):cstring {.importjs: "#".}
  ## for just easy to look JSX in IDE with no effect.
template fmt*(arg:string):cstring = fmt(arg.cstring)
  ## for just easy to look JSX in IDE with no effect.


type BoolSignalGetter = proc():bool
type BoolSignalSetter = proc(arg:bool)
proc intCreateSignal(arg: bool): JsObject {.importjs: "createSignal(#)".}
proc createSignal*(arg: bool): (BoolSignalGetter, BoolSignalSetter) =
  let state = intCreateSignal(arg)
  let getter = to(state[0], BoolSignalGetter)
  let setter = to(state[1], BoolSignalSetter)
  return (getter, setter)

type IntSignalGetter = proc():int
type IntSignalSetter = proc(arg:int)
proc intCreateSignal(arg: int): JsObject {.importjs: "createSignal(#)".}
proc createSignal*(arg: int): (IntSignalGetter, IntSignalSetter) =
  let state = intCreateSignal(arg)
  let getter = to(state[0], IntSignalGetter)
  let setter = to(state[1], IntSignalSetter)
  return (getter, setter)

type FloatSignalGetter = proc():float
type FloatSignalSetter = proc(arg:float)
proc floatCreateSignal(arg: float): JsObject {.importjs: "createSignal(#)".}
proc createSignal*(arg: float): (FloatSignalGetter, FloatSignalSetter) =
  let state = floatCreateSignal(arg)
  let getter = to(state[0], FloatSignalGetter)
  let setter = to(state[1], FloatSignalSetter)
  return (getter, setter)

type StringSignalGetter = proc():cstring
type StringSignalSetter = proc(arg:cstring)
proc stringCreateSignal(arg: cstring): JsObject {.importjs: "createSignal(#)".}
proc createSignal*(arg: cstring): (StringSignalGetter, StringSignalSetter) =
  let state = stringCreateSignal(arg)
  let getter = to(state[0], StringSignalGetter)
  let setter = to(state[1], StringSignalSetter)
  return (getter, setter)

type JsObjectSignalGetter = proc():JsObject
type JsObjectSignalSetter = proc(arg:JsObject)
proc stringCreateSignal(arg: JsObject): JsObject {.importjs: "createSignal(#)".}
proc createSignal*(arg: JsObject): (JsObjectSignalGetter, JsObjectSignalSetter) =
  let state = stringCreateSignal(arg)
  let getter = to(state[0], JsObjectSignalGetter)
  let setter = to(state[1], JsObjectSignalSetter)
  return (getter, setter)


type States* = cstring|int|float|bool|JsonNode|JsObject

proc createEffect*(arg:proc()) {.importjs:"createEffect(#)".}
proc createEffect*(cb: proc (): Future[void]) {.importjs: "createEffect(#)".}

proc createRenderEffect*(arg:proc()) {.importjs:"createRenderEffect(#)".}
proc createRenderEffect*(cb: proc (): Future[void]) {.importjs: "createRenderEffect(#)".}


proc createMemo*(cb: (proc():bool)):(proc():bool) {.importjs: "createMemo(#)".}
proc createMemo*(cb: (proc():int)):(proc():int) {.importjs: "createMemo(#)".}
proc createMemo*(cb: (proc():float)):(proc():float) {.importjs: "createMemo(#)".}
proc createMemo*(cb: (proc():cstring)):(proc():cstring) {.importjs: "createMemo(#)".}


proc len*(arg:JsObject):int {.importjs:"Object.keys(#).length".}
