import std/dom
import std/jsffi
import ../../../src/palladian
import ../consts


let componentCode {.exportc.} :cstring = """
proc Title*(props:ComponentProps):Component {.exportc.} =
  let props {.exportc.} = props
  return html(\"\""
    <h1>${props.children}</h1>
  \"\"")
"""

let taggedTemplateCode {.exportc.} :cstring = """
html`<p>hello</p>` // JavaScript
html("<p>hello</p>") // Nim
"""

proc HowToCreateComponentPage*(props:ComponentProps):Component {.exportc.} =
  document.title = "How to create component / Nim Palladian"

  # useLayoutEffect(proc() =
  #   let el = drawerContentRef.current
  #   el.scrollTo(0, 0)
  # , [])

  return html(fmt"""
    <${ScrollTop}>
      <${Article}>
        <h1>How to create component</h1>
        <p>
          Palladian uses HTM (Hyperscript Tagged Markup) in JavaScript to create the dom.<br/>
          See also<br/>
          <a href="https://github.com/developit/htm" target="_blank">HTM - Github</a><br/>
          <a href="https://preactjs.com/guide/v10/getting-started#alternatives-to-jsx" target="_blank">Preact - Alternatives to JSX</a>
        </p>
        <${CodeBlock} lang="nim">
          ${componentCode}
        <//>
        <p>
          Here are a few things you need to remember to make the component.
          <${Ul}>
            <li>Type of props is <code>ComponentProps</code>. This has a <code>children</code> member.</li>
            <li>Componet have to return <code>Component</code> object.</li>
            <li>Variables whitch is called in HTM have to be without suffix after compiled and must be declared with <code>{.exportc.}</code></li>
            <li>HTM's <code>html</code> tagged template literals are represented in Nim by the <code>html</code> function.</li>
            <${CodeBlock} lang="js">
              ${taggedTemplateCode}
            <//>
          <//>
        </p>
      <//>
    <//>
  """)
