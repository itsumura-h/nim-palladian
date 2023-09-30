import std/osproc
import std/strutils
import std/strformat

proc remove*(args:seq[string]):int =
  ## = `bun remove xx`. Remove a dependency from package.json
  let packages = args.join(" ")
  echo execProcess(&"bun remove {packages}")
