import std/dom
import std/jsffi
import ../../src/palladian
import ./components/header
import ./components/drawer
import ./pages/top_page
import ./pages/getting_start_page
import ./pages/how_to_create_component_page
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
        <input id="drawer-id" type="checkbox" class="drawer-toggle" ref=${drawerStatusRef}/>

        <div class="drawer-content bg-base-200 pb-16" ref=${drawerContentRef}>
          <${Router}>
            <${TopPage} path="${BaseUrl}" />
            <${GettingStartPage} path="${BaseUrl}/getting-start" />
            <${HowToCreateComponentPage} path="${BaseUrl}/how-to-create-component" />
            <${UseStatePage} path="${BaseUrl}/use-state" />
            <${EffectSystemPage} path="${BaseUrl}/effect-system" />
            <${SignalPage} path="${BaseUrl}/signal" />
            <${ControllFlowPage} path="${BaseUrl}/controll-flow" />
            <${ApiAccessPage} path="${BaseUrl}/api-access" />
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
