import std/dom
import std/jsffi
import std/sequtils
import ../../../src/palladian/solid

proc Loop*():Component {.exportc.} =
  let values = @["a", "b", "c", "d", "e"]
  let cvalues{.exportc.} = values.map(
    proc(row: string): cstring =
      return row.cstring
  )

  return html(fmt"""
    <hr>
    <p>loop</p>
    <ul>
      <${For} each=${()=>cvalues}>
        ${value => html`<li>${value}</li>` }
      <//>
    </ul>
  """)
