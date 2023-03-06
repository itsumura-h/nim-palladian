import ../../src/palladian/lib

let BaseUrl* {.exportc.} :cstring = "/nim-palladian"
let PalladianLogoUrl* {.exportc.} :cstring =
  when defined(release):
    ($BaseUrl & "/public/favicon32.png").cstring
  else:
    "/public/favicon32.png".cstring

var drawerContentRef* {.exportc.}:RefObject