import std/jsconsole
import ../../../src/palladian
import ../../../src/palladian/strformat
import ../components/parent

proc About():Component {.exportc.} =
  console.log(msg)

  return html(fmt"""
    <div>
      <h1>About</h1>
      <${Link} href="/">home<//>
      <hr />
      <p>${msg}</p>
    </div>
  """)
