import std/dom
import std/jsffi
import std/jsconsole
import std/json
import ../../../src/palladian
import ../../../src/palladian/format
import ../../../src/palladian/hooks
import ../../../src/palladian/router
import ../../../src/palladian/controll_flow

let msg* {.exportc.} = signal("message")

proc Parent*(props: JsObject):Component {.exportc.} =
  let props {.exportc.} = props
  let msgValue {.exportc.} = msg.value
  let (msgLen {.exportc.}, setMsgLen) = useState(0)

  proc setMsgFunc(e: Event) {.exportc.} =
    msg.value = e.target.value

  useEffect(proc() =
    setMsgLen(msgValue.len)
  )

  return html(fmt"""
    <div>
      <h1>Hello ${props.name}!</h1>
      <form>
        <input type="text" oninput=${setMsgFunc} value=${msg} />
        <${Show} when=${msg} fallback=${html`<p>fill message</p>`}>
          <p>message filled</p>
        <//>
        <${Show} when=${msgLen} fallback=${html`<p>fill message</p>`}>
          <p>message filled</p>
        <//>
        <${Show} when=${msgLen > 0} fallback=${html`<p>fill message</p>`}>
          <p>message filled</p>
        <//>
        <${Show} when=${()=> msgLen > 0} fallback=${html`<p>fill message</p>`}>
          <p>message filled</p>
        <//>
        <p>this is a ${msg}</p>
        <p>message count is ${msgLen}</p>
      </form>
    </div>
  """)

# ${html`<p>message filled</p>`}
