import std/dom
import std/jsffi
import ../../../src/palladian/preact

let msg {.exportc.} = signal("message")

proc Parent*(props: JsObject):Component {.exportc.} =
  let props {.exportc.} = props
  let msgValue {.exportc.} = msg.value
  let (msgLen {.exportc.}, setMsgLen) = useState(0)

  proc setMsgFunc(e: Event) {.exportc.} =
    msg.value = e.target.value

  useEffect(proc() =
    setMsgLen(msgValue.len)
  )

  return html("""
    <div>
      <h1>Hello ${props.name}!</h1>
      <form>
        <input type="text" oninput=${setMsgFunc} value=${msg} />
        <${Show} when=${msg} fallback=${html`<p>fill message</p>`}>
          ${html`<p>message filled</p>`}
        <//>
        <p>this is a ${msg}</p>
        <p>message count is ${msgLen}</p>
      </form>
    </div>
  """)

# <p>${msgLen == 0? "fill message" : "message filled" }</p>