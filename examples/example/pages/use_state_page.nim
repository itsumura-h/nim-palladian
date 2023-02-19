import std/jsffi
import std/dom
import std/jsconsole
import std/math
import ../../../src/palladian
import ../../../src/palladian/hooks
import ../../../src/palladian/strformat

{.emit:"""
  import MarkdownIt from 'https://esm.sh/markdown-it@13.0.1';
""".}

proc newMarkdownIt():JsObject {.importjs:"new MarkdownIt(@)".}
proc highlightAll() {.importjs:"Prism.highlightAll()".}

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
  useEffect(proc()=
    let md = newMarkdownIt()

    const useStateMd:cstring = staticRead("../contents/use-state/use-state.md")
    let useStateHtml {.exportc.} = md.render(useStateMd).to(cstring);
    var d = document.getElementById("useStateContent")
    d.innerHtml = useStateHtml

    const boolStateMd:cstring = staticRead("../contents/use-state/bool-state.md")
    let boolStateHtml {.exportc.} = md.render(boolStateMd).to(cstring);
    d = document.getElementById("boolStateContent")
    d.innerHtml = boolStateHtml

    const intStateMd:cstring = staticRead("../contents/use-state/int-state.md")
    let intStateHtml {.exportc.} = md.render(intStateMd).to(cstring);
    d = document.getElementById("intStateContent")
    d.innerHtml = intStateHtml

    const floatStateMd:cstring = staticRead("../contents/use-state/float-state.md")
    let floatStateHtml {.exportc.} = md.render(floatStateMd).to(cstring);
    d = document.getElementById("floatStateContent")
    d.innerHtml = floatStateHtml

    const stringStateMd:cstring = staticRead("../contents/use-state/string-state.md")
    let stringStateHtml {.exportc.} = md.render(stringStateMd).to(cstring);
    d = document.getElementById("stringStateContent")
    d.innerHtml = stringStateHtml

    highlightAll()
  , [])

  return html(fmt"""
    <${TextWrap}>
      <div id="useStateContent"/>

      <div id="boolStateContent"/>
      <${BoolStateComponent} />

      <div id="intStateContent"/>
      <${IntStateComponent} />

      <div id="floatStateContent"/>
      <${FloatStateComponent} />

      <div id="stringStateContent"/>
      <${StringStateComponent} />

      <br/>
      <br/>
    <//>
  """)
