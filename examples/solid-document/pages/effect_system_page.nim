import std/dom
import std/jsffi
import ../../../src/palladian/solid
import ../libs/highlight
import ../components/code_block


proc StringEffectComponent():Component {.exportc.} =
  let (stringState {.exportc.}, setStringState) = createSignal("")
  let (stringCount {.exportc.}, setStringCount) = createSignal(0)

  proc updateState(e:Event) {.exportc.} =
    setStringState(e.target.value)

  createEffect(proc() =
    setStringCount(stringState().len)
  )

  return html(fmt"""
    <input type="text" oninput=${updateState} placeholder="Type here" class="input w-full" />
    <p>${stringState}</p>
    <p>count: ${stringCount}</p>
  """)


proc EffectSystemPage*():Component {.exportc.} =
  document.title = "Effect system / Nim Palladian"

  let sampleCode {.exportc.} :cstring = """
proc StringEffectComponent():Component {.exportc.} =
  let (stringState {.exportc.}, setStringState) = createSignal("")
  let (stringCount {.exportc.}, setStringCount) = createSignal(0)

  proc updateState(e:Event) {.exportc.} =
    setStringState(e.target.value)

  createEffect(proc() =
    setStringCount(stringState.len)
  , @[stringState])

  return html(\"\""
    <input type="text" oninput=${updateState} placeholder="Type here" class="input w-full" />
    <p>${stringState}</p>
    <p>${stringCount}</p>
  \"\"")
  """

  return html(fmt"""
    <${Article}>
      <h1>Effect system</h1>
      <p>
        A side effect in a Web front end is a process that must be performed after a component has been rendered. Specifically, the following side effects are covered.
      </p>
      <ul>
        <li>Retrieving data from an external API</li>
        <li>Modifying the DOM</li>
        <li>Start a timer</li>
        <li>Registering an event listener</li>
      </ul>
      <p>
        These side effects can be executed within a component, but since they are not directly related to component rendering, they require a dedicated method to perform the side effect.<br/>
        For example, if data is to be retrieved from an external API, the data must be retrieved from the API after the component has been rendered.
        For this reason, <code>createEffect</code> to retrieve data from the external API after the component has been rendered.
        Also, if the data retrieved from the API changes the state of the component, <code>createSignal</code> is used to update the state of the component and trigger a redraw.<br/>
        <code>createEffect</code> is used in the function component to perform side effects; the function passed to <code>createEffect</code> is executed only once, when the component is mounted for the first time. They are also executed when dependent data is changed. Thus, createEffect can be used to execute side effects within a component.
      </p>
    <//>
    <${Article}>
      <h2>use effect</h2>
      <p>
        <code>createEffect</code>is one of the hooks provided by Preact (and other frontend frameworks) that allows you to perform side effects in functional components.
        Side effects refer to any code that interacts with the outside world, such as fetching data from an API, updating the document title, or subscribing to events.
      </p>

      <p>
        The <code>createEffect</code> hook takes a callback function as its first argument, and an optional array of dependencies as its second argument.
        The callback function will be called every time the component renders (unless the dependency array is specified and no dependencies have changed), and can perform any side effects that are needed.
      </p>

      <p>
        See also<br/>
        <a href="https://preactjs.com/guide/v10/hooks#side-effects" target="_blank">Preact - Side Effects</a>
      </p>

      <${CodeBlock} lang="nim">
        ${sampleCode}
      <//>
      <${StringEffectComponent} />
    <//>
    <${Article}>
      <h2>useLayoutEffect</h2>
      <p>
        <code>useLayoutEffect</code> is another hook that handles side effects and is used to execute side effects after the component is rendered but before the browser rendering process is executed.
        Use <code>createEffect</code> for processes that do not need to be executed immediately or that have no visual impact, and <code>useLayoutEffect</code> for processes that absolutely must be executed when the page is initially displayed.
      </p>
      <p>
        Also, <code>createEffect</code> is recommended over <code>useLayoutEffect</code> for processes that take a long time to execute.
        The screen will not be reflected until the execution is completed. Therefore, it is a good idea to try <code>createEffect</code> first and then <code>useLayoutEffect</code> if you encounter problems.
      </p>
      <p>
        See also<br/>
        <a href="https://reactjs.org/docs/hooks-reference.html#uselayouteffect" target="_blank">React - useLayoutEffect</a>
      </p>
    <//>
  """)
