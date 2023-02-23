import std/jsffi

proc fmt*(arg:cstring):cstring {.importjs: "#".}
  ## for just easy to look JSX in IDE with no effect.
template fmt*(arg:string):cstring = fmt(arg.cstring)
  ## for just easy to look JSX in IDE with no effect.
