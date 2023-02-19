## string state
```nim
proc StringStateComponent():Component {.exportc.} =
  let (stringState {.exportc.}, setStringState) = useState("")

  proc updateState(e:Event) {.exportc.} =
    setStringState(e.target.value)

  return html(fmt"""
    <input type="text" oninput=${updateState} placeholder="Type here" class="input w-full max-w-xs" />
    <p>${stringState}</p>
  """)
```
