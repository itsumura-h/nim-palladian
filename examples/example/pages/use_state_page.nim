import ../../../src/palladian
import ../../../src/palladian/strformat

proc UseStatePage*():Component {.exportc.} =
  return html(fmt"""
    <p>useState</p>
  """)
