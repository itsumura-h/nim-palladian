import std/asyncjs
import std/dom
import std/jsffi
import std/jsfetch
import std/json
import ../../../src/palladian
import ../../../src/palladian/hooks
import ../../../src/palladian/controll_flow
import ../../../src/palladian/format
import ../components/text_body


proc ApiAccessPage*():Component {.exportc.} =
  let (btcPrice {.exportc.}, setBtcPrice) = useState(newJsObject())

  useLayoutEffect(proc()=
    document.title = "API Access / Nim Palladian"
  , [])

  useEffect(proc() {.async.}=
    let res = await fetch("https://api.coindesk.com/v1/bpi/currentprice.json".cstring)
    let json = await res.json()
    var btcPriceObj = newJsObject()
    btcPriceObj["usd"] = json["bpi"]["USD"]["rate_float"]
    btcPriceObj["eur"] = json["bpi"]["EUR"]["rate_float"]
    btcPriceObj["gbp"] = json["bpi"]["GBP"]["rate_float"]
    btcPriceObj["time"] = json["time"]["updatedISO"]
    setBtcPrice(btcPriceObj)
  , [])

  return html(fmt"""
    <${Article}>
      <${Show} when=${btcPrice} fallback=${html`<p>...loading</p>`}>
        <h1>API Access</h1>
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
    <//>
  """)
