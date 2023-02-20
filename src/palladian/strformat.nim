import std/macros
import ./preact

# macro getProcNameMacroForComponent(arg:untyped):untyped =
#   let procName = strVal(arg)
#   result = quote do:
#     block:
#       `procName`

# template `$`*(arg:proc():Component):untyped =
#   block:
#     let procName = getProcNameMacroForComponent(arg)
#     proc getProcName():cstring =
#       return "${".cstring & procName.cstring & "}".cstring
#     getProcName()

# # ==================================================
# macro getProcNameMacroForJsObject(arg:untyped):untyped =
#   echo "===== getProcNameMacroForJsObject"
#   echo arg.repr
#   let procName = strVal(arg)
#   result = quote do:
#     block:
#       `procName`

# template `$`*(arg:JsObject):untyped =
#   block:
#     let procName = getProcNameMacroForJsObject(arg)
#     proc getProcName():cstring =
#       return "${".cstring & procName.cstring & "}".cstring
#     getProcName()

# template `$`*(arg:proc(e:Event)):untyped =
#   block:
#     let procName = getProcNameMacroForJsObject(arg)
#     proc getProcName():cstring =
#       return "${".cstring & procName.cstring & "}".cstring
#     getProcName()

# ==================================================

proc fmt*(arg:cstring):cstring {.importjs: "#".}
  ## for just easy to look JSX with no effect.
template fmt*(arg:string):cstring = fmt(arg.cstring)
  ## for just easy to look JSX with no effect.
