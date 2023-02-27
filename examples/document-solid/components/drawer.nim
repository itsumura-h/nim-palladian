import std/dom
import std/jsffi
import std/jsconsole
import ../../../src/palladian/solid
import ../consts


proc Drawer*(props:ComponentProps):Component {.exportc.} =
  proc changeDrawer(e:Event) {.exportc.} =
    let drawerStatus = document.getElementById("drawer-id")
    console.log("=== Drawer")
    console.log(drawerStatus)
    drawerStatus.checked = not drawerStatus.checked

  return html(fmt"""
    <ul class="min-h-screen menu p-4 w-80 bg-base-100 text-base-content">
      <!-- Sidebar content here -->
      <li><${A} href="${BASE_URL}" activeClassName="active" onclick=${changeDrawer}>Top<//></li>
      <li><${A} href="${BASE_URL}/getting-start" activeClassName="active" onclick=${changeDrawer}>Getting start<//></li>
      <li><${A} href="${BASE_URL}/use-state" activeClassName="active" onclick=${changeDrawer}>createSignal<//></li>
      <li><${A} href="${BASE_URL}/effect-system" activeClassName="active" onclick=${changeDrawer}>Effect system<//></li>
      <li><${A} href="${BASE_URL}/signal" activeClassName="active" onclick=${changeDrawer}>Signal<//></li>
      <li><${A} href="${BASE_URL}/controll-flow" activeClassName="active" onclick=${changeDrawer}>controll flow<//></li>
      <li><${A} href="${BASE_URL}/api-access" activeClassName="active" onclick=${changeDrawer}>api access<//></li>
    </ul>
  """)
