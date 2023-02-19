## float state
```nim
proc floatStateComponent():Component {.exportc.} =
  let (floatState {.exportc.}, setFloatState) = useState(0.0)

  proc updateState(e:Event) {.exportc.} =
    setFloatState(round(floatState + 0.1, 1))

  return html(fmt"""
    <p>Click here --> <button class="btn btn-primary" onClick=${updateState}>${floatState}</button> </p>
  """)
```
