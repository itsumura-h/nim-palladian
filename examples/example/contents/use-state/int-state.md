## int state
```nim
proc IntStateComponent():Component {.exportc.} =
  let (intState {.exportc.}, setIntState) = useState(0)

  proc updateState(e:Event) {.exportc.} =
    setIntState(intState + 1)

  return html(fmt"""
    <p>Click here --> <button class="btn btn-primary" onClick=${updateState}>${intState}</button> </p>
  """)
```
