import std/dom
import ../../src/palladian/preact
import ./pages/home
import ./pages/about

proc App():Component {.exportc.} =
  return html("""
    <${Router}>
      <${Home} path="/" />
      <${About} path="/about" />
    <//>
  """)


renderApp(App, document.getElementById("app"))
