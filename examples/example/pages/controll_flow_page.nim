import ../../../src/palladian
import ../../../src/palladian/strformat

proc ControllFlowPage*():Component {.exportc.} =
  return html(fmt"""
    <p>controll flow</p>
  """)
