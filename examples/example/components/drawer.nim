import jsffi
import ../../../src/palladian
import ../../../src/palladian/strformat


proc Drawer*():Component {.exportc.} =
  return html(fmt"""
    <div class="drawer drawer-mobile overflow-y-auto">
      <div class="drawer-side">
        <label for="my-drawer-2"></label>
        <ul class="menu p-4 w-80 bg-base-100 text-base-content">
          <!-- Sidebar content here -->
          <li><${Link} href="/" activeClassName="active">Top<//></li>
          <li><${Link} href="/a" activeClassName="active">a<//></li>
          <li><${Link} href="/b" activeClassName="active">b<//></li>
          <li><${Link} href="/c" activeClassName="active">c<//></li>
          <li><${Link} href="/" activeClassName="active">Top<//></li>
          <li><${Link} href="/a" activeClassName="active">a<//></li>
          <li><${Link} href="/b" activeClassName="active">b<//></li>
          <li><${Link} href="/c" activeClassName="active">c<//></li>
          <li><${Link} href="/" activeClassName="active">Top<//></li>
          <li><${Link} href="/a" activeClassName="active">a<//></li>
          <li><${Link} href="/b" activeClassName="active">b<//></li>
          <li><${Link} href="/c" activeClassName="active">c<//></li>
          <li><${Link} href="/" activeClassName="active">Top<//></li>
          <li><${Link} href="/a" activeClassName="active">a<//></li>
          <li><${Link} href="/b" activeClassName="active">b<//></li>
          <li><${Link} href="/c" activeClassName="active">c<//></li>
          <li><${Link} href="/" activeClassName="active">Top<//></li>
          <li><${Link} href="/a" activeClassName="active">a<//></li>
          <li><${Link} href="/b" activeClassName="active">b<//></li>
          <li><${Link} href="/c" activeClassName="active">c<//></li>
          <li><${Link} href="/" activeClassName="active">Top<//></li>
          <li><${Link} href="/a" activeClassName="active">a<//></li>
          <li><${Link} href="/b" activeClassName="active">b<//></li>
          <li><${Link} href="/c" activeClassName="active">c<//></li>
        </ul>
      </div>
    </div>
  """)
