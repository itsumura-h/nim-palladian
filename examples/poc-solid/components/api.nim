import std/asyncjs
import std/dom
import std/jsffi
import std/jsfetch
import std/json
import ../../../src/palladian/solid

type BtcPrice = ref object
  usd, eur, gbp:float
  time:cstring

proc ApiAccessComponent():Component {.exportc.} =
  let (btcPrice {.exportc.}, setBtcPrice) = createSignal(newJsObject())

  createEffect(proc() {.async.} =
    let res = await fetch("https://api.coindesk.com/v1/bpi/currentprice.json".cstring)
    let json = await res.json()
    let btcPrice = BtcPrice{
      usd: json["bpi"]["USD"]["rate_float"].to(float),
      eur: json["bpi"]["EUR"]["rate_float"].to(float),
      gbp: json["bpi"]["GBP"]["rate_float"].to(float),
      time: json["time"]["updatedISO"].to(cstring)
    }.toJs()
    setBtcPrice(btcPrice)
  )

  let isFetched {.exportc.} = createMemo(proc():bool =
    return btcPrice().len > 0
  )

  return html(fmt"""
    <${Show} when=${isFetched} fallback=${html`<p>...loading</p>`}>
      <table>
        <thead>
          <tr>
            <th>Currency</th>
            <th>rate</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>USD</td>
              <td>${()=> btcPrice()["usd"]}</td>
            </tr>
            <tr>
              <td>Euro</td>
              <td>${()=> btcPrice()["eur"]}</td>
            </tr>
            <tr>
              <td>GBP</td>
              <td>${()=> btcPrice()["gbp"]}</td>
            </tr>
        </tbody>
      </table>
    <//>
  """)