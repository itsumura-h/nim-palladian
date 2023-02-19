import std/jsffi
import std/dom
import std/jsconsole
import std/math
import ../../../src/palladian
import ../../../src/palladian/hooks
import ../../../src/palladian/strformat
import ../components/text_body
import ../libs/markdown
import ../libs/highlight


proc BoolStateComponent():Component {.exportc.} =
  let (boolState {.exportc.}, setBoolState) = useState(false)

  proc updateState(e:Event) {.exportc.} =
    setBoolState(not boolState)

  return html(fmt"""
    <p>Click here --> <button class="btn btn-primary" onClick=${updateState}>${boolState.toString()}</button> </p>
  """)

proc IntStateComponent():Component {.exportc.} =
  let (intState {.exportc.}, setIntState) = useState(0)

  proc updateState(e:Event) {.exportc.} =
    setIntState(intState + 1)

  return html(fmt"""
    <p>Click here --> <button class="btn btn-primary" onClick=${updateState}>${intState}</button> </p>
  """)

proc FloatStateComponent():Component {.exportc.} =
  let (floatState {.exportc.}, setFloatState) = useState(0.0)

  proc updateState(e:Event) {.exportc.} =
    setFloatState(round(floatState + 0.1, 1))

  return html(fmt"""
    <p>Click here --> <button class="btn btn-primary" onClick=${updateState}>${floatState}</button> </p>
  """)

proc StringStateComponent():Component {.exportc.} =
  let (stringState {.exportc.}, setStringState) = useState("")

  proc updateState(e:Event) {.exportc.} =
    setStringState(e.target.value)

  return html(fmt"""
    <input type="text" oninput=${updateState} placeholder="Type here" class="input w-full" />
    <p>${stringState}</p>
  """)


proc UseStatePage*():Component {.exportc.} =
  let useStateContent {.exportc.} = useRef()
  let boolStateContent {.exportc.} = useRef()
  let intStateContent {.exportc.} = useRef()
  let floatStateContent {.exportc.} = useRef()
  let stringStateContent {.exportc.} = useRef()

  useEffect(proc()=
    let md = MarkdownIt.new()

    const useStateMd:cstring = staticRead("../contents/use-state/use-state.md")
    let useStateHtml = md.render(useStateMd)
    useStateContent.current.innerHtml = useStateHtml

    const boolStateMd:cstring = staticRead("../contents/use-state/bool-state.md")
    let boolStateHtml = md.render(boolStateMd)
    boolStateContent.current.innerHtml = boolStateHtml

    const intStateMd:cstring = staticRead("../contents/use-state/int-state.md")
    let intStateHtml = md.render(intStateMd)
    intStateContent.current.innerHtml = intStateHtml

    const floatStateMd:cstring = staticRead("../contents/use-state/float-state.md")
    let floatStateHtml = md.render(floatStateMd)
    floatStateContent.current.innerHtml = floatStateHtml

    const stringStateMd:cstring = staticRead("../contents/use-state/string-state.md")
    let stringStateHtml = md.render(stringStateMd)
    stringStateContent.current.innerHtml = stringStateHtml

    highlightAll()
  , [])

  return html(fmt"""
    <${TextWrap}>
      <div ref=${useStateContent} />

      <div ref=${boolStateContent} />
      <${BoolStateComponent} />

      <div ref=${intStateContent} />
      <${IntStateComponent} />

      <div ref=${floatStateContent} />
      <${FloatStateComponent} />

      <div ref=${stringStateContent} />
      <${StringStateComponent} />

      <br/>
      <br/>
    <//>
  """)
