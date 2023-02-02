import ../../../src/palladian/preact

proc About():Component {.exportc.} =
  return html("""
    <div>
      <h1>About</h1>
      <${Link} href="/">home<//>
    </div>
  """)
