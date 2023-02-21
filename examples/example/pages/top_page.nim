import std/dom
import std/jsffi
import std/strutils
import ../../../src/palladian
import ../../../src/palladian/format
import ../../../src/palladian/hooks
import ../components/text_body
import ../components/code_block
import ../libs/highlight

proc Title(props:ComponentProps):Component {.exportc.} =
  let name {.exportc.} = props.children

  return html(fmt"""
    <h1>${name}</h1>
  """)

proc Counter():Component {.exportc.} =
  let (value {.exportc.}, setValue) = useState(0);

  proc increment(e:Event) {.exportc.} =
    setValue(value + 1)

  proc decrement(e:Event) {.exportc.} =
    setValue(value - 1)

  return html(fmt"""
    <${Title}>Hello Nim Palladian<//>
    <div>Counter: ${value}</div>
    <p><button onClick=${increment} class="btn btn-primary">Increment</button></p>
    <p><button onClick=${decrement} class="btn btn-primary">Decrement</button></p>
  """)

proc TopPage*():Component {.exportc.} =
  let sampleCode {.exportc.} :cstring = """
    proc Title(props:ComponentProps):Component {.exportc.} =
      let name {.exportc.} = props.children

      return html(fmt\"\""
        <h1>${name}</h1>
      \"\"")

    proc Counter():Component {.exportc.} =
      let (value {.exportc.}, setValue) = useState(0);

      proc increment(e:Event) {.exportc.} =
        setValue(value + 1)

      proc decrement(e:Event) {.exportc.} =
        setValue(value - 1)

      return html(fmt\"\""
        <${Title}>Hello Nim Palladian<//>
        <div>Counter: ${value}</div>
        <p><button onClick=${increment} class="btn btn-primary">Increment</button></p>
        <p><button onClick=${decrement} class="btn btn-primary">Decrement</button></p>
      \"\"")
  """

  useLayoutEffect(proc()=
    document.title = "Toppage / Nim Palladian"
  , [])

  return html(fmt"""
    <div>
      <${Hero}>
        <h1>Nim Palladian</h1>
        <p>Palladian is a Nim front-end framework for SPA based on and wrapped around Preact.</p>
      <//>
      <${Article}>
        <h2>Why Preact?</h2>
        <p>
          In creating a front-end framework made by Nim, we needed something that did not require a NodeJS environment
          and did not require transpiling using Babel or other software.
          Preact can use all of its features with a CDN call, and has a very compact library size of 3KB.
        </p>
        <p>
          Furthermore, unlike React, Preact can use the browser standard API for DOM manipulation.
        </p>
      <//>
      <${Article}>
        <h2>Features</h2>
        <ul>
          <li>Easy syntax by Nim</li>
          <li>Extensive assets by JavScript</li>
          <li>The evolution of CDN that allow development without NodeJS</li>
          <li>Resolving library dependencies by <a href="https://esm.sh/" target="_blank">esm.sh</a></li>
          <li></li>
        </ul>
        <${CodeBlock}>
          ${sampleCode}
        <//>
        <${Counter} />
      <//>
    </div>

    <br />
    <br />
  """)
