import std/dom
import std/jsconsole
import ../../src/palladian/solid
import ./consts
import ./components/header
import ./components/drawer
import ./pages/top_page
# import ./pages/getting_start_page
import ./pages/use_state_page
import ./pages/effect_system_page
import ./pages/signal_page
import ./pages/controll_flow_page
import ./pages/api_access_page


proc App():Component {.exportc.} =
  return html(fmt"""
    <div class="min-h-screen max-h-screen overflow-hidden">
      <${Router}>
        <${Header} />
        <div class="drawer drawer-mobile">
          <input id="drawer-id" type="checkbox" class="drawer-toggle"/>

          <div class="drawer-content bg-base-200 pb-16">
            <${Routes}>
              <${Route} path="${BASE_URL}" element=${TopPage} />
            <//>
            <br />
          </div>

          <div class="drawer-side">
            <label for="drawer-id" class="drawer-overlay"></label>
            <${Drawer} />
          </div>
        </div>
      <//>
    </div>
  """)


render(App, document.getElementById("app"))

# <${Route} path="${BASE_URL}/getting-start" element=${GettingStartPage} />
# <${Route} path="${BASE_URL}/use-state" element=${UseStatePage} />
# <${Route} path="${BASE_URL}/signal" element=${SignalPage} />
# <${Route} path="${BASE_URL}/effect-system" element=${EffectSystemPage} />
# <${Route} path="${BASE_URL}/controll-flow" element=${ControllFlowPage} />
# <${Route} path="${BASE_URL}/api-access" element=${ApiAccessPage} />