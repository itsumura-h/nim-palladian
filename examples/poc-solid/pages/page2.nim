import std/dom
import std/jsffi
import ../../../src/palladian/solid

proc Page2*():Component {.exportc.} =
  return html("""
    <h2>page2</h2>
  """)
