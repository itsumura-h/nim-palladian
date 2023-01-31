import std/dom
import std/jsconsole
import std/jsffi
import ../../../src/palladian/solid

proc Page3*() {.exportc.} =
  render("""
    <h2>page3</h2>
  """)
