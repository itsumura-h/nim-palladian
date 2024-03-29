import std/dom
import ../../../src/palladian
import ../consts


proc scrollTo(el:Element, x, y:int) {.importjs: "#.scrollTo(#, #)".}

proc ScrollTop*(props:ComponentProps):Component {.exportc.} =
  let props {.exportc.} = props
  useLayoutEffect(proc() =
    let el = drawerContentRef.current
    el.scrollTo(0, 0)
  , [])

  return html("${props.children}")
