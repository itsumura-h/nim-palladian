import std/dom
import std/jsffi
import palladian


proc AboutPage*():Component {.exportc.} =
  let (stringState {.exportc.}, setStringState) = useState("")
  let (stringCount {.exportc.}, setStringCount) = useState(0)

  proc updateState(e:Event) {.exportc.} =
    setStringState(e.target.value)

  useEffect(proc() =
    setStringCount(stringState.len)
  , @[stringState])

  return html(fmt"""
    <article>
      <section>
        <h2 class="goldFont">About</h2>
        <p class="whiteFont">
          You can use hooks in Nim!
        </p>
        <input type="text" oninput=${updateState} placeholder="Type here" class="input w-full" />
        <p class="whiteFont">${stringState}</p>
        <p class="whiteFont">count: ${stringCount}</p>
      </section>
    </article>
    <article>
      <section>
        <p class="whiteFont">
          ===> <${Link} href="/">back to top page<//>
        </p>
      </section>
    </article>
  """)
