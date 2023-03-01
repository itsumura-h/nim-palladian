// import {
//   createSignal,
//   onCleanup,
// } from "https://cdn.skypack.dev/solid-js@1.6.10";
// import { render } from "https://cdn.skypack.dev/solid-js@1.6.10/web";
// import html from "https://cdn.skypack.dev/solid-js@1.6.10/html";
// import { Router, Routes, Route, A } from "https://cdn.skypack.dev/@solidjs/router@0.7.0";
// import {createHTML} "https://cdn.jsdelivr.net/npm/lit-dom-expressions@0.35.15/+esm";

import {
  createSignal,
  onCleanup,
} from "https://esm.sh/solid-js@1.6.11";
import {render} from "https://esm.sh/solid-js@1.6.11/web";
import { Router, Routes, Route, A } from "https://esm.sh/@solidjs/router@0.7.0?deps=solid-js@1.6.11";
import html from "https://esm.sh/solid-js@1.6.11/html";


function Page1() {
  return html`<h2>page1</h2>`;
}

function Page2() {
  return html`<h2>page2</h2>`;
}

function Page3() {
  return html`<h2>page3</h2>`;
}

function Parent(){
  return html`
    <div>
      <${A} href="/">page1<//>
      <${A} href="/page2">page2<//>
      <${A} href="/page3">page3<//>
      <${Routes}>
        <${Route} path="/" element=${Page1} />
        <${Route} path="/page2" element=${Page2} />
        <${Route} path="/page3" element=${Page3} />
      <//>
    </div>
  `;
}

function App() {
  return html`
    <${Router}>
      <${Parent} />
    <//>
  `
}

render(App, document.getElementById('app'));
