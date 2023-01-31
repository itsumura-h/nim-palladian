import std/dom
import std/jsffi
import ../../src/palladian/preact
import ./components/parent
import ./components/loop

proc App() {.exportc.} =
  render("""
    <${Parent} name="Preact" />
    <${Loop} />
  """)

renderApp(App, document.getElementById("app"))
