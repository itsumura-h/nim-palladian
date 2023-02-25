import std/os
import std/osproc
import std/strutils

proc build*(baseUrl="") =
  ## Build app.nim for production.
  ## 
  var isInProjectDir = false
  for (kind, path) in walkDir(getCurrentDir()):
    if path.contains(".nimble"):
      isInProjectDir = true
  if not isInProjectDir:
    raise newException(Exception, "Run command in directory which contains nimble file")

  removeDir("dist")
  createDir("dist")
  copyDir("public", "dist/public")
  echo execProcess("nim js -d:release -d:nimExperimentalAsyncjsThen -o:dist/public/app.js app")
  copyFile("index.html", "dist/index.html")
  block:
    var content = readFile("dist/index.html")
    var f = open("dist/index.html" , fmWrite)
    defer: close(f)
    echo getEnv("PRODUCTION_BASE_URL")
    content = content.replace("{% BASE_URL %}", baseUrl)
    f.write(content)
