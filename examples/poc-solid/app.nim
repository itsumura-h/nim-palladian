import std/dom
import std/jsffi
import ../../src/palladian/solid
import ./components/parent
import ./components/loop
import ./components/api

proc App():Component {.exportc.} =
  return html(fmt"""
    <${Router}>
      <${Parent} name="SolidJS" />
      <${Loop} />
      <${ApiAccessComponent} />
    <//>
  """)

render(App, document.getElementById("app"))
