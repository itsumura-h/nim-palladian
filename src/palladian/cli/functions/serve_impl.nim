import std/asyncdispatch
import std/asynchttpserver
import ../../../server

proc controller(req:Request):Future[string] {.async.}=
  let html = readFile("index.html")
  return html

proc serve*(port=3000) =
  var routes:seq[Route] = @[]
  routes.add Route(httpMethod:HttpGet, path:"*", controller:controller)
  runServe(routes, port).waitFor
