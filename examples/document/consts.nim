import std/dom
import ../../src/palladian
include ../../src/palladian/sugar

let BaseUrl* {.jso.} :cstring = "/nim-palladian"
let PalladianLogoUrl* {.jso.} :cstring =
  when defined(release):
    ($BaseUrl & "/public/favicon32.png").cstring
  else:
    "/public/favicon32.png".cstring

var drawerContentRef* {.jso.}:RefObject
var drawerStatusRef* {.jso.}:RefObject
