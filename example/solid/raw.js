import { render } from "https://cdn.skypack.dev/solid-js/web";
import html from "https://cdn.skypack.dev/solid-js/html";
import {
  createSignal,
  createEffect,
  onCleanup,
  For,
  Show,
} from "https://cdn.skypack.dev/solid-js";
import { Router, Routes, Route, A } from "https://cdn.jsdelivr.net/npm/@solidjs/router@0.7/+esm";

function Page1(){
  return html`<h2>page1</h2>`
}

function Page2(){
  return html`<h2>page2</h2>`
}

function Page3(){
  return html`<h2>page3</h2>`
}

function Parent(){
  return html`
    <div>
      <${A} href="/page1">page1<//>
      <${A} href="/page2">page2<//>
      <${A} href="/page3">page3<//>
      <${Routes}>
        <${Route} path="/page1" element=${html`<${Page1} />`} />
        <${Route} path="/page2" element=${()=>html`<${Page2} />`} />
        <${Route} path="/page3" component=${Page3} />
      <//>
    </div>
  `
}

function App(){
  return html`
    <${Router}>
      <${Parent} />
    <//>
  `
}

render(App, document.getElementById('app'))