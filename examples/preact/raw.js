import {h, render} from 'https://esm.sh/preact@10.12.1'
import htm from 'https://esm.sh/htm@3.1.1'
import { useState, useEffect, useMemo } from 'https://esm.sh/preact@10.12.1/hooks';
import { signal } from 'https://esm.sh/@preact/signals@1.1.3?deps=preact@10.12.1';
import {Router, Link} from 'https://esm.sh/preact-router@4.1.0?deps=preact@10.12.1';

const html = htm.bind(h);

let Item = ({ v, k, f }) => f(v, k);

export function For({ each, children: f }) {
  let c = useMemo(() => new Map, []);
  // let value = each.value;
  let value;
  if(typeof each === "object"){
    if("value" in each){ // Signal
      value = each.value
    }else{ // JsObject
      value = each
    }
  }else if(typeof each === "function"){
    value = each()
  }else{
    value = each
  }
  console.log("==== For")
  console.log(value)
  console.log(Array.isArray(value))
  if (!Array.isArray(value)) return html`<${Item} v=${value} f=${f} />`;
  // return value.map((v, k, x) => c.get(v) || (c.set(v, x = html``<Item v=${v} k=${k} f=${f} />``), x));
  return value.map((v, k, x) => {
    console.log("===== loop")
    console.log({f})
    console.log({v, k, x})
    console.log(c.get(v) || (c.set(v, x = html`<${Item} v=${v} k=${k} f=${f} />`), x))
    return c.get(v) || (c.set(v, x = html`<${Item} v=${v} k=${k} f=${f} />`), x)
  });
}


function Loop(){
  const users = [
    {id:1, name:"Alice"},
    {id:2, name:"Bob"},
    {id:3, name:"Charlie"},
    {id:4, name:"Dave"},
  ]

  return html`
    <table>
      <${For} each=${users}>
        ${user=> html`<tr> <td>${user.id}</td><td>${user.name}</td> </tr>`}
      <//>
    </table>
  `
}

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

const Foo = () => {
  const [msg, setMsg] = useState("")

  useEffect(() => {
    // ここがコールバック関数
    console.log("Fooがマウントされました！");
    // ↓これがクリーンアップ関数
    return () => {
      console.log("Fooがアンマウントされる！");
    };
  });

  return html`
    <div>
      <input type="text" oninput=${e=> setMsg(e.target.value)}/>
      <p>${msg}</p>
    </div>
  `;
};

function App (props) {
  return html`
    <h1>Hello ${props.name}!</h1>
    <${Nav} />
    <${Router}>
      <${page1} path="/" />
      <${page2} path="/page2" />
    <//>
    <${Loop} />
    <${Foo} />
  `;
}

render(html`<${App} name="Preact" />`, document.getElementById("app"));
