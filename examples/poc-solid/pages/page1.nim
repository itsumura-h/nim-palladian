import std/dom
import std/jsconsole
import std/jsffi
import ../../../src/palladian/solid

proc Page1*():Component {.exportc.} =
  return html("""
    <h2>page1</h2>
  """)
