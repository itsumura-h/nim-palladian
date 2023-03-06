import std/dom
import std/jsffi
import ../../../src/palladian
import ../components/text_body
import ../consts

let generatedHtml {.exportc.} :cstring = """
<!DOCTYPE html>
<html lang="en" data-theme="halloween">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="{% BASE_URL %}/public/typography.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/daisyui@2.50.0/dist/full.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="{% BASE_URL %}/public/prism.css">
    <script defer type="module" src="{% BASE_URL %}/public/app.js"></script>
    <title>Nim Palladian</title>
  </head>
  <body>
    <div id="app"></div>
    <script src="{% BASE_URL %}/public/prism.js"></script>
  </body>
</html>
"""

proc GettingStartPage*(props:ComponentProps):Component {.exportc.} =
  document.title = "Getting start / Nim Palladian"

  return html(fmt"""
    <${ScrollTop}>
      <${Article}>
        <h1>Getting Start</h1>
        <h2>Install Nim</h2>
        <p>
          Let's create Nim development environment.<br/>
          <a href="https://nim-lang.org/install.html" target="_blank">Install here</a>
        </p>

        <h2>Install Palladian</h2>
        <p>
          Install palladian by Github repository URL.<br/>
          <${CodeBlock} lang="shell">
              nimble install -y https://github.com/itsumura-h/nim-palladian
          <//>
        </p>

        <h2>Creating project</h2>
        <p>
          Creating project using <code>new</code> command.<br/>
          <${CodeBlock} lang="shell">
            palladian_cli new sample_project
          <//>
        </p>
        <p>
          You can create directory first and then create a project within that directory.<br/>
          <${CodeBlock} lang="shell">
            mkdir sample_project
  cd sample_project
  palladian_cli new .
          <//>
        </p>

        <h2>Start the development server</h2>
        <p>
          You can start the development server using <code>dev</code> command<br/>
          <${CodeBlock} lang="shell">
            cd sample_project
  palladian_cli dev
          <//>
          By default, the development server starts on port 3000. You can also change the port number to start using the <code>-p</code> option.<br/>
          <${CodeBlock} lang="shell">
            palladian_cli dev -p 3001
          <//>
        </p>

        <h2>Production build</h2>
        <p>
          Use the <code>build</code> command to output a JavaScript file optimized for production use.<br/>
          A <code>dist</code> directory will be created in the project directory, and the output will be in that directory.
          <${CodeBlock} lang="shell">
            palladian_cli build
          <//>
        </p>
        <p>
          The HTML file automatically generated at the start of the project has a section of <code>{% BASE_URL %}</code>. It is possible to embed a specific string here at build time.<br/>
          In the document example this will be replaced <code>https://itsumura-h.github.io/nim-palladian</code> by <code>-b / --baseUrl</code> option.
        </p>
        <${CodeBlock} lang="html">
          ${generatedHtml}
        <//>
        <${CodeBlock} lang="shell">
          palladian_cli build -b="https://itsumura-h.github.io/nim-palladian"
        <//>
      <//>
    <//>
  """)
