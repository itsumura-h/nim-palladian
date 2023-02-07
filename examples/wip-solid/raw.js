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
} from "https://cdn.jsdelivr.net/npm/solid-js@1.6.10/+esm";
import {render} from "https://cdn.jsdelivr.net/npm/solid-js@1.6.10/web/+esm";
// import html from "https://cdn.jsdelivr.net/npm/solid-js@1.6.10/html/+esm";
import { Router, Routes, Route, A } from "https://cdn.jsdelivr.net/npm/@solidjs/router@0.7.0/+esm";
import {createHTML} from "https://cdn.jsdelivr.net/npm/lit-dom-expressions@0.35.15/+esm";

const html = createHTML({});


function Page1() {
  return html`<h2>page1</h2>`;
}

function Page2() {
  return html`<h2>page2</h2>`;
}

function Page3() {
  return html`<h2>page3</h2>`;
}

function Parent() {
  return html`
    <div>
      <${A} href="/">page1<//>
      <${A} href="/page2">page2<//>
      <${A} href="/page3">page3<//>
      <${Routes}>
        <${Route} path="/" component=${()=> Page1} />
        <${Route} path="/page2" component=${()=> Page2} />
        <${Route} path="/page3" component=${()=> Page3} />
      <//>
    </div>
  `;
}

function App() {
  return html`
    <${Router}>
      <${Parent} />
    <//>
  `;
}

render(App, document.getElementById('app'));
