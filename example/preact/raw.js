import { h, render } from 'https://cdn.jsdelivr.net/npm/preact@10.11.3/+esm';
import htm from 'https://cdn.jsdelivr.net/npm/htm@3.1.1/+esm'
import { useState, useEffect, useMemo } from 'https://cdn.jsdelivr.net/npm/preact@10.11.3/hooks/+esm';
import {Router, Link} from 'https://cdn.jsdelivr.net/npm/preact-router@4.1.0/+esm';
import { signal } from 'https://cdn.jsdelivr.net/npm/@preact/signals@1.1.3/+esm';

const html = htm.bind(h);


let page1Signal = signal("a")
console.log(page1Signal)
console.log(typeof page1Signal)
console.log(page1Signal.value)
console.log(typeof page1Signal.value)

function page1(){
  function setPage1Singal(e){
    console.log("=== setPage1Singal")
    page1Signal.value = e.target.value
  }

  return html`
    <p>page1</p>
    <input type="text" value=${page1Signal} onInput=${setPage1Singal} />
    <p>${page1Signal.value}</p>
    <${Link} href="/page2">page2<//>
  `
}


let page2Signal = signal("b")

function page2(){
  function setPage2Singal(e){
    page2Signal.value = e.target.value
  }

  return html`
    <p>page2</p>
    <input type="text" value=${page2Signal} onInput=${setPage2Singal} />
    <p>${page2Signal.value}</p>
    <${Link} href="/">home<//>
  `
}

function display(){
  return html`
    <hr/>
    <h2>display</h2>
    <p>${page1Signal.value}</p>
    <p>${page2Signal.value}</p>
  `
}


function App (props) {
  return html`
    <h1>Hello ${props.name}!</h1>
    <${Router}>
      <${page1} path="/" />
      <${page2} path="/page2" />
    <//>
    <${display} />
  `;
}

render(html`<${App} name="Preact" />`, document.body);
