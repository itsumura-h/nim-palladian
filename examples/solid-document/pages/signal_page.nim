import std/dom
import std/math
import ../../../src/palladian/solid


let (boolSignal {.exportc.}, setBoolSignal) = createSignal(false)
let (intSignal {.exportc.}, setIntSignal) = createSignal(0)
let (floatSignal {.exportc.}, setFloatSignal) = createSignal(0.0)
let (stringSignal {.exportc.}, setStringSignal) = createSignal("")

proc updateBoolSignal(e:Event) {.exportc.} =
  setBoolSignal(not boolSignal())

proc updateIntSignal(e:Event) {.exportc.} =
  setIntSignal(intSignal() + 1)

proc updateFloatSignal(e:Event) {.exportc.} =
  setFloatSignal(round(floatSignal() + 0.1, 1))

proc updateStringSignal(e:Event) {.exportc.} =
  setStringSignal(e.target.value)

proc SignalComponentA():Component {.exportc.} =
  return html(fmt"""
    <div class="p-6">
      <p>signal component A</p>
      <p>Click here --> <button onclick=${updateBoolSignal} class="btn btn-primary">${()=> boolSignal().toString()}</button> </p>
      <p>Click here --> <button onclick=${updateIntSignal} class="btn btn-primary">${intSignal}</button> </p>
      <p>Click here --> <button onclick=${updateFloatSignal} class="btn btn-primary">${floatSignal}</button> </p>
      <input type="text" oninput=${updateStringSignal} value=${stringSignal} placeholder="Type here" class="input w-full" />
      <p>${stringSignal}</p>
    </div>
  """)

proc SignalComponentB():Component {.exportc.} =
  return html(fmt"""
    <div class="p-6">
      <p>signal component B</p>
      <p>Click here --> <button onclick=${updateBoolSignal} class="btn btn-primary">${()=> boolSignal().toString()}</button> </p>
      <p>Click here --> <button onclick=${updateIntSignal} class="btn btn-primary">${intSignal}</button> </p>
      <p>Click here --> <button onclick=${updateFloatSignal} class="btn btn-primary">${floatSignal}</button> </p>
      <input type="text" oninput=${updateStringSignal} value=${stringSignal} placeholder="Type here" class="input w-full" />
      <p>${stringSignal}</p>
    </div>
  """)

let signalCode {.exportc.} :cstring = """
import std/math

let boolSignal {.exportc.} = signal(false)
let intSignal {.exportc.} = signal(0)
let floatSignal {.exportc.} = signal(0.0)
let stringSignal {.exportc.} = signal("")

proc updateBoolSignal(e:Event) {.exportc.} =
  boolSignal.value = not boolSignal.value

proc updateIntSignal(e:Event) {.exportc.} =
  intSignal.value = intSignal.value + 1

proc updateFloatSignal(e:Event) {.exportc.} =
  floatSignal.value = round(floatSignal.value + 0.1, 1)

proc updateStringSignal(e:Event) {.exportc.} =
  stringSignal.value = e.target.value

proc SignalComponentA():Component {.exportc.} =
  return html(fmt\"\""
    <div class="p-6">
      <p>signal component A</p>
      <p>Click here --> <button onclick=${updateBoolSignal} class="btn btn-primary">${boolSignal.value.toString()}</button> </p>
      <p>Click here --> <button onclick=${updateIntSignal} class="btn btn-primary">${intSignal.value}</button> </p>
      <p>Click here --> <button onclick=${updateFloatSignal} class="btn btn-primary">${floatSignal.value}</button> </p>
      <input type="text" oninput=${updateStringSignal} value=${stringSignal.value} placeholder="Type here" class="input w-full" />
      <p>${stringSignal}</p>
    </div>
  \"\"")

proc SignalComponentB():Component {.exportc.} =
  return html(fmt\"\""
    <div class="p-6">
      <p>signal component B</p>
      <p>Click here --> <button onclick=${updateBoolSignal} class="btn btn-primary">${boolSignal.value.toString()}</button> </p>
      <p>Click here --> <button onclick=${updateIntSignal} class="btn btn-primary">${intSignal.value}</button> </p>
      <p>Click here --> <button onclick=${updateFloatSignal} class="btn btn-primary">${floatSignal.value}</button> </p>
      <input type="text" oninput=${updateStringSignal} value=${stringSignal.value} placeholder="Type here" class="input w-full" />
      <p>${stringSignal}</p>
    </div>
  \"\"")
"""

proc SignalPage*():Component {.exportc.} =
  document.title = "Signal / Nim Palladian"

  return html(fmt"""
    <${Article}>
      <h1>Signal</h1>
      <p>
        Palladian allows the use of SolidJS style <code>signal</code>.
      </p>
      <p>
        signal is a way to create and manage observable values. A signal represents a value that can change over time, and any components or functions that depend on that signal will be automatically updated when the signal changes.
      </p>
      <p>
        Use <code>.value</code> to retrieve a value from a signal or to set a new value.
      </p>
      <p>
        See also<br/>
        <a href="https://preactjs.com/guide/v10/signals/" target="_blank">Preact - Signals</a><br/>
        <a href="https://www.solidjs.com/docs/latest#createsignal" target="_blank">SolidJS - createSignal</a>
      </p>
    <//>
    <${Article}>
      <${CodeBlock} lang="nim">
        ${signalCode}
      <//>
      <p>Both <code>SignalComponentA</code> and <code>SignalComponentB</code> are rendered synchronously.</p>
      <div class="md:flex">
        <${SignalComponentA} />
        <${SignalComponentB} />
      </div>
    <//>
    <br />
    <br />
  """)
