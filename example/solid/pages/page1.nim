import std/dom
import std/jsconsole
import std/jsffi
import ../../../src/palladian/preact

proc Page1*() {.exportc.} =
  render("""
    <h2>page1</h2>
  """)
