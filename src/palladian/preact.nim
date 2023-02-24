import std/jsffi
import std/dom
import ./importlibs

importPreact()

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


proc len*(arg:JsObject):int {.importjs:"Object.keys(#).length".}
proc len*[T](arg:T):int {.importjs:"Object.keys(#).length".}
