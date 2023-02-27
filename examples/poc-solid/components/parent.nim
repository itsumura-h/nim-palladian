import std/dom
import std/jsconsole
import std/jsffi
import ../../../src/palladian/solid
import ../pages/page1
import ../pages/page2
import ../pages/page3

let (boolStatus{.exportc.}, setBoolStatus) = createSignal(false)

proc Parent*(props: ComponentProps):Component {.exportc.} =
  proc propsName():cstring {.exportc.} =
    return props.name.to(cstring)

  proc updateBoolStatus(){.exportc.} =
    setBoolStatus(not boolStatus())

  let boolStatusMsg {.exportc.} = createMemo(proc():cstring =
    return $boolStatus()
  )

  let (msg {.exportc.}, setMsg) = createSignal("message")
  let (msgLen {.exportc.}, setMsgLen) = createSignal(0)

  proc setMsgFunc(e: Event) {.exportc.} =
    setMsg(e.target.value)

  createEffect(proc() =
    setMsgLen(msg().len)
  )

  return html(fmt"""
    <>
      <h1>Hello ${propsName}!</h1>
      <form>
        <input type="text" oninput=${setMsgFunc} value=${msg} />
        <${Show} when=${()=> msgLen() === 0} fallback=${html`<p>message filled</p>`} >
          <p>fill message</p>
        <//>
        <p>this is a ${msg}</p>
        <p>message count is ${msgLen}</p>
      </form>
      <p>
        <button onclick=${updateBoolStatus}>${boolStatusMsg}</button>
      </p>
      <${A} href="/page1">page1<//>
      <${A} href="/page2">page2<//>
      <${A} href="/page3">page3<//>
      <${Routes}>
        <${Route} path="/" element=${Page1} />
        <${Route} path="/page2" element=${Page2} />
        <${Route} path="/page3" element=${Page3} />
      <//>
    </>
  """)
