import std/dom
import std/jsffi
import ../../../src/palladian/solid
import ../components/text_body

proc GettingStartPage*(props:ComponentProps):Component {.exportc.} =
  document.title = "Getting start / Nim Palladian"

  return html(fmt"""
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
          palladian new sample_project
        <//>
      </p>
      <p>
        You can create directory first and then create a project within that directory.<br/>
        <${CodeBlock} lang="shell">
          mkdir sample_project
cd sample_project
palladian new .
        <//>
      </p>

      <h2>Start the development server</h2>
      <p>
        You can start the development server using <code>dev</code> command<br/>
        <${CodeBlock} lang="shell">
          cd sample_project
palladian dev
        <//>
        By default, the development server starts on port 3000. You can also change the port number to start using the <code>-p</code> option.<br/>
        <${CodeBlock} lang="shell">
          palladian dev -p 3001
        <//>
      </p>

      <h2>production build</h2>
      <p>
        Use the <code>build</code> command to output a JavaScript file optimized for production use.<br/>
        A <code>dist</code> directory will be created in the project directory, and the output will be in that directory.
        <${CodeBlock} lang="shell">
          palladian build
        <//>
      </p>
    <//>
  """)
