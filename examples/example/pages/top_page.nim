import std/jsffi
import ../../../src/palladian
import ../../../src/palladian/strformat
import ../components/text_body

proc TopPage*():Component {.exportc.} =
  return html(fmt"""
    <div>
      <div class="hero bg-base-200">
        <div class="hero-content text-center">
          <div class="max-w-md">
            <h1 class="text-5xl font-bold">Nim Palladian</h1>
            <p class="py-6">Palladian is a Nim front-end framework based on and wrapped around Preact.</p>
            <button class="btn btn-primary">Get Started</button>
          </div>
        </div>
      </div>
      <${TextHeroCenter} title="Why Preact?">
        <p>In creating a front-end framework made by Nim, we needed something that did not require a NodeJS environment
        and did not require transpiling using Babel or other software.
        Preact can use all of its features with a CDN call, and has a very compact library size of 3KB.</p>
      <//>
    </div>
  """)

#[

<div class="hero bg-base-200">
  <div class="hero-content text-center">
    <div class="max-w-md">
      <h2 class="text-4xl font-bold">Why Preact?</h2>
      <p class="py-6">In creating a front-end framework made by Nim, we needed something that did not require a NodeJS environment and did not require transpiling using Babel or other software. Preact can use all of its features with a CDN call, and has a very compact library size of 3KB.</p>
    </div>
  </div>
</div>

]#