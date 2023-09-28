import std/dom
import std/jsffi
import ../../src/palladian
import ./components/header
import ./components/drawer
import ./pages/top_page


proc App():Component {.exportc.} =
  return html(fmt"""
    <div class="min-h-screen max-h-screen overflow-hidden">
      <${Header} />
      <div class="drawer drawer-mobile">
        <input id="drawer-id" type="checkbox" class="drawer-toggle" ref=${drawerStatusRef}/>

        <div class="drawer-content bg-base-200 pb-16" ref=${drawerContentRef}>
          <${Router}>
            <${TopPage} path="${BaseUrl}" />
          <//>
        </div>

        <div class="drawer-side">
          <label for="drawer-id" class="drawer-overlay"></label>
          <${Drawer} />
        </div>
      </div>
    </div>
  """)

renderApp(App, document.getElementById("app"))
