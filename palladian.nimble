# Package

version       = "0.2.0"
author        = "Hidenobu Itsumura @dumblepytech1 as 'medy'"
description   = "A Frontend Web Framework for Nim based on Preact"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
skipFiles     = @["server.nim"]
skipDirs      = @["palladian/cli"]
bin           = @["palladian/cli/palladian_cli"]
binDir        = "src/bin"

# Dependencies

requires "nim >= 1.6.10"
requires "cligen >= 1.5.39"


import std/os

task docs, "generate nim api docs":
  rmDir(getCurrentDir() /  "docs")
  let cmd = "nim doc -d:doc -b:js --project --index:on --outdir:docs src/palladian.nim"
  exec(cmd)
