import ../../../src/palladian
import ../../../src/palladian/strformat

proc SignalPage*():Component {.exportc.} =
  return html(fmt"""
    <p>signal</p>
  """)