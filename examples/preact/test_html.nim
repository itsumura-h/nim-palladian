import std/jsffi
import std/dom
import std/format
import ../../src/palladian/lib/preact

proc Func1():Component {.exportc.} =
  return html("""
    <p>func1</p>
  """)

proc Func2():Component {.exportc.} =
  return html("""
    <p>func2</p>
  """)

proc App():Component {.exportc.} =
  return html("""
    <${Func1} />
    <${Func2} />
    <p>${2+3}</p>
  """)

renderApp(App, document.getElementById("app"))
