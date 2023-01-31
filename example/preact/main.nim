import std/asyncdispatch
import std/asynchttpserver
import ../../src/server

const html = staticRead("./index.html")

proc controller(req:Request):Future[string] {.async.}=
  return html

var routes:seq[Route] = @[]
routes.add Route(httpMethod:HttpGet, path:"/", controller:controller)
routes.add Route(httpMethod:HttpGet, path:"/page1", controller:controller)
routes.add Route(httpMethod:HttpGet, path:"/page2", controller:controller)
routes.add Route(httpMethod:HttpGet, path:"/page3", controller:controller)
serve(routes, 9001).waitFor
