{.pragma: jso, exportc.}

using
  props: ComponentProps
  event: Event

template fmt(markup:string):Component = html markup.cstring


template app*(name:untyped; body:untyped):(proc ():Component {.exportc.}) =
  proc `name`*(props:ComponentProps):Component {.exportc.} =
    body

template component*(name:untyped; body:untyped):(proc (props:ComponentProps):Component {.exportc.}) =
  proc `name`*(props:ComponentProps):Component {.exportc.} =
    body

template event*(name:untyped; body:untyped):(proc (event:Event) {.exportc.}) =
  proc `name`*(event:Event) {.exportc.} =
    body
