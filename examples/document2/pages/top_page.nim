import std/dom
import std/jsffi
import std/jsconsole
import ../../../src/palladian
import ../consts
import ../components/code_block


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

  let arr {.exportc.} = newJsObject()
  arr["a"] = "a".cstring
  arr["b"] = "b".cstring
  console.log(arr)

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
    <${PalladianHero} />
    <article>
      <p>${arr["a"]}</p>
      <${CodeBlock} lang="nim">
        ${sampleCode}
      <//>
      <${Counter} />
    </article>
  """)
