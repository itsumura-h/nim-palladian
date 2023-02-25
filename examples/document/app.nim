import std/dom
import std/jsconsole
import ../src/palladian
import ../src/palladian/hooks
import ../src/palladian/format
import ../src/palladian/router
import ./components/header
import ./components/drawer
import ./pages/top_page
import ./pages/use_state_page
import ./pages/effect_system_page
import ./pages/signal_page
import ./pages/controll_flow_page
import ./pages/api_access_page


proc App():Component {.exportc.} =
  return html(fmt"""
    <div class="min-h-screen max-h-screen overflow-hidden">
      <${Header} />
      <div class="drawer drawer-mobile">
        <input id="drawer-id" type="checkbox" class="drawer-toggle"/>

        <div class="drawer-content bg-base-200 pb-16">
          <${Router}>
            <${TopPage} path="/" />
            <${UseStatePage} path="/use-state" />
            <${SignalPage} path="/signal" />
            <${EffectSystemPage} path="/effect-system" />
            <${ControllFlowPage} path="/controll-flow" />
            <${ApiAccessPage} path="/api-access" />
          <//>
          <br />
        </div>

        <div class="drawer-side">
          <label for="drawer-id" class="drawer-overlay"></label>
          <${Drawer} />
        </div>
      </div>
    </div>
  """)


renderApp(App, document.getElementById("app"))