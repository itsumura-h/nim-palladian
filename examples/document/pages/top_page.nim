import std/dom
import std/jsffi
import ../../../src/palladian
import ../components/code_block
import ../components/scroll_top
import ../components/text_body
import ../consts


proc PalladianHero(props:ComponentProps):Component {.exportc.} =
  let props {.exportc.} = props
  return html(fmt"""
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
  """)


proc Title(props:ComponentProps):Component {.exportc.} =
  let children {.exportc.} = props.children

  return html(fmt"""
    <p class="font-extrabold">${children}</p>
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
  document.title = "Top / Nim Palladian"

  let sampleCode {.exportc.} :cstring = """
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

    echo arr[\"a\"]
  """

  return html(fmt"""
    <${ScrollTop}>
      <${PalladianHero} />
      <${Article}>
        <h2>Features</h2>
        <${Ul}>
          <li>Easy syntax thanks to Nim.</li>
          <li>Extensive assets by JavaScript.</li>
          <li>Static typing and compile-time checks for JavaScript thanks to Nim make it a type-safe development experience and easier to understand type mismatch than TypeScript.</li>
          <li>Resolving library dependencies thanks to <a href="https://bun.sh/" target="_blank">Bun</a> without NodeJS.</li>
        <//>
        <${CodeBlock} lang="nim">
          ${sampleCode}
        <//>
        <${Counter} />
      <//>
      <${Article}>
        <h2>Why using Bun?</h2>
        <p>
          When building a front-end framework with Nim, the difficult part was resolving the dependencies of each library.
          NPM packages can be called from CDNs, but as the number of libraries increases, it is difficult to manually resolve the dependencies.
          Therefore, we decided to use Bun as a fast library manager, because it is easy to install and can also build JavaScript.
        </p>
      <//>
      <${Article}>
        <h2>Why using Preact?</h2>
        <p>
          In this age when React has become the de facto standard for front-end development, the knowledge of variable management and side-effects brought by React has become commonplace as other frameworks have and also adopted it.
          However, React as an SPA is no longer used, and in the NextJS era, the ever-growing API and high learning costs are problematic.
        </p>
        <p>
          Preact is highly compatible with React in terms of knowledge, but with a very restrained and minimal API.
        </p>
        <p>
          And unlike react-dom, it uses browser standard features and is only 3KB in size.
        </p>
      <//>
    <//>
  """)
