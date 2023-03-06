import std/jsffi
import std/dom
import std/math
import ../../../src/palladian
import ../components/text_body
import ../components/code_block
import ../libs/highlight
import ../consts


proc BoolStateComponent():Component {.exportc.} =
  let (boolState {.exportc.}, setBoolState) = useState(false)

  proc updateState(e:Event) {.exportc.} =
    setBoolState(not boolState)

  return html(fmt"""
    <p>Click here --> <button class="btn btn-primary" onClick=${updateState}>${boolState.toString()}</button> </p>
  """)

let boolStateCode {.exportc.} :cstring = """
  proc BoolStateComponent():Component {.exportc.} =
    let (boolState {.exportc.}, setBoolState) = useState(false)

    proc updateState(e:Event) {.exportc.} =
      setBoolState(not boolState)

    return html(\"\"\"
      <p>Click here --> <button class="btn btn-primary" onClick=${updateState}>${boolState.toString()}</button> </p>
    \"\"\")
"""



proc IntStateComponent():Component {.exportc.} =
  let (intState {.exportc.}, setIntState) = useState(0)

  proc updateState(e:Event) {.exportc.} =
    setIntState(intState + 1)

  return html(fmt"""
    <p>Click here --> <button class="btn btn-primary" onClick=${updateState}>${intState}</button> </p>
  """)

let intStateCode {.exportc.} :cstring = """
proc IntStateComponent():Component {.exportc.} =
  let (intState {.exportc.}, setIntState) = useState(0)

  proc updateState(e:Event) {.exportc.} =
    setIntState(intState + 1)

  return html(\"\"\"
    <p>Click here --> <button class="btn btn-primary" onClick=${updateState}>${intState}</button> </p>
  \"\"\")
"""


proc FloatStateComponent():Component {.exportc.} =
  let (floatState {.exportc.}, setFloatState) = useState(0.0)

  proc updateState(e:Event) {.exportc.} =
    setFloatState(round(floatState + 0.1, 1))

  return html(fmt"""
    <p>Click here --> <button class="btn btn-primary" onClick=${updateState}>${floatState}</button> </p>
  """)

let floatStateCode {.exportc.} :cstring = """
import std/math

proc FloatStateComponent():Component {.exportc.} =
  let (floatState {.exportc.}, setFloatState) = useState(0.0)

  proc updateState(e:Event) {.exportc.} =
    setFloatState(round(floatState + 0.1, 1))

  return html(\"\"\"
    <p>Click here --> <button class="btn btn-primary" onClick=${updateState}>${floatState}</button> </p>
  \"\"\")
"""


proc StringStateComponent():Component {.exportc.} =
  let (stringState {.exportc.}, setStringState) = useState("")

  proc updateState(e:Event) {.exportc.} =
    setStringState(e.target.value)

  return html(fmt"""
    <input type="text" oninput=${updateState} placeholder="Type here" class="input w-full" />
    <p>${stringState}</p>
  """)

let stringStateCode {.exportc.} :cstring = """
proc StringStateComponent():Component {.exportc.} =
  let (stringState {.exportc.}, setStringState) = useState("")

  proc updateState(e:Event) {.exportc.} =
    setStringState(e.target.value)

  return html(\"\"\"
    <input type="text" oninput=${updateState} placeholder="Type here" class="input w-full" />
    <p>${stringState}</p>
  \"\"\")
"""


proc UseStatePage*(props:ComponentProps):Component {.exportc.} =
  document.title = "useState / Nim Palladian"

  # useLayoutEffect(proc() =
  #   let el = drawerContentRef.current
  #   el.scrollTo(0, 0)
  # , [])

  return html(fmt"""
    <${ScrollTop}>
      <${Article}>
        <h1>useState</h1>
        <p>
          <code>useState</code> is a hook provided by Preact that allows you to add state to functional components.
          <br />
          State refers to the data that is held by a component and can change over time, often in response to user interactions or other events.
        </p>
        <p>
          The useState hook takes an initial value as an argument and returns an array with two items: the current state value and a function that can be used to update that value.
        </p>
        <p>
          See also<br/>
          <a href="https://preactjs.com/guide/v10/hooks/#usestate" target="_blank">Preact - useState</a>
        </p>

        <h2>Bool state</h2>
        <${CodeBlock} lang="nim">
          ${boolStateCode}
        <//>
        <${BoolStateComponent} />

        <h2>Int state</h2>
        <${CodeBlock} lang="nim">
          ${intStateCode}
        <//>
        <${IntStateComponent} />

        <h2>Float state</h2>
        <${CodeBlock} lang="nim">
          ${floatStateCode}
        <//>
        <${FloatStateComponent} />

        <h2>String state</h2>
        <${CodeBlock} lang="nim">
          ${stringStateCode}
        <//>
        <${StringStateComponent} />
      <//>
    <//>
  """)
