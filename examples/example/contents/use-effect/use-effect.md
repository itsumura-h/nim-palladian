# useEffect
`useEffect`is another hook provided by React and Preact (and other frontend frameworks) that allows you to perform side effects in functional components. Side effects refer to any code that interacts with the outside world, such as fetching data from an API, updating the document title, or subscribing to events.

The useEffect hook takes a callback function as its first argument, and an optional array of dependencies as its second argument. The callback function will be called every time the component renders (unless the dependency array is specified and no dependencies have changed), and can perform any side effects that are needed.

```nim
proc StringEffectComponent():Component {.exportc.} =
  let (stringState {.exportc.}, setStringState) = useState("")
  let (stringCount {.exportc.}, setStringCount) = useState(0)

  proc updateState(e:Event) {.exportc.} =
    setStringState(e.target.value)

  useEffect(proc() =
    setStringCount(stringState.len)
  , @[stringState])

  return html(fmt"""
    <input type="text" oninput=${updateState} placeholder="Type here" class="input w-full" />
    <p>${stringState}</p>
    <p>${stringCount}</p>
  """)
```
