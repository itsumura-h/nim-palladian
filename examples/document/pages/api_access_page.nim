import std/asyncjs
import std/dom
import std/jsffi
import std/jsfetch
import std/json
import ../../../src/palladian
import ../components/text_body
import ../consts

{.emit:"""
const sleep = (second) => new Promise(resolve => setTimeout(resolve, second * 1000))
""".}
proc sleep(arg:int):Future[void] {.async, importjs:"sleep(#)".}

type BtcPrice = ref object
  usd, eur, gbp:float
  time:cstring

proc BtcPriceComponent():Component {.exportc.} =
  let (btcPrice {.exportc.}, setBtcPrice) = useState(newJsObject())

  useEffect(proc() {.async.} =
    await sleep(2) # for just show loading clearly
    let res = await fetch("https://api.coindesk.com/v1/bpi/currentprice.json".cstring)
    let json = await res.json()
    let btcPrice = BtcPrice{
      usd: json["bpi"]["USD"]["rate_float"].to(float),
      eur: json["bpi"]["EUR"]["rate_float"].to(float),
      gbp: json["bpi"]["GBP"]["rate_float"].to(float),
      time: json["time"]["updatedISO"].to(cstring)
    }.toJs()
    setBtcPrice(btcPrice)
  , [])

  let isFetched {.exportc.} = useMemo(proc():bool =
    return btcPrice.len > 0
  , @[btcPrice])

  return html(fmt"""
    <${Show} when=${isFetched} fallback=${html`<p>...loading</p>`}>
      <p>updated ${btcPrice["time"]}</p>
      <table class="table w-full">
        <thead>
          <tr>
            <th>Currency</th>
            <th>rate</th>
          </tr>
        </thead>
        <tbody>
          <tr>
          <td>USD</td>
            <td>${btcPrice["usd"]}</td>
          </tr>
          <tr>
            <td>Euro</td>
            <td>${btcPrice["eur"]}</td>
          </tr>
          <tr>
            <td>GBP</td>
            <td>${btcPrice["gbp"]}</td>
          </tr>
        </tbody>
      </table>
    <//>
  """)

let btcPriceCode {.exportc.} :cstring = """
type BtcPrice = ref object
  usd, eur, gbp:float
  time:cstring

proc ApiAccessComponent():Component {.exportc.} =
  let (btcPrice {.exportc.}, setBtcPrice) = useState(newJsObject())

  useEffect(proc() {.async.}=
    let res = await fetch(\"https://api.coindesk.com/v1/bpi/currentprice.json\".cstring)
    let json = await res.json()
    let btcPrice = BtcPrice{
      usd: json[\"bpi\"][\"USD\"][\"rate_float\"].to(float),
      eur: json[\"bpi\"][\"EUR\"][\"rate_float\"].to(float),
      gbp: json[\"bpi\"][\"GBP\"][\"rate_float\"].to(float),
      time: json[\"time\"][\"updatedISO\"].to(cstring)
    }.toJs()
    setBtcPrice(btcPrice)
  , [])

  let isFetched {.exportc.} = useMemo(proc():bool =
    return btcPrice.len > 0
  , @[btcPrice])

  return html(fmt\"\"\"
    <${Show} when=${isFetched} fallback=${html`<p>...loading</p>`}>
      <p>updated ${btcPrice[\"time\"]}</p>
      <table class="table w-full">
        <thead>
          <tr>
            <th>Currency</th>
            <th>rate</th>
          </tr>
        </thead>
        <tbody>
          <tr>
          <td>USD</td>
            <td>${btcPrice[\"usd\"]}</td>
          </tr>
          <tr>
            <td>Euro</td>
            <td>${btcPrice[\"eur\"]}</td>
          </tr>
          <tr>
            <td>GBP</td>
            <td>${btcPrice[\"gbp\"]}</td>
          </tr>
        </tbody>
      </table>
    <//>
  \"\"\")
"""


proc StarWarsSearchComponent():Component {.exportc.} =
  let (name, setName) = useState("")
  let (users {.exportc.}, setUsers) = useState(newJsObject())

  proc updateName(e:Event) {.exportc.} =
    setName(e.target.value)

  let isDisplay {.exportc.} = useMemo(proc():bool =
    return users.len > 0
  , @[users])

  useEffect(proc():CleanUpCallback =
    var ignore = false

    proc getCharactor() {.async.} =
      let url:cstring = "https://swapi.dev/api/people?search="
      let res = await fetch(url & name)
      let resJson = await res.json()
      if not ignore:
        setUsers(resJson["results"])

    discard getCharactor()

    return proc() =
      ignore = true
  , @[name])

  return html(fmt"""
    <input type="text" oninput=${updateName} class="w-full" placeholder="Type name of character in Star Wars" />
    <${Show} when=${isDisplay} fallback=${html`
      <p class="bg-pink-300 text-red-500 font-bold">Character not found</p>
    `}>
      <table>
        <thead>
          <tr>
            <th>name</th>
            <th>birth year</th>
          </tr>
        </thead>
        <tbody>
          <${For} each=${users}>
            ${user=>
              html`
                <tr>
                  <td>${user.name}</td>
                  <td>${user.birth_year}</td>
                </tr>
              `
            }
          <//>
        </tbody>
      </table>
    <//>
  """)

let starWarkSearchCode {.exportc.} :cstring = """
proc StarWarsSearchComponent():Component {.exportc.} =
  let (name, setName) = useState("")
  let (users {.exportc.}, setUsers) = useState(newJsObject())

  proc updateName(e:Event) {.exportc.} =
    setName(e.target.value)

  let isDisplay {.exportc.} = useMemo(proc():bool =
    return users.len > 0
  , @[users])

  useEffect(proc():CleanUpCallback =
    var ignore = false

    proc getCharactor() {.async.} =
      let url:cstring = "https://swapi.dev/api/people?search="
      let res = await fetch(url & name)
      let resJson = await res.json()
      if not ignore:
        setUsers(resJson[\"results\"])

    discard getCharactor()

    return proc() = # ========== THIS IS A CLEAN UP CODE ==========
      ignore = true
  , @[name])

  return html(fmt\"\""
    <input type="text" oninput=${updateName} class="w-full" placeholder="Type name" />
    <${Show} when=${hasUsers} fallback=${html`\
      <p class="bg-pink-300 text-red-500 font-bold">Character not found</p>
    `}>
      <table>
        <thead>
          <tr>
            <th>name</th>
            <th>birth year</th>
          </tr>
        </thead>
        <tbody>
          <${For} each=${users}>
          ${user=>\
            html`\
              <tr>
                <td>${user.name}</td>
                <td>${user.birth_year}</td>
              </tr>
            `\
          }
        <//>
        </tbody>
      </table>
    <//>
  \"\"")
"""

proc ApiAccessPage*(props:ComponentProps):Component {.exportc.} =
  document.title = "API Access / Nim Palladian"

  return html(fmt"""
    <${ScrollTop}>
      <${Article}>
        <h1>API Access</h1>
        <p>
          Here is the example to fetch data from API and display in DOM.<br/>
          To fetch data, you can use <code><a href="https://nim-lang.org/docs/jsfetch.html" target="_blank">jsfetch</a></code> Nim std lib.
        </p>
      <//>
      <${Article}>
        <${CodeBlock} lang="nim">
          ${btcPriceCode}
        <//>
        <${BtcPriceComponent} />
      <//>
      <${Article}>
        <h2>Cleanup</h2>
        <p>
          See also<br/>
          <a href="https://dev.to/takuyakikuchi/problems-with-data-fetching-effect-and-cleanup-1397" target="_blank">Problems with data fetching Effect, and Cleanup</a><br/>
          <a href="https://beta.reactjs.org/learn/synchronizing-with-effects#fetching-data" target="_blank">React - Synchronizing with Effects - Fetching data </a>
        </p>
      <//>
      <${Article}>
        <${CodeBlock} lang="nim">
          ${starWarkSearchCode}
        <//>
        <${StarWarsSearchComponent} />
      <//>
    <//>
  """)
