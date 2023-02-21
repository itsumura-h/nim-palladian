import std/os
import std/osproc
import std/strutils

proc build*() =
  ## Build app.nim for production.
  ## 
  var isInProjectDir = false
  for (kind, path) in walkDir(getCurrentDir()):
    if path.contains(".nimble"):
      isInProjectDir = true
  if not isInProjectDir:
    raise newException(Exception, "Run command in directory which contains nimble file")

  echo execProcess("nim js -d:release -d:nimExperimentalAsyncjsThen -o:public/app.js app")
