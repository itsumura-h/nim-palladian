import std/os
import std/osproc
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
  <script type="module" src="{% BASE_URL %}/public/app.js"></script>
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
dist

# Based on https://raw.githubusercontent.com/github/gitignore/main/Node.gitignore

# Logs

logs
_.log
npm-debug.log_
yarn-debug.log*
yarn-error.log*
lerna-debug.log*
.pnpm-debug.log*

# Diagnostic reports (https://nodejs.org/api/report.html)

report.[0-9]_.[0-9]_.[0-9]_.[0-9]_.json

# Runtime data

pids
_.pid
_.seed
\*.pid.lock

# Directory for instrumented libs generated by jscoverage/JSCover

lib-cov

# Coverage directory used by tools like istanbul

coverage
\*.lcov

# nyc test coverage

.nyc_output

# Grunt intermediate storage (https://gruntjs.com/creating-plugins#storing-task-files)

.grunt

# Bower dependency directory (https://bower.io/)

bower_components

# node-waf configuration

.lock-wscript

# Compiled binary addons (https://nodejs.org/api/addons.html)

build/Release

# Dependency directories

node_modules/
jspm_packages/

# Snowpack dependency directory (https://snowpack.dev/)

web_modules/

# TypeScript cache

\*.tsbuildinfo

# Optional npm cache directory

.npm

# Optional eslint cache

.eslintcache

# Optional stylelint cache

.stylelintcache

# Microbundle cache

.rpt2_cache/
.rts2_cache_cjs/
.rts2_cache_es/
.rts2_cache_umd/

# Optional REPL history

.node_repl_history

# Output of 'npm pack'

\*.tgz

# Yarn Integrity file

.yarn-integrity

# dotenv environment variable files

.env
.env.development.local
.env.test.local
.env.production.local
.env.local

# parcel-bundler cache (https://parceljs.org/)

.cache
.parcel-cache

# Next.js build output

.next
out

# Nuxt.js build / generate output

.nuxt
dist

# Gatsby files

.cache/

# Comment in the public line in if your project uses Gatsby and not Next.js

# https://nextjs.org/blog/next-9-1#public-directory-support

# public

# vuepress build output

.vuepress/dist

# vuepress v2.x temp and cache directory

.temp
.cache

# Docusaurus cache and generated files

.docusaurus

# Serverless directories

.serverless/

# FuseBox cache

.fusebox/

# DynamoDB Local files

.dynamodb/

# TernJS port file

.tern-port

# Stores VSCode versions used for testing VSCode extensions

.vscode-test

# yarn v2

.yarn/cache
.yarn/unplugged
.yarn/build-state.yml
.yarn/install-state.gz
.pnp.\*

# IntelliJ based IDEs
.idea

# Finder (MacOS) folder config
.DS_Store
"""

const APP_BODY = """
import std/dom
import std/jsffi
import palladian
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
            <li>Resolving library dependencies thanks to <a href="https://bun.sh/" target="_blank">Bun</a> without NodeJS.</li>
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


proc create(dirPath, packageName:string):int =
  try:
    createDir(dirPath)
    # create empty dirs
    createDir(&"{dirPath}/components")
    createDir(&"{dirPath}/pages")
    createDir(&"{dirPath}/public")
    createDir(&"{dirPath}/tests")

    # create files
    block:
      let f = open(&"{dirPath}/{packageName}.nimble", fmWrite)
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

    echo &"""
Successfully created a new palladian project "{packageName}"

{packageName}
├── app.nim
├── components
├── index.html
├── pages
│   ├── about_page.nim
│   └── top_page.nim
├── public
├── {packageName}.nimble
└── tests
"""

    block:
      setCurrentDir(dirPath)
      echo execProcess("yes | bun init")
      removeFile("./y")
      removeFile("./tsconfig.json")
      removeFile("readme.md")

    block:
      var packageJson = readFile("./package.json")
      packageJson = packageJson.replace("\"y\"", &"\"{packageName}\"")
      writeFile("./package.json", packageJson)

    block:
      echo execProcess("bun add preact htm @preact/signals preact-router")


    return 0
  except:
    echo getCurrentExceptionMsg()
    removeDir(dirPath)
    return 1


proc new*(args:seq[string]):int =
  ## Create new project
  var
    message:string
    packageName:string
    dirPath:string

  try:
    if args[0] == ".":
      dirPath = getCurrentDir()
      packageName = dirPath.split("/")[^1]
    else:
      packageName = args[0]
      dirPath = getCurrentDir() & "/" & packageName
      if dirExists(dirPath): return 0
  except:
    message = "Missing args"
    styledWriteLine(stdout, fgRed, bgDefault, message, resetStyle)
    return 0

  message = &"create Nim frontend palladian project {dirPath}"

  return create(dirPath, packageName)
