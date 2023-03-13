import std/dom
import std/jsffi
import std/strutils
import ../../../src/palladian
import ../libs/highlight

include ../../../src/palladian/sugar


component CodeBlock:
  let codeRef {.jso.} = useRef()
  let lang {.jso.} = props.lang

  useLayoutEffect(proc() =
    var code = $props.children
    code = code.replace("\\", "").dedent()
    codeRef.current.textContent = code
    highlightAll()
  , [])

  fmt"""
    <pre><code class="language-${lang}" ref=${codeRef}>
    </code></pre>
  """
