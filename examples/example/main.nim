import std/asyncdispatch
import std/asynchttpserver
import ../../src/server

proc controller(req:Request):Future[string] {.async.}=
  let html = readFile("index.html")
  return html

var routes:seq[Route] = @[]
routes.add Route(httpMethod:HttpGet, path:"*", controller:controller)
serve(routes, 9001).waitFor
