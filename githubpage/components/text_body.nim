import std/jsffi
import ../../../src/palladian
import ../../../src/palladian/format

proc Hero*(props:ComponentProps):Component {.exportc.} =
  let props {.exportc.} = props
  return html(fmt"""
  <div class="hero">
    <div class="hero-content text-center">
      <article class="prose max-w-md">
        ${props.children}
      </article>
    </div>
  </div>
  """)

proc Article*(props:ComponentProps):Component {.exportc.} =
  let props {.exportc.} = props
  return html(fmt"""
    <div class="p-6 xl:pr-2 text-sm md:text-base">
      <div class="flex flex-col-reverse justify-between gap-6 xl:flex-row">
        <article class="prose w-full max-w-4xl flex-grow">
          <style>
            code{
              background-color: darkslategrey;
            }
          </style>
          ${props.children}
        </article>
      </div>
    </div>
  """)
