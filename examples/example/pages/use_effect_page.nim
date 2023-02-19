import std/dom
import std/jsconsole
import ../../../src/palladian
import ../../../src/palladian/strformat
import ../../../src/palladian/hooks
import ../libs/markdown
import ../libs/highlight


proc StringEffectComponent():Component {.exportc.} =
  let (stringState {.exportc.}, setStringState) = useState("")
  let (stringCount {.exportc.}, setStringCount) = useState(0)

  proc updateState(e:Event) {.exportc.} =
    setStringState(e.target.value)

  useEffect(proc() =
    setStringCount(stringState.len)
  , @[stringState])

  return html(fmt"""
    <input type="text" oninput=${updateState} placeholder="Type here" class="input w-full" />
    <p>${stringState}</p>
    <p>${stringCount}</p>
  """)

proc UseEffectPage*():Component {.exportc.} =
  let useEffectContent{.exportc.} = useRef()

  useEffect(proc() =
    let md = MarkdownIt.new()

    const useEffectMd:cstring = staticRead("../contents/use-effect/use-effect.md")
    let useEffectHtml = md.render(useEffectMd)
    useEffectContent.current.innerHtml = useEffectHtml

    highlightAll()
  , [])

  return html(fmt"""
    <${TextWrap}>
      <div ref=${useEffectContent} />
      <${StringEffectComponent} />
      <br />
      <br />
    <//>
  """)
