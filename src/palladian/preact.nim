import std/jsffi
import std/dom

{.emit: """
import { html, render } from 'https://unpkg.com/htm/preact/index.mjs?module';
import { useState, useEffect } from 'https://unpkg.com/preact@latest/hooks/dist/hooks.module.js?module'
""".}


type StrSateSetter* = proc(arg: cstring)

proc strUseState(arg: cstring): JsObject {.importcpp: "useState(#)".}
proc useState*(arg: cstring): (cstring, StrSateSetter) =
  let state = strUseState(arg)
  let value = to(state[0], cstring)
  let setter = to(state[1], StrSateSetter)
  return (value, setter)


type IntSateSetter* = proc(arg: int)

proc intUseState(arg: int): JsObject {.importcpp: "useState(#)".}
proc useState*(arg: int): (int, IntSateSetter) =
  let state = intUseState(arg)
  let value = to(state[0], int)
  let setter = to(state[1], IntSateSetter)
  return (value, setter)

type States = cstring|int

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


template render*(arg: string) =
  proc renderImpl(innerArg: string): string =
    "return html``" & innerArg & "``"
  {.emit: renderImpl(arg).}


{.emit: """
function renderApp(component, dom){
  render(html``<${component} />``, dom)
}
""".}
proc renderApp*(component: proc(), dom: Node) {.importcpp: "renderApp(#, #)".}
