import std/jsffi
import ./preact

{.emit:"""
// https://gist.github.com/developit/af2a4488de152a84bff83e035bb8afc1
Signal.prototype.map = function(fn) { return html``<For each=${this} children=${fn} />`` };

let Item = ({ v, k, f }) => f(v, k);

export function For({ each, children: f }) {
  let c = useMemo(() => new Map, []);
  // let value = each.value;
  let value;
  if(typeof each === "object"){
    if("value" in each){ // Signal
      value = each.value
    }else{ // JsObject
      value = each
    }
  }else if(typeof each === "function"){
    value = each()
  }else{
    value = each
  }
  if (!Array.isArray(value)) return html``<${Item} v=${value} f=${f} />``;
  return value.map((v, k, x) => c.get(v) || (c.set(v, x = html``<${Item} v=${v} k=${k} f=${f} />``), x));
}

export function Show({ when, fallback, children: f }) {
  let v;
  if(typeof when === "object"){
    if("value" in when){ // Signal
      v = when.value
    }else{ // JsObject
      v = when
    }
  }else if(typeof when === "function"){
    v = when()
  }else{
    v = when
  }
  return Boolean(v) ? typeof f === 'function' ? html``<Item v=${v} f=${f} />`` : f : fallback;
}
""".}
