import std/jsffi
import ../../../src/palladian
import ../../../src/palladian/hooks
import ../../../src/palladian/strformat


proc UseStatePage*():Component {.exportc.} =
  return html(fmt"""
    <p>useState</p>
  """)
