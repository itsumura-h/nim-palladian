import std/asyncjs
import std/dom
import std/jsconsole
import ../../src/palladian
import ./pages/home
import ./pages/about

proc Foo():Component {.exportc.} =
  let (msg {.exportc.}, setMsg {.exportc.}) = useState("")

  useEffect(proc():CleanUpCallback =
    console.log("Foo is mounted")

    return proc() =
      console.log("Foo is unmounted")
  )

  return html("""
    <div>
      <input type="text" oninput=${e=> setMsg(e.target.value)}/>
      <p>${msg}</p>
    </div>
  """)

proc App():Component {.exportc.} =
  return html(fmt"""
    <${Foo} />
  """)


renderApp(App, document.getElementById("app"))
