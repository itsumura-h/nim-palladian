import std/jsffi
import std/dom
import std/jsconsole

{.emit: """
import { h, render } from 'https://cdn.jsdelivr.net/npm/preact@10.11.3/+esm';
import htm from 'https://cdn.jsdelivr.net/npm/htm@3.1.1/+esm'
import { useState, useEffect, useMemo } from 'https://cdn.jsdelivr.net/npm/preact@10.11.3/hooks/+esm';
import {Router, Link} from 'https://cdn.jsdelivr.net/npm/preact-router@4.1.0/+esm';
import { signal, Signal } from 'https://cdn.jsdelivr.net/npm/@preact/signals@1.1.3/+esm';

const html = htm.bind(h);

// https://gist.github.com/developit/af2a4488de152a84bff83e035bb8afc1
Signal.prototype.map = function(fn) { return html``<For each=${this} children=${fn} />`` };

export function For({ each, children: f }) {
  let c = useMemo(() => new Map, []);
  let value = each.value;
  if (!Array.isArray(value)) return html``<Item v=${value} f=${f} />``;
  return value.map((v, k, x) => c.get(v) || (c.set(v, x = html``<Item v=${v} k=${k} f=${f} />``), x));
}
let Item = ({ v, k, f }) => f(v, k);

export function Show({ when, fallback, children: f }) {
  let v = when.value;
  return v ? typeof f === 'function' ? html``<Item v=${v} f=${f} />`` : f : fallback;
}
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

type IntSignal* = object of JsObject
proc signal*(arg:int):IntSignal {.importcpp:"signal(#)".}
proc value*(self:IntSignal):int {.importcpp:"#.value".}

type StrSignal* = object of JsObject
type StrSignalValue* = cstring
proc signal*(arg:cstring):StrSignal {.importcpp:"signal(#)".}
proc value*(self:StrSignal):StrSignalValue {.importcpp:"#.value".}
proc `value=`*(self:StrSignal, val:cstring) {.importcpp: "#.value = #".}

type Component* = JsObject

proc html*(arg:cstring):Component {.importcpp:"eval('html`' + # + '`')".}


{.emit: """
function renderApp(component, dom){
  render(html``<${component} />``, dom)
}
""".}
# proc renderApp*(component: proc(), dom: Element) {.importcpp: "renderApp(#, #)".}
proc renderApp*(component: proc():Component, dom: Element) {.importcpp: "renderApp(#, #)".}
