import {h, render} from 'https://esm.sh/preact@10.12.1'
import htm from 'https://esm.sh/htm@3.1.1'
import { useState, useEffect, useMemo } from 'https://esm.sh/preact@10.12.1/hooks';
import { signal } from 'https://esm.sh/@preact/signals@1.1.3?deps=preact@10.12.1';
import {Router, Link} from 'https://esm.sh/preact-router@4.1.0?deps=preact@10.12.1';

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

  useEffect(async()=>{
    let resp = await fetch("https://api.coindesk.com/v1/bpi/currentprice.json")
    const json = await resp.json()
    console.log(json)
  }, [])

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

render(html`<${App} name="Preact" />`, document.getElementById("app"));
