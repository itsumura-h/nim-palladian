import std/dom
import std/jsconsole
import std/jsffi
import ../../../src/palladian/solid

proc Page1*() {.exportc.} =
  render("""
    <h2>page1</h2>
  """)
