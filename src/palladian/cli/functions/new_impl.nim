import std/os
import std/strutils
import std/strformat
import std/terminal

const HTML_BODY = """
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Nim Palladian</title>
</head>
<body>
  <div id="app"></div>
  <script type="module" src="/public/app.js"></script>
</body>
</html>
"""

const GITIGNORED = """
# Binaries
*
!*.*
!*/

app.js
*.out
"""

const APP_BODY = """
import std/dom
import std/jsffi
import palladian
import palladian/hooks
import palladian/format
import palladian/router
import ./pages/top_page
import ./pages/about_page


proc App():Component {.exportc.} =
  return html(fmt\"\""
    <style>
      body {
        background-color:#333333;
      }
      article {
        margin: 16px;
      }
      .title {
        color: goldenrod;
        text-align: center;
      }
      .goldFont {
        color: goldenrod;
      }
      .whiteFont {
        color: silver;
      }
      ul li {
        margin: 8px;
      }
      a {
        color: skyblue;
      }
    </style>
    <article>
      <section>
        <h1 class="title">Nim Palladian is successfully running!!!</h1>
      </section>
    </article>
    <${Router}>
      <${TopPage} path="/" />
      <${AboutPage} path="/about" />
    <//>
  \"\"")

renderApp(App, document.getElementById("app"))
"""

const TOP_PAGE_BODY = """
import std/dom
import std/jsffi
import palladian
import palladian/hooks
import palladian/format
import palladian/router


proc TopPage*():Component {.exportc.} =
  return html(fmt\"\""
    <article>
      <section>
        <h2 class="goldFont">
          Frontend Web Framewrok for Nim
        </h2>
        <p class="whiteFont">
          <i>―― Palladian is a contemporary interpretation of Greek and Roman architecture, a simple and compact expression of complex classical design.</i>
        </p>
        <div class="whiteFont">
          <ul>
            <li>Easy syntax thanks to Nim.</li>
            <li>Extensive assets by JavaScript.</li>
            <li>Static typing and compile-time checks for JavaScript thanks to Nim make it a type-safe development experience and easier to understand type mismatch than TypeScript.</li>
            <li>The evolution of CDN that allow development without NodeJS.</li>
            <li>Resolving library dependencies thanks to <a href="https://esm.sh/" target="_blank">esm.sh</a> without NodeJS and <code>package.json</code>.</li>
          </ul>
        </div>
      </section>
    </article>
    <article>
      <section>
        <p class="whiteFont">
          ===> <${Link} href="/about">see about page<//>
        </p>
      </section>
    </article>
  \"\"")
"""

const ABOUT_PAGE_BODY = """
import std/dom
import std/jsffi
import palladian
import palladian/hooks
import palladian/format
import palladian/router


proc AboutPage*():Component {.exportc.} =
  let (stringState {.exportc.}, setStringState) = useState("")
  let (stringCount {.exportc.}, setStringCount) = useState(0)

  proc updateState(e:Event) {.exportc.} =
    setStringState(e.target.value)

  useEffect(proc() =
    setStringCount(stringState.len)
  , @[stringState])

  return html(fmt\"\""
    <article>
      <section>
        <h2 class="goldFont">About</h2>
        <p class="whiteFont">
          You can use hooks in Nim!
        </p>
        <input type="text" oninput=${updateState} placeholder="Type here" class="input w-full" />
        <p class="whiteFont">${stringState}</p>
        <p class="whiteFont">count: ${stringCount}</p>
      </section>
    </article>
    <article>
      <section>
        <p class="whiteFont">
          ===> <${Link} href="/">back to top page<//>
        </p>
      </section>
    </article>
  \"\"")
"""

const NIMBLE_FILE = """
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
"""

proc create(dirPath, packageDir:string):int =
  echo dirPath
  echo packageDir

  try:
    createDir(dirPath)
    # create empty dirs
    createDir(&"{dirPath}/components")
    createDir(&"{dirPath}/pages")
    createDir(&"{dirPath}/public")
    createDir(&"{dirPath}/tests")
    # create files
    block:
      let f = open(&"{dirPath}/{packageDir}.nimble", fmWrite)
      defer: f.close()
      f.write(NIMBLE_FILE)

    block:
      let f = open(&"{dirPath}/index.html", fmWrite)
      defer: f.close()
      f.write(HTML_BODY.replace("\\", ""))

    block:
      let f = open(&"{dirPath}/.gitignore", fmWrite)
      defer: f.close()
      f.write(GITIGNORED.replace("\\", ""))

    block:
      let f = open(&"{dirPath}/app.nim", fmWrite)
      defer: f.close()
      f.write(APP_BODY.replace("\\", ""))

    block:
      let f = open(&"{dirPath}/pages/top_page.nim", fmWrite)
      defer: f.close()
      f.write(TOP_PAGE_BODY.replace("\\", ""))

    block:
      let f = open(&"{dirPath}/pages/about_page.nim", fmWrite)
      defer: f.close()
      f.write(ABOUT_PAGE_BODY.replace("\\", ""))

    return 0
  except:
    echo getCurrentExceptionMsg()
    removeDir(dirPath)
    return 1


proc new*(args:seq[string]):int =
  ## Create new project
  var
    message:string
    packageDir:string
    dirPath:string

  try:
    if args[0] == ".":
      dirPath = getCurrentDir()
      packageDir = dirPath.split("/")[^1]
    else:
      packageDir = args[0]
      dirPath = getCurrentDir() & "/" & packageDir
      if dirExists(dirPath): return 0
  except:
    message = "Missing args"
    styledWriteLine(stdout, fgRed, bgDefault, message, resetStyle)
    return 0

  message = &"create Nim frontend palladian project {dirPath}"

  return create(dirPath, packageDir)
