import std/dom
import std/jsffi
import std/jsconsole
import ../../../src/palladian
import ../consts


proc Drawer*(props:ComponentProps):Component {.exportc.} =
  proc changeDrawer(e:Event) {.exportc.} =
    let drawerStatus = document.getElementById("drawer-id")
    drawerStatus.checked = not drawerStatus.checked

  return html(fmt"""
    <ul class="min-h-screen menu p-4 w-80 bg-base-100 text-base-content">
      <!-- Sidebar content here -->
      <li><${Link} href="${BaseUrl}" activeClassName="active" onclick=${changeDrawer}>Top<//></li>
      <li><${Link} href="${BaseUrl}/getting-start" activeClassName="active" onclick=${changeDrawer}>Getting start<//></li>
      <li><${Link} href="${BaseUrl}/how-to-create-component" activeClassName="active" onclick=${changeDrawer}>How to create component<//></li>
      <ul class="pl-4">
        <h2 class="font-extrabold">Hooks</h2>
        <li><${Link} href="${BaseUrl}/use-state" activeClassName="active" onclick=${changeDrawer}>useState<//></li>
        <li><${Link} href="${BaseUrl}/effect-system" activeClassName="active" onclick=${changeDrawer}>Effect system<//></li>
        <li><${Link} href="${BaseUrl}/signal" activeClassName="active" onclick=${changeDrawer}>Signal<//></li>
      </ul>
      <li><${Link} href="${BaseUrl}/controll-flow" activeClassName="active" onclick=${changeDrawer}>controll flow<//></li>
      <li><${Link} href="${BaseUrl}/api-access" activeClassName="active" onclick=${changeDrawer}>api access<//></li>
    </ul>
  """)
