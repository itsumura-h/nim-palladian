import std/dom
import std/jsffi
import std/strutils
import ../../../src/palladian/solid
import ../components/text_body
import ../components/code_block
import ../libs/highlight

proc Title(props:ComponentProps):Component {.exportc.} =
  proc children():cstring {.exportc.} =
    props.children

  return html(fmt"""
    <p class="font-extrabold">${children}</p>
  """)

proc Counter():Component {.exportc.} =
  let (value {.exportc.}, setValue) = createSignal(0);

  proc increment(e:Event) {.exportc.} =
    setValue(value() + 1)

  proc decrement(e:Event) {.exportc.} =
    setValue(value() - 1)

  return html(fmt"""
    <${Title}>Hello Nim Palladian<//>
    <div>Counter: ${value}</div>
    <p><button onClick=${increment} class="btn btn-primary">Increment</button></p>
    <p><button onClick=${decrement} class="btn btn-primary">Decrement</button></p>
  """)

proc TopPage*():Component {.exportc.} =
  document.title = "Top / Nim Palladian"

  let sampleCode {.exportc.} :cstring = """
    proc Title(props:ComponentProps):Component {.exportc.} =
      let children {.exportc.} = props.children

      return html(fmt\"\""
        <p class="font-extrabold">${children}</p>
      \"\"")

    proc Counter():Component {.exportc.} =
      let (value {.exportc.}, setValue) = createSignal(0);

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

  return html(fmt"""
    <div>
      <${Hero}>
        <h1>Nim Palladian🏛️</h1>
        <p>Palladian is a Nim front-end framework for SPA based on and wrapped around <a href="https://preactjs.com/" target="_blank">Preact</a>.</p>
      <//>
      <${Article}>
        <h2>Features</h2>
        <ul>
          <li>Easy syntax thanks to Nim.</li>
          <li>Extensive assets by JavaScript.</li>
          <li>Static typing and compile-time checks for JavaScript thanks to Nim make it a type-safe development experience and easier to understand type mismatch than TypeScript.</li>
          <li>The evolution of CDN that allow development without NodeJS.</li>
          <li>Resolving library dependencies thanks to <a href="https://esm.sh/" target="_blank">esm.sh</a> without NodeJS and <code>package.json</code>.</li>
        </ul>
        <${CodeBlock} lang="nim">
          ${sampleCode}
        <//>
        <${Counter} />
      <//>
      <${Article}>
        <h2>Why using Preact?</h2>
        <p>
          In creating a front-end framework made by Nim, we needed something that did not require a NodeJS environment
          and did not require transpiling using Babel or other software.
          Preact can use all of its features with a CDN call, and has a very compact library size of 3KB.
        </p>
        <p>
          Furthermore, unlike React, Preact can use the browser standard API for DOM manipulation.
        </p>
      <//>
    </div>
  """)
