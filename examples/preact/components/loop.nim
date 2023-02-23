import std/dom
import std/jsffi
import std/sequtils
import ../../../src/palladian/preact

proc Loop*():Component {.exportc.} =
  let values = @["a", "b", "c", "d", "e"]
  let cvalues{.exportc.} = values.map(
    proc(row: string): cstring =
    return row.cstring
  )
  html("""
    <hr />
    <p>loop</p>
    <ul>
      ${cvalues.map(value=>{
        return html``<li>${value}</li>``
      })}
    </ul>
  """)
