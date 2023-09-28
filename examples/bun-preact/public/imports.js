// node_modules/preact/dist/preact.module.js
var v = function(n, l) {
  for (var u in l)
    n[u] = l[u];
  return n;
};
var p = function(n) {
  var l = n.parentNode;
  l && l.removeChild(n);
};
var y = function(l, u, t) {
  var i, o, r, f = {};
  for (r in u)
    r == "key" ? i = u[r] : r == "ref" ? o = u[r] : f[r] = u[r];
  if (arguments.length > 2 && (f.children = arguments.length > 3 ? n.call(arguments, 2) : t), typeof l == "function" && l.defaultProps != null)
    for (r in l.defaultProps)
      f[r] === undefined && (f[r] = l.defaultProps[r]);
  return d(l, f, i, o, null);
};
var d = function(n, t, i, o, r) {
  var f = { type: n, props: t, key: i, ref: o, __k: null, __: null, __b: 0, __e: null, __d: undefined, __c: null, __h: null, constructor: undefined, __v: r == null ? ++u : r };
  return r == null && l.vnode != null && l.vnode(f), f;
};
var k = function(n) {
  return n.children;
};
var b = function(n, l) {
  this.props = n, this.context = l;
};
var g = function(n, l) {
  if (l == null)
    return n.__ ? g(n.__, n.__.__k.indexOf(n) + 1) : null;
  for (var u;l < n.__k.length; l++)
    if ((u = n.__k[l]) != null && u.__e != null)
      return u.__e;
  return typeof n.type == "function" ? g(n) : null;
};
var m = function(n) {
  var l, u;
  if ((n = n.__) != null && n.__c != null) {
    for (n.__e = n.__c.base = null, l = 0;l < n.__k.length; l++)
      if ((u = n.__k[l]) != null && u.__e != null) {
        n.__e = n.__c.base = u.__e;
        break;
      }
    return m(n);
  }
};
var w = function(n) {
  (!n.__d && (n.__d = true) && i.push(n) && !x.__r++ || o !== l.debounceRendering) && ((o = l.debounceRendering) || r)(x);
};
var x = function() {
  var n, l, u, t, o, r, e, c, s;
  for (i.sort(f);n = i.shift(); )
    n.__d && (l = i.length, t = undefined, o = undefined, r = undefined, c = (e = (u = n).__v).__e, (s = u.__P) && (t = [], o = [], (r = v({}, e)).__v = e.__v + 1, L(s, e, r, u.__n, s.ownerSVGElement !== undefined, e.__h != null ? [c] : null, t, c == null ? g(e) : c, e.__h, o), M(t, e, o), e.__e != c && m(e)), i.length > l && i.sort(f));
  x.__r = 0;
};
var P = function(n, l, u, t, i, o, r, f, e, a, v2) {
  var p2, y2, _, b2, m2, w2, x2, P2, C, H = 0, I = t && t.__k || s, T = I.length, j = T, z = l.length;
  for (u.__k = [], p2 = 0;p2 < z; p2++)
    (b2 = u.__k[p2] = (b2 = l[p2]) == null || typeof b2 == "boolean" || typeof b2 == "function" ? null : typeof b2 == "string" || typeof b2 == "number" || typeof b2 == "bigint" ? d(null, b2, null, null, b2) : h(b2) ? d(k, { children: b2 }, null, null, null) : b2.__b > 0 ? d(b2.type, b2.props, b2.key, b2.ref ? b2.ref : null, b2.__v) : b2) != null ? (b2.__ = u, b2.__b = u.__b + 1, (P2 = A(b2, I, x2 = p2 + H, j)) === -1 ? _ = c : (_ = I[P2] || c, I[P2] = undefined, j--), L(n, b2, _, i, o, r, f, e, a, v2), m2 = b2.__e, (y2 = b2.ref) && _.ref != y2 && (_.ref && O(_.ref, null, b2), v2.push(y2, b2.__c || m2, b2)), m2 != null && (w2 == null && (w2 = m2), (C = _ === c || _.__v === null) ? P2 == -1 && H-- : P2 !== x2 && (P2 === x2 + 1 ? H++ : P2 > x2 ? j > z - x2 ? H += P2 - x2 : H-- : H = P2 < x2 && P2 == x2 - 1 ? P2 - x2 : 0), x2 = p2 + H, typeof b2.type != "function" || P2 === x2 && _.__k !== b2.__k ? typeof b2.type == "function" || P2 === x2 && !C ? b2.__d !== undefined ? (e = b2.__d, b2.__d = undefined) : e = m2.nextSibling : e = S(n, m2, e) : e = $(b2, e, n), typeof u.type == "function" && (u.__d = e))) : (_ = I[p2]) && _.key == null && _.__e && (_.__e == e && (e = g(_)), q(_, _, false), I[p2] = null);
  for (u.__e = w2, p2 = T;p2--; )
    I[p2] != null && (typeof u.type == "function" && I[p2].__e != null && I[p2].__e == u.__d && (u.__d = I[p2].__e.nextSibling), q(I[p2], I[p2]));
};
var $ = function(n, l, u) {
  for (var t, i = n.__k, o = 0;i && o < i.length; o++)
    (t = i[o]) && (t.__ = n, l = typeof t.type == "function" ? $(t, l, u) : S(u, t.__e, l));
  return l;
};
var C = function(n, l) {
  return l = l || [], n == null || typeof n == "boolean" || (h(n) ? n.some(function(n2) {
    C(n2, l);
  }) : l.push(n)), l;
};
var S = function(n, l, u) {
  return u == null || u.parentNode !== n ? n.insertBefore(l, null) : l == u && l.parentNode != null || n.insertBefore(l, u), l.nextSibling;
};
var A = function(n, l, u, t) {
  var { key: i, type: o } = n, r = u - 1, f = u + 1, e = l[u];
  if (e === null || e && i == e.key && o === e.type)
    return u;
  if (t > (e != null ? 1 : 0))
    for (;r >= 0 || f < l.length; ) {
      if (r >= 0) {
        if ((e = l[r]) && i == e.key && o === e.type)
          return r;
        r--;
      }
      if (f < l.length) {
        if ((e = l[f]) && i == e.key && o === e.type)
          return f;
        f++;
      }
    }
  return -1;
};
var H = function(n, l, u, t, i) {
  var o;
  for (o in u)
    o === "children" || o === "key" || (o in l) || T(n, o, null, u[o], t);
  for (o in l)
    i && typeof l[o] != "function" || o === "children" || o === "key" || o === "value" || o === "checked" || u[o] === l[o] || T(n, o, l[o], u[o], t);
};
var I = function(n, l, u) {
  l[0] === "-" ? n.setProperty(l, u == null ? "" : u) : n[l] = u == null ? "" : typeof u != "number" || a.test(l) ? u : u + "px";
};
var T = function(n, l, u, t, i) {
  var o;
  n:
    if (l === "style")
      if (typeof u == "string")
        n.style.cssText = u;
      else {
        if (typeof t == "string" && (n.style.cssText = t = ""), t)
          for (l in t)
            u && (l in u) || I(n.style, l, "");
        if (u)
          for (l in u)
            t && u[l] === t[l] || I(n.style, l, u[l]);
      }
    else if (l[0] === "o" && l[1] === "n")
      o = l !== (l = l.replace(/(PointerCapture)$|Capture$/, "$1")), l = (l.toLowerCase() in n) ? l.toLowerCase().slice(2) : l.slice(2), n.l || (n.l = {}), n.l[l + o] = u, u ? t || n.addEventListener(l, o ? z : j, o) : n.removeEventListener(l, o ? z : j, o);
    else if (l !== "dangerouslySetInnerHTML") {
      if (i)
        l = l.replace(/xlink(H|:h)/, "h").replace(/sName$/, "s");
      else if (l !== "width" && l !== "height" && l !== "href" && l !== "list" && l !== "form" && l !== "tabIndex" && l !== "download" && l !== "rowSpan" && l !== "colSpan" && (l in n))
        try {
          n[l] = u == null ? "" : u;
          break n;
        } catch (n2) {
        }
      typeof u == "function" || (u == null || u === false && l[4] !== "-" ? n.removeAttribute(l) : n.setAttribute(l, u));
    }
};
var j = function(n) {
  return this.l[n.type + false](l.event ? l.event(n) : n);
};
var z = function(n) {
  return this.l[n.type + true](l.event ? l.event(n) : n);
};
var L = function(n, u, t, i, o, r, f, e, c, s) {
  var a, p2, y2, d2, _, g2, m2, w2, x2, $2, C2, S2, A2, H2, I2, T2 = u.type;
  if (u.constructor !== undefined)
    return null;
  t.__h != null && (c = t.__h, e = u.__e = t.__e, u.__h = null, r = [e]), (a = l.__b) && a(u);
  n:
    if (typeof T2 == "function")
      try {
        if (w2 = u.props, x2 = (a = T2.contextType) && i[a.__c], $2 = a ? x2 ? x2.props.value : a.__ : i, t.__c ? m2 = (p2 = u.__c = t.__c).__ = p2.__E : (("prototype" in T2) && T2.prototype.render ? u.__c = p2 = new T2(w2, $2) : (u.__c = p2 = new b(w2, $2), p2.constructor = T2, p2.render = B), x2 && x2.sub(p2), p2.props = w2, p2.state || (p2.state = {}), p2.context = $2, p2.__n = i, y2 = p2.__d = true, p2.__h = [], p2._sb = []), p2.__s == null && (p2.__s = p2.state), T2.getDerivedStateFromProps != null && (p2.__s == p2.state && (p2.__s = v({}, p2.__s)), v(p2.__s, T2.getDerivedStateFromProps(w2, p2.__s))), d2 = p2.props, _ = p2.state, p2.__v = u, y2)
          T2.getDerivedStateFromProps == null && p2.componentWillMount != null && p2.componentWillMount(), p2.componentDidMount != null && p2.__h.push(p2.componentDidMount);
        else {
          if (T2.getDerivedStateFromProps == null && w2 !== d2 && p2.componentWillReceiveProps != null && p2.componentWillReceiveProps(w2, $2), !p2.__e && (p2.shouldComponentUpdate != null && p2.shouldComponentUpdate(w2, p2.__s, $2) === false || u.__v === t.__v)) {
            for (u.__v !== t.__v && (p2.props = w2, p2.state = p2.__s, p2.__d = false), u.__e = t.__e, u.__k = t.__k, u.__k.forEach(function(n2) {
              n2 && (n2.__ = u);
            }), C2 = 0;C2 < p2._sb.length; C2++)
              p2.__h.push(p2._sb[C2]);
            p2._sb = [], p2.__h.length && f.push(p2);
            break n;
          }
          p2.componentWillUpdate != null && p2.componentWillUpdate(w2, p2.__s, $2), p2.componentDidUpdate != null && p2.__h.push(function() {
            p2.componentDidUpdate(d2, _, g2);
          });
        }
        if (p2.context = $2, p2.props = w2, p2.__P = n, p2.__e = false, S2 = l.__r, A2 = 0, ("prototype" in T2) && T2.prototype.render) {
          for (p2.state = p2.__s, p2.__d = false, S2 && S2(u), a = p2.render(p2.props, p2.state, p2.context), H2 = 0;H2 < p2._sb.length; H2++)
            p2.__h.push(p2._sb[H2]);
          p2._sb = [];
        } else
          do {
            p2.__d = false, S2 && S2(u), a = p2.render(p2.props, p2.state, p2.context), p2.state = p2.__s;
          } while (p2.__d && ++A2 < 25);
        p2.state = p2.__s, p2.getChildContext != null && (i = v(v({}, i), p2.getChildContext())), y2 || p2.getSnapshotBeforeUpdate == null || (g2 = p2.getSnapshotBeforeUpdate(d2, _)), P(n, h(I2 = a != null && a.type === k && a.key == null ? a.props.children : a) ? I2 : [I2], u, t, i, o, r, f, e, c, s), p2.base = u.__e, u.__h = null, p2.__h.length && f.push(p2), m2 && (p2.__E = p2.__ = null);
      } catch (n2) {
        u.__v = null, (c || r != null) && (u.__e = e, u.__h = !!c, r[r.indexOf(e)] = null), l.__e(n2, u, t);
      }
    else
      r == null && u.__v === t.__v ? (u.__k = t.__k, u.__e = t.__e) : u.__e = N(t.__e, u, t, i, o, r, f, c, s);
  (a = l.diffed) && a(u);
};
var M = function(n, u, t) {
  for (var i = 0;i < t.length; i++)
    O(t[i], t[++i], t[++i]);
  l.__c && l.__c(u, n), n.some(function(u2) {
    try {
      n = u2.__h, u2.__h = [], n.some(function(n2) {
        n2.call(u2);
      });
    } catch (n2) {
      l.__e(n2, u2.__v);
    }
  });
};
var N = function(l, u, t, i, o, r, f, e, s) {
  var a, v2, y2, d2 = t.props, _ = u.props, k2 = u.type, b2 = 0;
  if (k2 === "svg" && (o = true), r != null) {
    for (;b2 < r.length; b2++)
      if ((a = r[b2]) && ("setAttribute" in a) == !!k2 && (k2 ? a.localName === k2 : a.nodeType === 3)) {
        l = a, r[b2] = null;
        break;
      }
  }
  if (l == null) {
    if (k2 === null)
      return document.createTextNode(_);
    l = o ? document.createElementNS("http://www.w3.org/2000/svg", k2) : document.createElement(k2, _.is && _), r = null, e = false;
  }
  if (k2 === null)
    d2 === _ || e && l.data === _ || (l.data = _);
  else {
    if (r = r && n.call(l.childNodes), v2 = (d2 = t.props || c).dangerouslySetInnerHTML, y2 = _.dangerouslySetInnerHTML, !e) {
      if (r != null)
        for (d2 = {}, b2 = 0;b2 < l.attributes.length; b2++)
          d2[l.attributes[b2].name] = l.attributes[b2].value;
      (y2 || v2) && (y2 && (v2 && y2.__html == v2.__html || y2.__html === l.innerHTML) || (l.innerHTML = y2 && y2.__html || ""));
    }
    if (H(l, _, d2, o, e), y2)
      u.__k = [];
    else if (P(l, h(b2 = u.props.children) ? b2 : [b2], u, t, i, o && k2 !== "foreignObject", r, f, r ? r[0] : t.__k && g(t, 0), e, s), r != null)
      for (b2 = r.length;b2--; )
        r[b2] != null && p(r[b2]);
    e || (("value" in _) && (b2 = _.value) !== undefined && (b2 !== l.value || k2 === "progress" && !b2 || k2 === "option" && b2 !== d2.value) && T(l, "value", b2, d2.value, false), ("checked" in _) && (b2 = _.checked) !== undefined && b2 !== l.checked && T(l, "checked", b2, d2.checked, false));
  }
  return l;
};
var O = function(n, u, t) {
  try {
    typeof n == "function" ? n(u) : n.current = u;
  } catch (n2) {
    l.__e(n2, t);
  }
};
var q = function(n, u, t) {
  var i, o;
  if (l.unmount && l.unmount(n), (i = n.ref) && (i.current && i.current !== n.__e || O(i, null, u)), (i = n.__c) != null) {
    if (i.componentWillUnmount)
      try {
        i.componentWillUnmount();
      } catch (n2) {
        l.__e(n2, u);
      }
    i.base = i.__P = null, n.__c = undefined;
  }
  if (i = n.__k)
    for (o = 0;o < i.length; o++)
      i[o] && q(i[o], u, t || typeof n.type != "function");
  t || n.__e == null || p(n.__e), n.__ = n.__e = n.__d = undefined;
};
var B = function(n, l, u) {
  return this.constructor(n, u);
};
var F = function(l, u, t) {
  var i, o, r, f, e = v({}, l.props);
  for (r in l.type && l.type.defaultProps && (f = l.type.defaultProps), u)
    r == "key" ? i = u[r] : r == "ref" ? o = u[r] : e[r] = u[r] === undefined && f !== undefined ? f[r] : u[r];
  return arguments.length > 2 && (e.children = arguments.length > 3 ? n.call(arguments, 2) : t), d(l.type, e, i || l.key, o || l.ref, null);
};
var G = function(n, l) {
  var u = { __c: l = "__cC" + e++, __: n, Consumer: function(n2, l2) {
    return n2.children(l2);
  }, Provider: function(n2) {
    var u2, t;
    return this.getChildContext || (u2 = [], (t = {})[l] = this, this.getChildContext = function() {
      return t;
    }, this.shouldComponentUpdate = function(n3) {
      this.props.value !== n3.value && u2.some(function(n4) {
        n4.__e = true, w(n4);
      });
    }, this.sub = function(n3) {
      u2.push(n3);
      var l2 = n3.componentWillUnmount;
      n3.componentWillUnmount = function() {
        u2.splice(u2.indexOf(n3), 1), l2 && l2.call(n3);
      };
    }), n2.children;
  } };
  return u.Provider.__ = u.Consumer.contextType = u;
};
var n;
var l;
var u;
var t;
var i;
var o;
var r;
var f;
var e;
var c = {};
var s = [];
var a = /acit|ex(?:s|g|n|p|$)|rph|grid|ows|mnc|ntw|ine[ch]|zoo|^ord|itera/i;
var h = Array.isArray;
n = s.slice, l = { __e: function(n2, l2, u2, t2) {
  for (var i2, o2, r2;l2 = l2.__; )
    if ((i2 = l2.__c) && !i2.__)
      try {
        if ((o2 = i2.constructor) && o2.getDerivedStateFromError != null && (i2.setState(o2.getDerivedStateFromError(n2)), r2 = i2.__d), i2.componentDidCatch != null && (i2.componentDidCatch(n2, t2 || {}), r2 = i2.__d), r2)
          return i2.__E = i2;
      } catch (l3) {
        n2 = l3;
      }
  throw n2;
} }, u = 0, t = function(n2) {
  return n2 != null && n2.constructor === undefined;
}, b.prototype.setState = function(n2, l2) {
  var u2;
  u2 = this.__s != null && this.__s !== this.state ? this.__s : this.__s = v({}, this.state), typeof n2 == "function" && (n2 = n2(v({}, u2), this.props)), n2 && v(u2, n2), n2 != null && this.__v && (l2 && this._sb.push(l2), w(this));
}, b.prototype.forceUpdate = function(n2) {
  this.__v && (this.__e = true, n2 && this.__h.push(n2), w(this));
}, b.prototype.render = k, i = [], r = typeof Promise == "function" ? Promise.prototype.then.bind(Promise.resolve()) : setTimeout, f = function(n2, l2) {
  return n2.__v.__b - l2.__v.__b;
}, x.__r = 0, e = 0;

// node_modules/htm/dist/htm.module.js
var n2 = function(t2, s2, r2, e2) {
  var u2;
  s2[0] = 0;
  for (var h2 = 1;h2 < s2.length; h2++) {
    var p2 = s2[h2++], a2 = s2[h2] ? (s2[0] |= p2 ? 1 : 2, r2[s2[h2++]]) : s2[++h2];
    p2 === 3 ? e2[0] = a2 : p2 === 4 ? e2[1] = Object.assign(e2[1] || {}, a2) : p2 === 5 ? (e2[1] = e2[1] || {})[s2[++h2]] = a2 : p2 === 6 ? e2[1][s2[++h2]] += a2 + "" : p2 ? (u2 = t2.apply(a2, n2(t2, a2, r2, ["", null])), e2.push(u2), a2[0] ? s2[0] |= 2 : (s2[h2 - 2] = 0, s2[h2] = u2)) : e2.push(a2);
  }
  return e2;
};
var t2 = new Map;
function htm_module_default(s2) {
  var r2 = t2.get(this);
  return r2 || (r2 = new Map, t2.set(this, r2)), (r2 = n2(this, r2.get(s2) || (r2.set(s2, r2 = function(n3) {
    for (var t3, s3, r3 = 1, e2 = "", u2 = "", h2 = [0], p2 = function(n4) {
      r3 === 1 && (n4 || (e2 = e2.replace(/^\s*\n\s*|\s*\n\s*$/g, ""))) ? h2.push(0, n4, e2) : r3 === 3 && (n4 || e2) ? (h2.push(3, n4, e2), r3 = 2) : r3 === 2 && e2 === "..." && n4 ? h2.push(4, n4, 0) : r3 === 2 && e2 && !n4 ? h2.push(5, 0, true, e2) : r3 >= 5 && ((e2 || !n4 && r3 === 5) && (h2.push(r3, 0, e2, s3), r3 = 6), n4 && (h2.push(r3, n4, 0, s3), r3 = 6)), e2 = "";
    }, a2 = 0;a2 < n3.length; a2++) {
      a2 && (r3 === 1 && p2(), p2(a2));
      for (var l2 = 0;l2 < n3[a2].length; l2++)
        t3 = n3[a2][l2], r3 === 1 ? t3 === "<" ? (p2(), h2 = [h2], r3 = 3) : e2 += t3 : r3 === 4 ? e2 === "--" && t3 === ">" ? (r3 = 1, e2 = "") : e2 = t3 + e2[0] : u2 ? t3 === u2 ? u2 = "" : e2 += t3 : t3 === '"' || t3 === "'" ? u2 = t3 : t3 === ">" ? (p2(), r3 = 1) : r3 && (t3 === "=" ? (r3 = 5, s3 = e2, e2 = "") : t3 === "/" && (r3 < 5 || n3[a2][l2 + 1] === ">") ? (p2(), r3 === 3 && (h2 = h2[0]), r3 = h2, (h2 = h2[0]).push(2, 0, r3), r3 = 0) : t3 === " " || t3 === "\t" || t3 === "\n" || t3 === "\r" ? (p2(), r3 = 2) : e2 += t3), r3 === 3 && e2 === "!--" && (r3 = 4, h2 = h2[0]);
    }
    return p2(), h2;
  }(s2)), r2), arguments, [])).length > 1 ? r2 : r2[0];
}

// node_modules/preact/hooks/dist/hooks.module.js
var d2 = function(t3, u2) {
  l.__h && l.__h(r2, t3, o2 || u2), o2 = 0;
  var i2 = r2.__H || (r2.__H = { __: [], __h: [] });
  return t3 >= i2.__.length && i2.__.push({ __V: c2 }), i2.__[t3];
};
var F2 = function(n3, r2) {
  var u2 = d2(t3++, 7);
  return z2(u2.__H, r2) ? (u2.__V = n3(), u2.i = r2, u2.__h = n3, u2.__V) : u2.__;
};
var b2 = function() {
  for (var t3;t3 = f2.shift(); )
    if (t3.__P && t3.__H)
      try {
        t3.__H.__h.forEach(k2), t3.__H.__h.forEach(w2), t3.__H.__h = [];
      } catch (r2) {
        t3.__H.__h = [], l.__e(r2, t3.__v);
      }
};
var j2 = function(n3) {
  var t3, r2 = function() {
    clearTimeout(u2), g2 && cancelAnimationFrame(t3), setTimeout(n3);
  }, u2 = setTimeout(r2, 100);
  g2 && (t3 = requestAnimationFrame(r2));
};
var k2 = function(n3) {
  var t3 = r2, u2 = n3.__c;
  typeof u2 == "function" && (n3.__c = undefined, u2()), r2 = t3;
};
var w2 = function(n3) {
  var t3 = r2;
  n3.__c = n3.__(), r2 = t3;
};
var z2 = function(n3, t3) {
  return !n3 || n3.length !== t3.length || t3.some(function(t4, r2) {
    return t4 !== n3[r2];
  });
};
var t3;
var r2;
var u2;
var i2;
var o2 = 0;
var f2 = [];
var c2 = [];
var e2 = l.__b;
var a2 = l.__r;
var v2 = l.diffed;
var l2 = l.__c;
var m2 = l.unmount;
l.__b = function(n3) {
  r2 = null, e2 && e2(n3);
}, l.__r = function(n3) {
  a2 && a2(n3), t3 = 0;
  var i3 = (r2 = n3.__c).__H;
  i3 && (u2 === r2 ? (i3.__h = [], r2.__h = [], i3.__.forEach(function(n4) {
    n4.__N && (n4.__ = n4.__N), n4.__V = c2, n4.__N = n4.i = undefined;
  })) : (i3.__h.forEach(k2), i3.__h.forEach(w2), i3.__h = [], t3 = 0)), u2 = r2;
}, l.diffed = function(t4) {
  v2 && v2(t4);
  var o3 = t4.__c;
  o3 && o3.__H && (o3.__H.__h.length && (f2.push(o3) !== 1 && i2 === l.requestAnimationFrame || ((i2 = l.requestAnimationFrame) || j2)(b2)), o3.__H.__.forEach(function(n3) {
    n3.i && (n3.__H = n3.i), n3.__V !== c2 && (n3.__ = n3.__V), n3.i = undefined, n3.__V = c2;
  })), u2 = r2 = null;
}, l.__c = function(t4, r3) {
  r3.some(function(t5) {
    try {
      t5.__h.forEach(k2), t5.__h = t5.__h.filter(function(n3) {
        return !n3.__ || w2(n3);
      });
    } catch (u3) {
      r3.some(function(n3) {
        n3.__h && (n3.__h = []);
      }), r3 = [], l.__e(u3, t5.__v);
    }
  }), l2 && l2(t4, r3);
}, l.unmount = function(t4) {
  m2 && m2(t4);
  var r3, u3 = t4.__c;
  u3 && u3.__H && (u3.__H.__.forEach(function(n3) {
    try {
      k2(n3);
    } catch (n4) {
      r3 = n4;
    }
  }), u3.__H = undefined, r3 && l.__e(r3, u3.__v));
};
var g2 = typeof requestAnimationFrame == "function";

// node_modules/@preact/signals-core/dist/signals-core.module.js
var i3 = function() {
  throw new Error("Cycle detected");
};
var r3 = function() {
  if (!(v3 > 1)) {
    var i4, t4 = false;
    while (f3 !== undefined) {
      var r4 = f3;
      f3 = undefined;
      e3++;
      while (r4 !== undefined) {
        var n3 = r4.o;
        r4.o = undefined;
        r4.f &= -3;
        if (!(8 & r4.f) && l3(r4))
          try {
            r4.c();
          } catch (r5) {
            if (!t4) {
              i4 = r5;
              t4 = true;
            }
          }
        r4 = n3;
      }
    }
    e3 = 0;
    v3--;
    if (t4)
      throw i4;
  } else
    v3--;
};
var c3 = function(i4) {
  if (o3 !== undefined) {
    var t4 = i4.n;
    if (t4 === undefined || t4.t !== o3) {
      t4 = { i: 0, S: i4, p: o3.s, n: undefined, t: o3, e: undefined, x: undefined, r: t4 };
      if (o3.s !== undefined)
        o3.s.n = t4;
      o3.s = t4;
      i4.n = t4;
      if (32 & o3.f)
        i4.S(t4);
      return t4;
    } else if (t4.i === -1) {
      t4.i = 0;
      if (t4.n !== undefined) {
        t4.n.p = t4.p;
        if (t4.p !== undefined)
          t4.p.n = t4.n;
        t4.p = o3.s;
        t4.n = undefined;
        o3.s.n = t4;
        o3.s = t4;
      }
      return t4;
    }
  }
};
var d3 = function(i4) {
  this.v = i4;
  this.i = 0;
  this.n = undefined;
  this.t = undefined;
};
var a3 = function(i4) {
  return new d3(i4);
};
var l3 = function(i4) {
  for (var t4 = i4.s;t4 !== undefined; t4 = t4.n)
    if (t4.S.i !== t4.i || !t4.S.h() || t4.S.i !== t4.i)
      return true;
  return false;
};
var y2 = function(i4) {
  for (var t4 = i4.s;t4 !== undefined; t4 = t4.n) {
    var r4 = t4.S.n;
    if (r4 !== undefined)
      t4.r = r4;
    t4.S.n = t4;
    t4.i = -1;
    if (t4.n === undefined) {
      i4.s = t4;
      break;
    }
  }
};
var w3 = function(i4) {
  var t4 = i4.s, r4 = undefined;
  while (t4 !== undefined) {
    var n3 = t4.p;
    if (t4.i === -1) {
      t4.S.U(t4);
      if (n3 !== undefined)
        n3.n = t4.n;
      if (t4.n !== undefined)
        t4.n.p = n3;
    } else
      r4 = t4;
    t4.S.n = t4.r;
    if (t4.r !== undefined)
      t4.r = undefined;
    t4 = n3;
  }
  i4.s = r4;
};
var _ = function(i4) {
  d3.call(this, undefined);
  this.x = i4;
  this.s = undefined;
  this.g = u3 - 1;
  this.f = 4;
};
var p2 = function(i4) {
  return new _(i4);
};
var g3 = function(i4) {
  var t4 = i4.u;
  i4.u = undefined;
  if (typeof t4 == "function") {
    v3++;
    var n3 = o3;
    o3 = undefined;
    try {
      t4();
    } catch (t5) {
      i4.f &= -2;
      i4.f |= 8;
      b3(i4);
      throw t5;
    } finally {
      o3 = n3;
      r3();
    }
  }
};
var b3 = function(i4) {
  for (var t4 = i4.s;t4 !== undefined; t4 = t4.n)
    t4.S.U(t4);
  i4.x = undefined;
  i4.s = undefined;
  g3(i4);
};
var x2 = function(i4) {
  if (o3 !== this)
    throw new Error("Out-of-order effect");
  w3(this);
  o3 = i4;
  this.f &= -2;
  if (8 & this.f)
    b3(this);
  r3();
};
var E = function(i4) {
  this.x = i4;
  this.u = undefined;
  this.s = undefined;
  this.o = undefined;
  this.f = 32;
};
var O2 = function(i4) {
  var t4 = new E(i4);
  try {
    t4.c();
  } catch (i5) {
    t4.d();
    throw i5;
  }
  return t4.d.bind(t4);
};
var t4 = Symbol.for("preact-signals");
var o3 = undefined;
var f3 = undefined;
var v3 = 0;
var e3 = 0;
var u3 = 0;
d3.prototype.brand = t4;
d3.prototype.h = function() {
  return true;
};
d3.prototype.S = function(i4) {
  if (this.t !== i4 && i4.e === undefined) {
    i4.x = this.t;
    if (this.t !== undefined)
      this.t.e = i4;
    this.t = i4;
  }
};
d3.prototype.U = function(i4) {
  if (this.t !== undefined) {
    var { e: t5, x: r4 } = i4;
    if (t5 !== undefined) {
      t5.x = r4;
      i4.e = undefined;
    }
    if (r4 !== undefined) {
      r4.e = t5;
      i4.x = undefined;
    }
    if (i4 === this.t)
      this.t = r4;
  }
};
d3.prototype.subscribe = function(i4) {
  var t5 = this;
  return O2(function() {
    var r4 = t5.value, n3 = 32 & this.f;
    this.f &= -33;
    try {
      i4(r4);
    } finally {
      this.f |= n3;
    }
  });
};
d3.prototype.valueOf = function() {
  return this.value;
};
d3.prototype.toString = function() {
  return this.value + "";
};
d3.prototype.toJSON = function() {
  return this.value;
};
d3.prototype.peek = function() {
  return this.v;
};
Object.defineProperty(d3.prototype, "value", { get: function() {
  var i4 = c3(this);
  if (i4 !== undefined)
    i4.i = this.i;
  return this.v;
}, set: function(t5) {
  if (o3 instanceof _)
    (function() {
      throw new Error("Computed cannot have side-effects");
    })();
  if (t5 !== this.v) {
    if (e3 > 100)
      i3();
    this.v = t5;
    this.i++;
    u3++;
    v3++;
    try {
      for (var n3 = this.t;n3 !== undefined; n3 = n3.x)
        n3.t.N();
    } finally {
      r3();
    }
  }
} });
(_.prototype = new d3).h = function() {
  this.f &= -3;
  if (1 & this.f)
    return false;
  if ((36 & this.f) == 32)
    return true;
  this.f &= -5;
  if (this.g === u3)
    return true;
  this.g = u3;
  this.f |= 1;
  if (this.i > 0 && !l3(this)) {
    this.f &= -2;
    return true;
  }
  var i4 = o3;
  try {
    y2(this);
    o3 = this;
    var t5 = this.x();
    if (16 & this.f || this.v !== t5 || this.i === 0) {
      this.v = t5;
      this.f &= -17;
      this.i++;
    }
  } catch (i5) {
    this.v = i5;
    this.f |= 16;
    this.i++;
  }
  o3 = i4;
  w3(this);
  this.f &= -2;
  return true;
};
_.prototype.S = function(i4) {
  if (this.t === undefined) {
    this.f |= 36;
    for (var t5 = this.s;t5 !== undefined; t5 = t5.n)
      t5.S.S(t5);
  }
  d3.prototype.S.call(this, i4);
};
_.prototype.U = function(i4) {
  if (this.t !== undefined) {
    d3.prototype.U.call(this, i4);
    if (this.t === undefined) {
      this.f &= -33;
      for (var t5 = this.s;t5 !== undefined; t5 = t5.n)
        t5.S.U(t5);
    }
  }
};
_.prototype.N = function() {
  if (!(2 & this.f)) {
    this.f |= 6;
    for (var i4 = this.t;i4 !== undefined; i4 = i4.x)
      i4.t.N();
  }
};
_.prototype.peek = function() {
  if (!this.h())
    i3();
  if (16 & this.f)
    throw this.v;
  return this.v;
};
Object.defineProperty(_.prototype, "value", { get: function() {
  if (1 & this.f)
    i3();
  var t5 = c3(this);
  this.h();
  if (t5 !== undefined)
    t5.i = this.i;
  if (16 & this.f)
    throw this.v;
  return this.v;
} });
E.prototype.c = function() {
  var i4 = this.S();
  try {
    if (8 & this.f)
      return;
    if (this.x === undefined)
      return;
    var t5 = this.x();
    if (typeof t5 == "function")
      this.u = t5;
  } finally {
    i4();
  }
};
E.prototype.S = function() {
  if (1 & this.f)
    i3();
  this.f |= 1;
  this.f &= -9;
  g3(this);
  y2(this);
  v3++;
  var t5 = o3;
  o3 = this;
  return x2.bind(this, t5);
};
E.prototype.N = function() {
  if (!(2 & this.f)) {
    this.f |= 2;
    this.o = f3;
    f3 = this;
  }
};
E.prototype.d = function() {
  this.f |= 8;
  if (!(1 & this.f))
    b3(this);
};

// node_modules/@preact/signals/dist/signals.module.js
var l4 = function(n4, i4) {
  l[n4] = i4.bind(null, l[n4] || function() {
  });
};
var d4 = function(n4) {
  if (s3)
    s3();
  s3 = n4 && n4.S();
};
var p4 = function(n4) {
  var r4 = this, f4 = n4.data, o4 = useSignal(f4);
  o4.value = f4;
  var e4 = F2(function() {
    var n5 = r4.__v;
    while (n5 = n5.__)
      if (n5.__c) {
        n5.__c.__$f |= 4;
        break;
      }
    r4.__$u.c = function() {
      var n6;
      if (!t(e4.peek()) && ((n6 = r4.base) == null ? undefined : n6.nodeType) === 3)
        r4.base.data = e4.peek();
      else {
        r4.__$f |= 1;
        r4.setState({});
      }
    };
    return p2(function() {
      var n6 = o4.value.value;
      return n6 === 0 ? 0 : n6 === true ? "" : n6 || "";
    });
  }, []);
  return e4.value;
};
var _3 = function(n4, r4, i4, t5) {
  var f4 = (r4 in n4) && n4.ownerSVGElement === undefined, o4 = a3(i4);
  return { o: function(n5, r5) {
    o4.value = n5;
    t5 = r5;
  }, d: O2(function() {
    var i5 = o4.value.value;
    if (t5[r4] !== i5) {
      t5[r4] = i5;
      if (f4)
        n4[r4] = i5;
      else if (i5)
        n4.setAttribute(r4, i5);
      else
        n4.removeAttribute(r4);
    }
  }) };
};
var useSignal = function(n4) {
  return F2(function() {
    return a3(n4);
  }, []);
};
var v4;
var s3;
p4.displayName = "_st";
Object.defineProperties(d3.prototype, { constructor: { configurable: true, value: undefined }, type: { configurable: true, value: p4 }, props: { configurable: true, get: function() {
  return { data: this };
} }, __b: { configurable: true, value: 1 } });
l4("__b", function(n4, r4) {
  if (typeof r4.type == "string") {
    var i4, t5 = r4.props;
    for (var f4 in t5)
      if (f4 !== "children") {
        var o4 = t5[f4];
        if (o4 instanceof d3) {
          if (!i4)
            r4.__np = i4 = {};
          i4[f4] = o4;
          t5[f4] = o4.peek();
        }
      }
  }
  n4(r4);
});
l4("__r", function(n4, r4) {
  d4();
  var i4, t5 = r4.__c;
  if (t5) {
    t5.__$f &= -2;
    if ((i4 = t5.__$u) === undefined)
      t5.__$u = i4 = function(n5) {
        var r5;
        O2(function() {
          r5 = this;
        });
        r5.c = function() {
          t5.__$f |= 1;
          t5.setState({});
        };
        return r5;
      }();
  }
  v4 = t5;
  d4(i4);
  n4(r4);
});
l4("__e", function(n4, r4, i4, t5) {
  d4();
  v4 = undefined;
  n4(r4, i4, t5);
});
l4("diffed", function(n4, r4) {
  d4();
  v4 = undefined;
  var i4;
  if (typeof r4.type == "string" && (i4 = r4.__e)) {
    var { __np: t5, props: f4 } = r4;
    if (t5) {
      var o4 = i4.U;
      if (o4)
        for (var e4 in o4) {
          var u4 = o4[e4];
          if (u4 !== undefined && !(e4 in t5)) {
            u4.d();
            o4[e4] = undefined;
          }
        }
      else
        i4.U = o4 = {};
      for (var a4 in t5) {
        var c4 = o4[a4], s4 = t5[a4];
        if (c4 === undefined) {
          c4 = _3(i4, a4, s4, f4);
          o4[a4] = c4;
        } else
          c4.o(s4, f4);
      }
    }
  }
  n4(r4);
});
l4("unmount", function(n4, r4) {
  if (typeof r4.type == "string") {
    var i4 = r4.__e;
    if (i4) {
      var t5 = i4.U;
      if (t5) {
        i4.U = undefined;
        for (var f4 in t5) {
          var o4 = t5[f4];
          if (o4)
            o4.d();
        }
      }
    }
  } else {
    var e4 = r4.__c;
    if (e4) {
      var u4 = e4.__$u;
      if (u4) {
        e4.__$u = undefined;
        u4.d();
      }
    }
  }
  n4(r4);
});
l4("__h", function(n4, r4, i4, t5) {
  if (t5 < 3 || t5 === 9)
    r4.__$f |= 2;
  n4(r4, i4, t5);
});
b.prototype.shouldComponentUpdate = function(n4, r4) {
  var i4 = this.__$u;
  if (!(i4 && i4.s !== undefined || 4 & this.__$f))
    return true;
  if (3 & this.__$f)
    return true;
  for (var t5 in r4)
    return true;
  for (var f4 in n4)
    if (f4 !== "__source" && n4[f4] !== this.props[f4])
      return true;
  for (var o4 in this.props)
    if (!(o4 in n4))
      return true;
  return false;
};

// node_modules/preact-router/dist/preact-router.mjs
var c4 = function(n4, t5) {
  for (var r4 in t5)
    n4[r4] = t5[r4];
  return n4;
};
var s4 = function(n4, t5, r4) {
  var i4, o4 = /(?:\?([^#]*))?(#.*)?$/, e4 = n4.match(o4), u4 = {};
  if (e4 && e4[1])
    for (var f4 = e4[1].split("&"), c5 = 0;c5 < f4.length; c5++) {
      var s5 = f4[c5].split("=");
      u4[decodeURIComponent(s5[0])] = decodeURIComponent(s5.slice(1).join("="));
    }
  n4 = d5(n4.replace(o4, "")), t5 = d5(t5 || "");
  for (var h3 = Math.max(n4.length, t5.length), v5 = 0;v5 < h3; v5++)
    if (t5[v5] && t5[v5].charAt(0) === ":") {
      var l5 = t5[v5].replace(/(^:|[+*?]+$)/g, ""), p5 = (t5[v5].match(/[+*?]+$/) || a4)[0] || "", m3 = ~p5.indexOf("+"), y3 = ~p5.indexOf("*"), U = n4[v5] || "";
      if (!U && !y3 && (p5.indexOf("?") < 0 || m3)) {
        i4 = false;
        break;
      }
      if (u4[l5] = decodeURIComponent(U), m3 || y3) {
        u4[l5] = n4.slice(v5).map(decodeURIComponent).join("/");
        break;
      }
    } else if (t5[v5] !== n4[v5]) {
      i4 = false;
      break;
    }
  return (r4.default === true || i4 !== false) && u4;
};
var h3 = function(n4, t5) {
  return n4.rank < t5.rank ? 1 : n4.rank > t5.rank ? -1 : n4.index - t5.index;
};
var v5 = function(n4, t5) {
  return n4.index = t5, n4.rank = function(n5) {
    return n5.props.default ? 0 : d5(n5.props.path).map(l5).join("");
  }(n4), n4.props;
};
var d5 = function(n4) {
  return n4.replace(/(^\/+|\/+$)/g, "").split("/");
};
var l5 = function(n4) {
  return n4.charAt(0) == ":" ? 1 + "*+?".indexOf(n4.charAt(n4.length - 1)) || 4 : 5;
};
var R = function() {
  var n4;
  return "" + ((n4 = U && U.location ? U.location : U && U.getCurrentLocation ? U.getCurrentLocation() : typeof location != "undefined" ? location : p5).pathname || "") + (n4.search || "");
};
var $2 = function(n4, t5) {
  return t5 === undefined && (t5 = false), typeof n4 != "string" && n4.url && (t5 = n4.replace, n4 = n4.url), function(n5) {
    for (var t6 = m3.length;t6--; )
      if (m3[t6].canRoute(n5))
        return true;
    return false;
  }(n4) && function(n5, t6) {
    t6 === undefined && (t6 = "push"), U && U[t6] ? U[t6](n5) : typeof history != "undefined" && history[t6 + "State"] && history[t6 + "State"](null, null, n5);
  }(n4, t5 ? "replace" : "push"), I2(n4);
};
var I2 = function(n4) {
  for (var t5 = false, r4 = 0;r4 < m3.length; r4++)
    m3[r4].routeTo(n4) && (t5 = true);
  return t5;
};
var M2 = function(n4) {
  if (n4 && n4.getAttribute) {
    var t5 = n4.getAttribute("href"), r4 = n4.getAttribute("target");
    if (t5 && t5.match(/^\//g) && (!r4 || r4.match(/^_?self$/i)))
      return $2(t5);
  }
};
var b4 = function(n4) {
  return n4.stopImmediatePropagation && n4.stopImmediatePropagation(), n4.stopPropagation && n4.stopPropagation(), n4.preventDefault(), false;
};
var W = function(n4) {
  if (!(n4.ctrlKey || n4.metaKey || n4.altKey || n4.shiftKey || n4.button)) {
    var t5 = n4.target;
    do {
      if (t5.localName === "a" && t5.getAttribute("href")) {
        if (t5.hasAttribute("data-native") || t5.hasAttribute("native"))
          return;
        if (M2(t5))
          return b4(n4);
      }
    } while (t5 = t5.parentNode);
  }
};
var D = function(n4) {
  n4.history && (U = n4.history), this.state = { url: n4.url || R() };
};
var a4 = {};
var p5 = {};
var m3 = [];
var y3 = [];
var U = null;
var g4 = { url: R() };
var k3 = G(g4);
var w4 = false;
c4(D.prototype = new b, { shouldComponentUpdate: function(n4) {
  return n4.static !== true || n4.url !== this.props.url || n4.onChange !== this.props.onChange;
}, canRoute: function(n4) {
  var t5 = C(this.props.children);
  return this.g(t5, n4) !== undefined;
}, routeTo: function(n4) {
  this.setState({ url: n4 });
  var t5 = this.canRoute(n4);
  return this.p || this.forceUpdate(), t5;
}, componentWillMount: function() {
  this.p = true;
}, componentDidMount: function() {
  var n4 = this;
  w4 || (w4 = true, U || addEventListener("popstate", function() {
    I2(R());
  }), addEventListener("click", W)), m3.push(this), U && (this.u = U.listen(function(t5) {
    var r4 = t5.location || t5;
    n4.routeTo("" + (r4.pathname || "") + (r4.search || ""));
  })), this.p = false;
}, componentWillUnmount: function() {
  typeof this.u == "function" && this.u(), m3.splice(m3.indexOf(this), 1);
}, componentWillUpdate: function() {
  this.p = true;
}, componentDidUpdate: function() {
  this.p = false;
}, g: function(n4, t5) {
  n4 = n4.filter(v5).sort(h3);
  for (var r4 = 0;r4 < n4.length; r4++) {
    var i4 = n4[r4], o4 = s4(t5, i4.props.path, i4.props);
    if (o4)
      return [i4, o4];
  }
}, render: function(n4, t5) {
  var e4, u4, f4 = n4.onChange, a5 = t5.url, s5 = this.c, h4 = this.g(C(n4.children), a5);
  if (h4 && (u4 = F(h4[0], c4(c4({ url: a5, matches: e4 = h4[1] }, e4), { key: undefined, ref: undefined }))), a5 !== (s5 && s5.url)) {
    c4(g4, s5 = this.c = { url: a5, previous: s5 && s5.url, current: u4, path: u4 ? u4.props.path : null, matches: e4 }), s5.router = this, s5.active = u4 ? [u4] : [];
    for (var v6 = y3.length;v6--; )
      y3[v6]({});
    typeof f4 == "function" && f4(s5);
  }
  return y(k3.Provider, { value: s5 }, u4);
} });

// imports.js
var html = function(h4) {
  _html(h4);
};
function For({ each, children: f4 }) {
  let c5 = F2(() => new Map, []);
  let value;
  if (typeof each === "object") {
    if ("value" in each) {
      value = each.value;
    } else {
      value = each;
    }
  } else if (typeof each === "function") {
    value = each();
  } else {
    value = each;
  }
  if (!Array.isArray(value))
    return html`<${Item} v=${value} f=${f4} />`;
  return value.map((v6, k4, x3) => c5.get(v6) || (c5.set(v6, x3 = html`<${Item} v=${v6} k=${k4} f=${f4} />`), x3));
}
function Show({ when, fallback, children: f4 }) {
  let v6;
  if (typeof when === "object") {
    if ("value" in when) {
      v6 = when.value;
    } else {
      v6 = when;
    }
  } else if (typeof when === "function") {
    v6 = when();
  } else {
    v6 = when;
  }
  return Boolean(v6) ? typeof f4 === "function" ? html`<${Item} v=${v6} f=${f4} />` : f4 : fallback;
}
var _html = htm_module_default.bind(y);
var Item = ({ v: v6, k: k4, f: f4 }) => f4(v6, k4);
d3.prototype.map = function(fn) {
  return html`<${For} each=${this} children=${fn} />`;
};
export {
  Show,
  For
};
