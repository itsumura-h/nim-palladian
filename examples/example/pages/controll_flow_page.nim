import ../../../src/palladian
import ../../../src/palladian/format

proc ControllFlowPage*():Component {.exportc.} =
  return html(fmt"""
    <p>controll flow</p>
  """)
