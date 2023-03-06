import std/dom
import std/jsffi

proc scrollTo*(el:Element, x, y:int) {.importjs:"#.scrollTo(#, #)".}
