import std/jsffi
import ./preact

{.emit:"""
// https://gist.github.com/developit/af2a4488de152a84bff83e035bb8afc1
Signal.prototype.map = function(fn) { return html``<For each=${this} children=${fn} />`` };

export function For({ each, children: f }) {
  let c = useMemo(() => new Map, []);
  let value = each.value;
  if (!Array.isArray(value)) return html``<Item v=${value} f=${f} />``;
  return value.map((v, k, x) => c.get(v) || (c.set(v, x = html``<Item v=${v} k=${k} f=${f} />``), x));
}
let Item = ({ v, k, f }) => f(v, k);

export function Show({ when, fallback, children: f }) {
  let v = when.value;
  return v ? typeof f === 'function' ? html``<Item v=${v} f=${f} />`` : f : fallback;
}
""".}

proc For*(props:JsObject):Component {.importcpp:"For(#)".}
proc Show*(props:JsObject):Component {.importcpp:"Show(#)".}
