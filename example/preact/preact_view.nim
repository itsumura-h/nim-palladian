import std/jsffi
import std/dom
import std/sequtils
import ../../src/palladian/preact


proc child(props: JsObject) {.exportc.} =
  let propsName{.exportc.} = props.name
  let (msg {.exportc.}, setMsg) = useState("message")
  let (msgLen {.exportc.}, setMsgLen) = useState(0)

  proc setMsgFunc(e: Event) {.exportc.} =
    setMsg(e.target.value)

  useEffect(proc() =
    setMsgLen(msg.len)
  )

  useEffect((proc() =
    setMsgLen(msg.len)
  ), @[msg])

  render("""
    <h1>Hello ${propsName}!</h1>
    <form>
      <input type="text" oninput=${setMsgFunc} value=${msg} />
      ${msgLen === 0 ? html`` <p>fill message</p> `` : html`` <p>message filled</p> ``}
      <p>this is a ${msg}</p>
      <p>message count is ${msgLen}</p>
    </form>
  """)

proc loop() {.exportc.} =
  let values = @["a", "b", "c", "d", "e"]
  let cvalues{.exportc.} = values.map(
    proc(row: string): cstring =
    return row.cstring
  )
  render("""
    <hr>
    <p>loop</p>
    <ul>
      ${cvalues.map(
        value => html``<li>${value}</li>``
      )}
    </ul>
  """)

proc App() {.exportc.} =
  render("""
    <${child} name="Preact"/>
    <${loop} />
  """)

renderApp(App, document.getElementById("app"))
