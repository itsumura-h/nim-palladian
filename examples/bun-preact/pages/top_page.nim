import std/dom
import std/jsffi
import palladian


proc TopPage*():Component {.exportc.} =
  return html(fmt"""
    <article>
      <section>
        <h2 class="goldFont">
          Frontend Web Framewrok for Nim
        </h2>
        <p class="whiteFont">
          <i>―― Palladian is a contemporary interpretation of Greek and Roman architecture, a simple and compact expression of complex classical design.</i>
        </p>
        <div class="whiteFont">
          <ul>
            <li>Easy syntax thanks to Nim.</li>
            <li>Extensive assets by JavaScript.</li>
            <li>Static typing and compile-time checks for JavaScript thanks to Nim make it a type-safe development experience and easier to understand type mismatch than TypeScript.</li>
            <li>Resolving library dependencies thanks to <a href="https://bun.sh/" target="_blank">Bun</a></li>
          </ul>
        </div>
      </section>
    </article>
    <article>
      <section>
        <p class="whiteFont">
          ===> <${Link} href="/about">see about page<//>
        </p>
      </section>
    </article>
  """)
