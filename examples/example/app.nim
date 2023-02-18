import std/dom
import ../../src/palladian
import ../../src/palladian/strformat
import ../../src/palladian/router
import ./components/header
import ./components/drawer
import ./pages/top_page
import ./pages/use_state_page
import ./pages/use_effect_page
import ./pages/signal_page
import ./pages/controll_flow_page
import ./pages/api_access_page


proc App():Component {.exportc.} =
  return html(fmt"""
    <div class="min-h-screen max-h-screen overflow-hidden">
      <${Header} />
      <div class="drawer drawer-mobile">
        <input id="drawer" type="checkbox" class="drawer-toggle" />

        <div class="drawer-content overflow-y-auto">
          <${Router}>
            <${TopPage} path="/" />
            <${UseStatePage} path="/use-state" />
            <${UseEffectPage} path="/use-effect" />
            <${SignalPage} path="/signal" />
            <${ControllFlowPage} path="/controll-flow" />
            <${ApiAccessPage} path="/api-access" />
          <//>
        </div>

        <div class="drawer-side overflow-y-auto">
          <label for="drawer" class="drawer-overlay"></label>
          <${Drawer} />
        </div>
      </div>
    </div>
  """)


renderApp(App, document.getElementById("app"))
