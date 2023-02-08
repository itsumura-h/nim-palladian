import ../../../src/palladian
import ../components/parent

proc Home():Component {.exportc.} =
  return html("""
    <div>
      <h1>Home</h1>
      <${Link} href="/about">about<//>
      <hr/>
      <${Parent} name="preact" />
    </div>
  """)
