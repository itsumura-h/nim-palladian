import std/dom
import std/jsffi
import std/json
import std/jsconsole
import ../../../src/palladian
import ../../../src/palladian/format
import ../../../src/palladian/hooks
import ../components/code_block

type User = object
  id:int
  name:cstring

proc ForControllComponent*():Component {.exportc.} =
  let usersData = [
    User{id: 1, name: "Alice"},
    User{id: 2, name: "Bob"},
    User{id: 3, name: "Charlie"},
    User{id: 4, name: "Dave"},
  ]
  let users{.exportc.} = usersData.toJs()

  return html(fmt"""
    <table class="table w-full">
      <thead>
        <tr>
          <th>id</th>
          <th>name</th>
        </tr>
      </thead>
      <tbody>
        <${For} each=${users}>
          ${user=>
            html`<tr> <td>${user.id}</td> <td>${user.name}</td> </tr>`
          }
        <//>
      </tbody>
    </table>
  """)

let forControllCode {.exportc.} :cstring = """
type User = object
  id:int
  name:cstring

proc ForControllComponent*():Component {.exportc.} =
  let usersData = [
    User{id: 1, name: "Alice"},
    User{id: 2, name: "Bob"},
    User{id: 3, name: "Charlie"},
    User{id: 4, name: "Dave"},
  ]
  let users{.exportc.} = usersData.toJs()

  return html(fmt\"\""
    <table class="table w-full">
      <thead>
        <tr>
          <th>id</th>
          <th>name</th>
        </tr>
      </thead>
      <tbody>
        <${For} each=${users}>
          ${user=>
            html`<tr> <td>${user.id}</td> <td>${user.name}</td> </tr>`
          }
        <//>
      </tbody>
    </table>
  \"\"")
"""


proc ShowControllComponent():Component {.exportc.} =
  let (message {.exportc.}, setMessage) = useState("")

  proc updateMessage(e:Event) {.exportc.} =
    setMessage(e.target.value)

  return html(fmt"""
    <input type="text" oninput=${updateMessage} placeholder="message" />
    <${Show} when=${message} fallback=${html`<p class="bg-pink-300 text-red-500 font-bold">Fill the message!</p>`}>
      <p>${message}</p>
    <//>
  """)

let showControllCode {.exportc.} :cstring = """
proc ShowControllComponent():Component {.exportc.} =
  let (message {.exportc.}, setMessage) = useState("")

  proc updateMessage(e:Event) {.exportc.} =
    setMessage(e.target.value)

  return html(fmt\"\""
    <input type="text" oninput=${updateMessage} placeholder="message" />
    <${Show} when=${message} fallback=${html`<p class="bg-pink-300 text-red-500 font-bold">Fill the message!</p>`}>
      <p>${message}</p>
    <//>
  \"\"")
"""


proc ControllFlowPage*():Component {.exportc.} =
  useLayoutEffect(proc() =
    document.title = "Controll flow / Nim Palladian"
  )

  return html(fmt"""
    <${Article}>
      <h1>Controll flow</h1>
      <p>
        Palladian can use SolidJS-style control flow. This is a special <code>For</code> and <code>Show</code> component that handles looping and component display, respectively.<br/>
        This can be achieved by looping through arrays directly in JSX or by comparing them with if statements,
        but this is less readable because you have to read the process flow in detail to understand what is being done there.
        By using these control flows, what is being done there becomes explicit and the development experience improves.
      </p>
      <p>
        See also<br/>
        <a href="https://www.solidjs.com/docs/latest/api#control-flow" target="_blank">SolidJS - Control Flow</a>
      </p>
    <//>

    <${Article}>
      <h2>For</h2>
      <${CodeBlock}>
        ${forControllCode}
      <//>
      <${ForControllComponent} />
    <//>

    <${Article}>
      <h2>Show</h2>
      <${CodeBlock}>
        ${showControllCode}
      <//>
      <${ShowControllComponent} />
    <//>
  """)
