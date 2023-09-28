# Package

version       = "0.1.0"
author        = "Anonymous"
description   = "A new awesome nimble package"
license       = "MIT"

# Dependencies

requires "nim >= 1.6.10"
requires "cligen >= 1.5.39"
requires "palladian >= 0.0.1"

import std/os
task docs, "generate nim api docs":
  rmDir(getCurrentDir() /  "docs")
  let cmd = "nim doc -b:js --project --index:on --outdir:docs app.nim"
  exec(cmd)
