import std/dom
import std/jsffi
import std/jsconsole
import ../../../src/palladian
import ../../../src/palladian/format


proc Drawer*(props:ComponentProps):Component {.exportc.} =
  proc changeDrawer(e:Event) {.exportc.} =
    let drawerStatus = document.getElementById("drawer-id")
    drawerStatus.checked = not drawerStatus.checked

  return html(fmt"""
    <ul class="min-h-screen menu p-4 w-80 bg-base-100 text-base-content">
      <!-- Sidebar content here -->
      <li><${Link} href="/" activeClassName="active" onclick=${changeDrawer}>Top<//></li>
      <li><${Link} href="/use-state" activeClassName="active" onclick=${changeDrawer}>useState<//></li>
      <li><${Link} href="/use-effect" activeClassName="active" onclick=${changeDrawer}>useEffect<//></li>
      <li><${Link} href="/signal" activeClassName="active" onclick=${changeDrawer}>signal<//></li>
      <li><${Link} href="/controll-flow" activeClassName="active" onclick=${changeDrawer}>controll flow<//></li>
      <li><${Link} href="/api-access" activeClassName="active" onclick=${changeDrawer}>api access<//></li>
    </ul>
  """)
