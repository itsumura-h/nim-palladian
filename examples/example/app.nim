import std/dom
import ../../src/palladian
import ../../src/palladian/strformat
import ../../src/palladian/router
import ./components/header
import ./components/drawer
import ./pages/top


proc App():Component {.exportc.} =
  return html(fmt"""
    <div class="min-h-screen max-h-screen overflow-hidden" data-theme="halloween">
      <${Header} />
      <div class="flex">
        <div>
          <${Drawer} />
        </div>
        <div>
          <${Router}>
            <${Top} path="/" />
          <//>
        </div>
      </div>
    </div>
  """)


renderApp(App, document.getElementById("app"))
