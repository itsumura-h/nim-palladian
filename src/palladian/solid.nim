import std/jsffi
import std/dom


{.emit: """
import { render } from "https://cdn.skypack.dev/solid-js/web";
import html from "https://cdn.skypack.dev/solid-js/html";
import {
  createSignal,
  createEffect,
  onCleanup,
  For,
  Show,
} from "https://cdn.skypack.dev/solid-js";
// https://github.com/solidjs/solid-router
// https://www.jsdelivr.com/package/npm/@solidjs/router
import { Router, Routes, Route, A } from "https://cdn.jsdelivr.net/npm/@solidjs/router@0.7/+esm";
// import {Router, Link} from 'https://cdn.jsdelivr.net/npm/preact-router@4.1.0/+esm';
""".}


type StrSateGetter* = proc():cstring
type StrSateSetter* = proc(arg: cstring)

proc strCreateSignal(arg: cstring): JsObject {.importcpp: "createSignal(#)".}
proc createSignal*(arg: cstring): (StrSateGetter, StrSateSetter) =
  let state = strCreateSignal(arg)
  let value = to(state[0], StrSateGetter)
  let setter = to(state[1], StrSateSetter)
  return (value, setter)


type IntSateGetter* = proc():int
type IntSateSetter* = proc(arg: int)

proc intCreateSignal(arg: int): JsObject {.importcpp: "createSignal(#)".}
proc createSignal*(arg: int): (IntSateGetter, IntSateSetter) =
  let state = intCreateSignal(arg)
  let value = to(state[0], IntSateGetter)
  let setter = to(state[1], IntSateSetter)
  return (value, setter)


proc createEffect*(cb: proc()) {.importcpp: "createEffect(#)".}

template render*(arg: string) =
  proc renderImpl(innerArg: string): string =
    "return html``" & innerArg & "``"
  {.emit: renderImpl(arg).}


{.emit: """
function renderApp(component, dom){
  render(()=>component, dom)
}
""".}
proc renderApp*(component: proc(), dom: Node) {.importcpp: "renderApp(#, #)".}
