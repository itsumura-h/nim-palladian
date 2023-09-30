import std/osproc
import std/strutils
import std/strformat

proc add*(dev=false, args:seq[string]):int =
  ## = `bun add xx`. Add a dependency to package.json
  let packages = args.join(" ")
  let isDev = if dev: "-d" else: ""
  echo execProcess(&"bun add {isDev} {packages}")
