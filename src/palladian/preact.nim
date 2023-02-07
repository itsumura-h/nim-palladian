import std/macros
import std/jsffi
import std/dom
import std/jsconsole

{.emit: """
import { h, render } from 'https://cdn.jsdelivr.net/npm/preact@10.11.3/+esm';
import htm from 'https://cdn.jsdelivr.net/npm/htm@3.1.1/+esm'

const html = htm.bind(h);
""".}


type Component* = JsObject

proc html*(arg:cstring):Component {.importcpp:"eval('html`' + # + '`')".}
template html*(arg:string):Component = html(arg.cstring)


{.emit: """
function renderApp(component, dom){
  render(html``<${component} />``, dom)
}
""".}
proc renderApp*(component: proc():Component, dom: Element) {.importcpp: "renderApp(#, #)".}
