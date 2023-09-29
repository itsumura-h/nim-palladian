import std/os
import std/osproc
import std/re
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
  echo execProcess("nim js -d:release -d:nimExperimentalAsyncjsThen -o:dist/public/app.js app.nim")
  
  block:
    var appJs = readFile("./dist/public/app.js")
    # html`"a"`; => html`a`;
    appJs = appJs.replace("html`\"", "html`")
    appJs = appJs.replace("\"`;", "`;")
    # arr["a"]        => arr["a"]
    # arr[\\\"a\\\"]  => arr[\\\"a\\\"]
    # arr[\"a\"]      => arr["a"]
    appJs = appJs.replace(re(""" \[(?<!\\)\\{1}"  """.strip()), "[\"")
    appJs = appJs.replace(re(""" (?<!\\)\\{1}"\]  """.strip()), "\"]")
    ## ${user=> html`<p>${user.name}</p>`}
    appJs = appJs.replace("=>\\n", "=>")
    appJs = appJs.replace("`\\n", "`")

    writeFile("./dist/public/app.js", appJs)

  echo execProcess("bun build ./dist/public/app.js --outdir ./dist/public --format esm --minify")

  copyFile("index.html", "dist/index.html")
  block:
    var content = readFile("dist/index.html")
    echo getEnv("PRODUCTION_BASE_URL")
    content = content.replace("{% BASE_URL %}", baseUrl)
    writeFile("dist/index.html", baseUrl)
