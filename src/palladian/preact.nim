import std/macros
import std/jsffi
import std/dom
import std/jsconsole

{.emit: """
import {h, render} from 'https://esm.sh/preact@10.12.1'
import htm from 'https://esm.sh/htm@3.1.1'

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
