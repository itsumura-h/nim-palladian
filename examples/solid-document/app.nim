import std/dom
import std/jsconsole
import ../../src/palladian/solid
import ./consts
import ./components/header
import ./components/drawer
import ./pages/top_page
# import ./pages/getting_start_page
# import ./pages/use_state_page
# import ./pages/effect_system_page
# import ./pages/signal_page
# import ./pages/controll_flow_page
# import ./pages/api_access_page


proc App():Component {.exportc.} =
  var drawerRef {.exportc.} :Element

  createEffect(proc() =
    console.log("=== createEffect")
    console.log(drawerRef)
  )

  return html(fmt"""
    <div class="min-h-screen max-h-screen overflow-hidden">
      <${Router}>
        <${Header} />
        <div class="drawer drawer-mobile">
          <input id="drawer-id" ref=${drawerRef} type="checkbox" class="drawer-toggle"/>

          <div class="drawer-content bg-base-200 pb-16">
            <p>aaaa</p>
          </div>

          <div class="drawer-side">
            <label for="drawer-id" class="drawer-overlay"></label>
            <${Drawer} drawer=${drawerRef}/>
          </div>
        </div>
      <//>
    </div>
  """)


render(App, document.getElementById("app"))

# <${Routes}>
#   <${Route} path="${BASE_URL}" element=${TopPage} />
#   <${Route} path="${BASE_URL}/getting-start" element=${GettingStartPage} />
#   <${Route} path="${BASE_URL}/use-state" element=${UseStatePage} />
#   <${Route} path="${BASE_URL}/signal" element=${SignalPage} />
#   <${Route} path="${BASE_URL}/effect-system" element=${EffectSystemPage} />
#   <${Route} path="${BASE_URL}/controll-flow" element=${ControllFlowPage} />
#   <${Route} path="${BASE_URL}/api-access" element=${ApiAccessPage} />
# <//>