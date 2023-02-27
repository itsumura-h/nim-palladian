import std/dom
import std/jsffi
import std/strutils
import std/jsconsole
import ../../../src/palladian/solid
import ../libs/highlight


proc CodeBlock(props:ComponentProps):Component {.exportc.} =
  var codeRef {.exportc.} :Element
  proc lang():cstring {.exportc.} =
    props.lang.to(cstring)

  createEffect(proc() =
    var code = $props.children
    console.log(code)
    code = code.replace("\\", "").dedent()
    console.log(codeRef)
    codeRef.textContent = code
    highlightAll()
  )

  return html(fmt"""
    <pre><code class="language-${lang}" ref=${codeRef}>
    </code></pre>
  """)
