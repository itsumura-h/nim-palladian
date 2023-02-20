import std/jsffi
import std/dom
import std/strutils
import ../../../src/palladian
import ../../../src/palladian/strformat
import ../../../src/palladian/hooks
import ../libs/highlight

proc CodeBlock(props:JsObject):Component {.exportc.} =
  let codeRef {.exportc.} = useRef()

  useEffect(proc() =
    var code = $props.children.to(cstring)
    code = code.replace("\\", "").dedent()
    codeRef.current.textContent = code
    highlightAll()
  , [])

  return html(fmt"""
    <pre><code class="language-nim" ref=${codeRef}>
    </code></pre>
  """)
