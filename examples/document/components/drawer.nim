import std/dom
import std/jsffi
import std/jsconsole
import ../../../src/palladian
import ../../../src/palladian/format
import ../settings


proc Drawer*(props:ComponentProps):Component {.exportc.} =
  proc changeDrawer(e:Event) {.exportc.} =
    let drawerStatus = document.getElementById("drawer-id")
    drawerStatus.checked = not drawerStatus.checked

  return html(fmt"""
    <ul class="min-h-screen menu p-4 w-80 bg-base-100 text-base-content">
      <!-- Sidebar content here -->
      <li><${Link} href="${BASE_URL}/" activeClassName="active" onclick=${changeDrawer}>Top<//></li>
      <li><${Link} href="${BASE_URL}/use-state" activeClassName="active" onclick=${changeDrawer}>useState<//></li>
      <li><${Link} href="${BASE_URL}/effect-system" activeClassName="active" onclick=${changeDrawer}>Effect system<//></li>
      <li><${Link} href="${BASE_URL}/signal" activeClassName="active" onclick=${changeDrawer}>Signal<//></li>
      <li><${Link} href="${BASE_URL}/controll-flow" activeClassName="active" onclick=${changeDrawer}>controll flow<//></li>
      <li><${Link} href="${BASE_URL}/api-access" activeClassName="active" onclick=${changeDrawer}>api access<//></li>
    </ul>
  """)
