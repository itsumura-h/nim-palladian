import std/dom
import std/jsffi
import std/strutils
import ../../../src/palladian
import ../libs/highlight
import std/jsconsole


proc CodeBlock*(props:ComponentProps):Component {.exportc.} =
  let codeRef {.exportc.} = useRef()
  let lang {.exportc.} = props.lang
  console.log("=== CodeBlock")
  console.log(props)

  useLayoutEffect(proc() =
    var code = $props.children
    console.log(code)
    # code = code.replace("\\\"", "\"")
    code = code.replace("\\", "")
    code = code.dedent()
    codeRef.current.textContent = code
    highlightAll()
  , [])

  return html(fmt"""
    <pre><code class="language-${lang}" ref=${codeRef}>
    </code></pre>
  """)
