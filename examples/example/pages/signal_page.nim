import ../../../src/palladian
import ../../../src/palladian/format

proc SignalPage*():Component {.exportc.} =
  return html(fmt"""
    <p>signal</p>
  """)