import std/jsffi
import std/jsconsole
import ../../../src/palladian
import ../../../src/palladian/strformat

proc TextBodyCenter*(props:JsObject):Component {.exportc.} =
  let props {.exportc.} = props
  return html(fmt"""
  <div class="hero bg-base-200">
    <div class="hero-content text-center">
      <div class="max-w-md">
        <h1 class="text-5xl font-bold">${props.title}</h1>
        <p class="py-6">${props.children}</p>
      </div>
    </div>
  </div>
  """)

proc TextWrap*(props:JsObject):Component {.exportc.} =
  let props {.exportc.} = props
  return html(fmt"""
    <div class="px-6 xl:pr-2 pb-16">
      <div class="flex flex-col-reverse justify-between gap-6 xl:flex-row">
        <article class="prose w-full max-w-4xl flex-grow">
          <h1>${props.title}</h1>
          ${props.children}
        </article>
      </div>
    </div>
  """)
