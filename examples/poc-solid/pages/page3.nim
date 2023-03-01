import std/dom
import std/jsconsole
import std/jsffi
import ../../../src/palladian/solid

proc Page3*():Component {.exportc.} =
  return html("""
    <h2>page3</h2>
  """)
