import std/dom
import ../../src/palladian
import ../../src/palladian/format
import ../../src/palladian/router
import ./pages/home
import ./pages/about

proc App():Component {.exportc.} =
  return html(fmt"""
    <${Router}>
      <${Home} path="/" />
      <${About} path="/about" />
    <//>
  """)


renderApp(App, document.getElementById("app"))
