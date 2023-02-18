import jsffi
import ../../../src/palladian
import ../../../src/palladian/strformat


proc Drawer*():Component {.exportc.} =
  return html(fmt"""
    <div>
      <label for="my-drawer-2"></label>
      <ul class="menu p-4 w-80 bg-base-100 text-base-content">
        <!-- Sidebar content here -->
        <li><${Link} href="/" activeClassName="active">Top<//></li>
        <li><${Link} href="/use-state" activeClassName="active">useState<//></li>
        <li><${Link} href="/use-effect" activeClassName="active">useEffect<//></li>
        <li><${Link} href="/signal" activeClassName="active">signal<//></li>
        <li><${Link} href="/controll-flow" activeClassName="active">controll flow<//></li>
        <li><${Link} href="/api-access" activeClassName="active">api access<//></li>
      </ul>
    </div>
  """)
