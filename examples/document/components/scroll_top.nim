import std/dom
import std/jsffi
import ../../../src/palladian
import ../consts
include ../../../src/palladian/sugar

proc scrollTo(el:Element, x, y:int) {.importjs:"#.scrollTo(#, #)".}

component ScrollTop:
  let props {.jso.} = props
  useLayoutEffect(proc() = drawerContentRef.current.scrollTo(0, 0), [])

  fmt"${props.children}"
