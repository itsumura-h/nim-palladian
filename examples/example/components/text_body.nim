import std/jsffi
import std/jsconsole
import ../../../src/palladian
import ../../../src/palladian/strformat

proc TextHeroCenter*(props:JsObject):Component {.exportc.} =
  let props {.exportc.} = props
  return html(fmt"""
  <div class="hero">
    <div class="hero-content text-center">
      <div class="prose max-w-md">
        <h2>${props.title}</h2>
        ${props.children}
      </div>
    </div>
  </div>
  """)

proc TextWrap*(props:JsObject):Component {.exportc.} =
  let props {.exportc.} = props
  return html(fmt"""
    <div class="p-6 xl:pr-2 pb-16">
      <div class="flex flex-col-reverse justify-between gap-6 xl:flex-row">
        <article class="prose w-full max-w-4xl flex-grow">
          <h2>${props.title}</h2>
          ${props.children}
        </article>
      </div>
    </div>
  """)
