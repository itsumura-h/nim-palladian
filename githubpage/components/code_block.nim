import std/dom
import std/jsffi
import std/strutils
import ../../src/palladian
import ../../src/palladian/format
import ../../src/palladian/hooks
import ../libs/highlight


proc CodeBlock(props:ComponentProps):Component {.exportc.} =
  let codeRef {.exportc.} = useRef()

  useLayoutEffect(proc() =
    var code = $props.children
    code = code.replace("\\", "").dedent()
    codeRef.current.textContent = code
    highlightAll()
  , [])

  return html(fmt"""
    <pre><code class="language-nim" ref=${codeRef}>
    </code></pre>
  """)
