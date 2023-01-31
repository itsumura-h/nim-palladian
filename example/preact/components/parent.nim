import std/dom
import std/jsconsole
import std/jsffi
import ../../../src/palladian/preact
import ../pages/page1
import ../pages/page2
import ../pages/page3

proc Parent*(props: JsObject) {.exportc.} =
  let props{.exportc.} = props
  let (msg {.exportc.}, setMsg) = useState("message")
  let (msgLen {.exportc.}, setMsgLen) = useState(0)

  proc setMsgFunc(e: Event) {.exportc.} =
    setMsg(e.target.value)

  useEffect(proc() =
    setMsgLen(msg.len)
  )

  console.log("=== re-render")

  render("""
    <h1>Hello ${props.name}!</h1>
    <form>
      <input type="text" oninput=${setMsgFunc} value=${msg} />
      ${msgLen === 0? html``<p>fill message</p>`` : html``<p>message filled</p>`` }
      <p>this is a ${msg}</p>
      <p>message count is ${msgLen}</p>
    </form>
    <${Link} href="/">page1<//>
    <${Link} href="/page2">page2<//>
    <${Link} href="/page3">page3<//>
    <${Router}>
      <${Page1} path="/" />
      <${Page2} path="/page2" />
      <${Page3} path="/page3" />
    <//>
  """)
