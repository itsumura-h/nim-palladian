import std/jsffi
import std/dom
import std/jsconsole
import std/strformat
import std/macros
import ./src/palladian/preact
import nodejs/jsstrformat

proc FuncA():Component {.exportc.} =
  return html("<p>a</p>")

macro getProcNameMacro(arg:untyped):untyped =
  let procName = arg.strVal
  result = quote do:
    block:
      `procName`

template `$`*(arg:proc():Component):untyped =
  block:
    let procName = getProcNameMacro(arg)
    proc getProcName():cstring =
      return "${".cstring & procName.cstring & "}".cstring
    getProcName()

console.log($FuncA)
echo fmt"aaa {FuncA}" # == "aaa FuncA"としたい
echo fmt"aaa {$FuncA}" # == "aaa FuncA"としたい
let body = document.body
echo fmt"aaa {$body}" # == "aaa FuncA"としたい
jsFmt:
  echo fmt"aaa {$FuncA}" # == "aaa FuncA"としたい
  echo fmt"aaa {body}" # == "aaa FuncA"としたい
