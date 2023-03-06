import ../../../src/palladian
import ../consts

proc Header*():Component {.exportc.} =
  return html(fmt"""
    <nav class="navbar bg-base-100 sticky top-0 z-50">
      <div class="flex-none">
        <label for="drawer-id" class="btn btn-square btn-ghost drawer-button lg:hidden"><svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="inline-block h-5 w-5 stroke-current md:h-6 md:w-6"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path></svg></label>
      </div>
      <div class="flex-1">
        <${Link} href="${BaseUrl}" class="btn btn-ghost normal-case text-xl">Nim palladian<//>
      </div>
    </nav>
  """)
