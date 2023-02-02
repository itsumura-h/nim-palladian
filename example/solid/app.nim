import std/dom
import std/jsffi
import ../../src/palladian/solid
import ./components/parent
import ./components/loop

proc App() {.exportc.} =
  render("""
    <${Router} />
      <${Parent} name="Solid" />
      <${Loop} />
    <//>
  """)

renderApp(App, document.getElementById("app"))
