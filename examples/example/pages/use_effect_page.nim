import ../../../src/palladian
import ../../../src/palladian/strformat

proc UseEffectPage*():Component {.exportc.} =
  return html(fmt"""
    <p>useEffect</p>
  """)