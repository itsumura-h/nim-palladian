## bool state
```nim
proc BoolStateComponent():Component {.exportc.} =
  let (boolState {.exportc.}, setBoolState) = useState(false)

  proc updateState(e:Event) {.exportc.} =
    setBoolState(not boolState)

  return html(fmt"""
    <p>Click here --> <button class="btn btn-primary" onClick=${updateState}>${boolState.toString()}</button> </p>
  """)
```
