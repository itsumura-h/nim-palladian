import std/dom
import std/jsffi
import std/strutils
import ../../../src/palladian
import ../libs/highlight


proc CodeBlock(props:ComponentProps):Component {.exportc.} =
  let codeRef {.exportc.} = useRef()
  let lang {.exportc.} = props.lang

  useLayoutEffect(proc() =
    var code = $props.children
    code = code.replace("\\", "").dedent()
    codeRef.current.textContent = code
    highlightAll()
  , [])

  return html(fmt"""
    <pre><code class="language-${lang}" ref=${codeRef}>
    </code></pre>
  """)
