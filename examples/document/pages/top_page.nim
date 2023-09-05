import std/dom
import std/jsffi
import std/strutils
import ../../../src/palladian
import ../components/text_body
import ../components/code_block
import ../components/scroll_top
import ../libs/highlight
import ../consts
include ../../../src/palladian/sugar

component PalladianHero:
  let props {.jso.} = props
  fmt"""
    <div class="hero">
      <div class="hero-content text-center">
        <article>
          <h1 class="text-4xl font-extrabold mb-9">
            Nim Palladian
            <img src="${PalladianLogoUrl}" class="inline align-baseline w-8" />
          </h1>
          <div class="prose max-w-md">
            <p>Palladian is a Nim front-end framework for SPA based on and wrapping <a href="https://preactjs.com/" target="_blank">Preact</a>.</p>
          </div>
        </article>
      </div>
    </div>
  """

component Title:
  let children {.jso.} = props.children

  fmt"""
    <p class="font-extrabold">${children}</p>
  """

component Counter():
  let (value {.jso.}, setValue) = useState(0);

  event increment:
    setValue(value + 1)

  event decrement:
    setValue(value - 1)

  fmt"""
    <${Title}>Hello Nim Palladian<//>
    <div>Counter: ${value}</div>
    <p><button onClick=${increment} class="btn btn-primary">Increment</button></p>
    <p><button onClick=${decrement} class="btn btn-primary">Decrement</button></p>
  """

component TopPage*:
  document.title = "Top / Nim Palladian"

  let sampleCode {.jso.} :cstring = """
    proc Title(props:ComponentProps):Component {.exportc.} =
      let children {.exportc.} = props.children

      return html(fmt\"\""
        <p class="font-extrabold">${children}</p>
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

  fmt"""
    <${ScrollTop}>
      <${PalladianHero} />
      <${Article}>
        <h2>Features</h2>
        <${Ul}>
          <li>Easy syntax thanks to Nim.</li>
          <li>Extensive assets by JavaScript.</li>
          <li>Static typing and compile-time checks for JavaScript thanks to Nim make it a type-safe development experience and easier to understand type mismatch than TypeScript.</li>
          <li>The evolution of CDN that allow development without NodeJS.</li>
          <li>Resolving library dependencies thanks to <a href="https://esm.sh/" target="_blank">esm.sh</a> without NodeJS and <code>package.json</code>.</li>
        <//>
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
    <//>
  """
