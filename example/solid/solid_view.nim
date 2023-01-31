import std/jsffi
import std/dom
import std/sequtils
import ../../src/palladian/solid


proc child(props: JsObject) {.exportc.} =
  let propsName{.exportc.} = props.name
  let (msg {.exportc.}, setMsg) = createSignal("message")
  let (msgLen {.exportc.}, setMsgLen) = createSignal(0)

  proc setMsgFunc(e: Event) {.exportc.} =
    setMsg(e.target.value)

  createEffect(proc() =
    setMsgLen(msg().len)
  )

  render("""
    <h1>Hello ${()=>propsName}!</h1>
    <form>
      <input type="text" oninput=${setMsgFunc} value=${msg} />
      <${Show} when=${()=> msgLen() === 0} fallback=${html``<p>message filled</p>``} >
        <p>fill message</p>
      <//>
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
      <${For} each=${()=>cvalues}>
        ${value => html``<li>${value}</li>`` }
      <//>
    </ul>
  """)

proc App() {.exportc.} =
  render("""
    <${child} name="Solid" />
    <${loop} />
  """)

renderApp(App, document.getElementById("app"))
