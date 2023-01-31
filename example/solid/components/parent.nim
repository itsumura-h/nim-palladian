import std/dom
import std/jsconsole
import std/jsffi
import ../../../src/palladian/solid
import ../pages/page1
import ../pages/page2
import ../pages/page3

proc Parent*(props: JsObject) {.exportc.} =
  proc propsName():cstring {.exportc.} =
    props.name.to(cstring)

  let (msg {.exportc.}, setMsg) = createSignal("message")
  let (msgLen {.exportc.}, setMsgLen) = createSignal(0)

  proc setMsgFunc(e: Event) {.exportc.} =
    setMsg(e.target.value)

  createEffect(proc() =
    setMsgLen(msg().len)
  )

  console.log("=== re-render")

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
    <a href="/page1">page1<//>
    <a href="/page2">page2<//>
    <a href="/page3">page3<//>
    <${Routes}>
      <${Route} path="/page1" element=${html``<${Page1} />``} />
      <${Route} path="/page2" element=${html``<${Page2} />``} />
      <${Route} path="/page3" element=${html``<${Page3} />``} />
    <//>
  """)
