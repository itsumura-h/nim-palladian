import std/asyncjs
import std/dom
import std/jsffi
import std/jsfetch
import std/json
import std/jsconsole
import ../../../src/palladian
import ../../../src/palladian/hooks
import ../../../src/palladian/controll_flow
import ../../../src/palladian/format
import ../components/text_body

{.emit:"""
const sleep = (second) => new Promise(resolve => setTimeout(resolve, second * 1000))
""".}
proc sleep(arg:int):Future[void] {.async, importjs:"sleep(#)".}

type BtcPrice = ref object
  usd, eur, gbp:float
  time:cstring

proc ApiAccessComponent():Component {.exportc.} =
  let (btcPrice {.exportc.}, setBtcPrice) = useState(newJsObject())

  useEffect(proc() {.async.}=
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

let apiAccessCode {.exportc.}: cstring = """
type BtcPrice = ref object
  usd, eur, gbp:float
  time:cstring

proc ApiAccessComponent():Component {.exportc.} =
  let (btcPrice {.exportc.}, setBtcPrice) = useState(newJsObject())

  useEffect(proc() {.async.}=
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

  return html(fmt\"\""
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
  \"\"")
"""

proc ApiAccessPage*():Component {.exportc.} =
  useLayoutEffect(proc() =
    document.title = "API Access / Nim Palladian"
  )

  return html(fmt"""
    <${Article}>
      <h1>API Access</h1>
      <p>
        Here is the example to fetch data from API and display in DOM.<br/>
        To fetch data, you can use <code><a href="https://nim-lang.org/docs/jsfetch.html" target="_blank">jsfetch</a></code> Nim std lib.
      </p>
    <//>
    <${Article}>
      <${CodeBlock} lang="nim">
        ${apiAccessCode}
      <//>
      <${ApiAccessComponent} />
    <//>
  """)
