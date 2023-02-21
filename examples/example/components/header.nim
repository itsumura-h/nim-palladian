import ../../../src/palladian
import ../../../src/palladian/format
import ../../../src/palladian/router

proc Header*():Component {.exportc.} =
  return html(fmt"""
    <div class="navbar bg-base-100 sticky top-0 z-50">
      <${Link} href="/" class="btn btn-ghost normal-case text-xl">Nim palladian<//>
    </div>
  """)
