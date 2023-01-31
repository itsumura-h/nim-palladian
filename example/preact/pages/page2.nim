import std/dom
import std/jsconsole
import std/jsffi
import ../../../src/palladian/preact

proc Page2*() {.exportc.} =
  render("""
    <h2>page2</h2>
  """)
