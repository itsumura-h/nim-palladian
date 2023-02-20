import {h, render} from 'https://esm.sh/preact@10.12.1'
import htm from 'https://esm.sh/htm@3.1.1'
import { useState, useEffect, useMemo } from 'https://esm.sh/preact@10.12.1/hooks';
import { signal } from 'https://esm.sh/@preact/signals@1.1.3?deps=preact@10.12.1';
import {Router, Link} from 'https://esm.sh/preact-router@4.1.0?deps=preact@10.12.1';

const html = htm.bind(h);

function Nav(){
  return html`
    <${Link} href="/">page1<//><span>   </span><${Link} href="/page2">page2<//>
  `
}

function page1(){
  useEffect(()=>{
    Prism.highlightAll()
  })

  let code = `
    proc Counter():Component {.exportc.} =
      let (value {.exportc.}, setValue) = useState(0);

      proc increment(e:Event) {.exportc.} =
        setValue(value + 1)

      proc decrement(e:Event) {.exportc.} =
        setValue(value - 1)

      return html("""
        <div>Counter: {value}</div>
        <button onClick=\${increment}>Increment</button>
        <button onClick=\${decrement}>Decrement</button>
      """)
  `.replace("\\", "")
  console.log(code)
  let content = "    <h1>Page1</h1>\n    <pre><code class=\"language-js\">\n      ${code}\n    </code></pre>  "
  return eval('html`' + content +  '`')
}

function page2(){
  useEffect(()=>{
    Prism.highlightAll()
  })

  let code = `
    function fuga(){
      console.log("fuga")
    }
  `
  let content = `
    <h1>Page2</h1>
    <pre><code class="language-js">
      ${code}
    </code></pre>
  `
  return eval('html`' + content + '`')
}

function App (props) {
  return html`
    <h1>Hello ${props.name}!</h1>
    <${Nav} />
    <${Router}>
      <${page1} path="/" />
      <${page2} path="/page2" />
    <//>
  `;
}

render(html`<${App} name="Preact" />`, document.getElementById("app"));
