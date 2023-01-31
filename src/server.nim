import std/asyncdispatch
import std/asynchttpserver
import std/asyncfile
import std/mimetypes
import std/os
import std/strutils

type Route* = object
  httpMethod*:HttpMethod
  path*:string
  controller*:proc(req:Request):Future[string] {.gcsafe.}

proc serve*(routes:seq[Route], port=8080) {.async.} =
  var server = newAsyncHttpServer()
  proc cb(req: Request) {.async, gcsafe.} =
    try:
      if req.url.path.contains("."):
        let filepath = getCurrentDir() & req.url.path
        if fileExists(filepath):
          let file = openAsync(filepath, fmRead)
          let data = file.readAll().await
          let contentType = newMimetypes().getMimetype(req.url.path.split(".")[^1])
          var headers = newHttpHeaders()
          headers["content-type"] = contentType
          await req.respond(Http200, data, headers)
      let headers = {"Content-type": "text/html; charset=utf-8"}
      for route in routes:
        if req.reqMethod == route.httpMethod and req.url.path == route.path:
          await req.respond(Http200, route.controller(req).await, headers.newHttpHeaders())
          break
      await req.respond(Http404, "", headers.newHttpHeaders())
    except:
      echo getCurrentExceptionMsg()
      await req.respond(Http400, "", newHttpHeaders())

  server.listen(Port(port)) # or Port(8080) to hardcode the standard HTTP port.
  let port = server.getPort
  echo "test this with: curl localhost:" & $port.uint16 & "/"
  while true:
    if server.shouldAcceptRequest():
      await server.acceptRequest(cb)
    else:
      await sleepAsync(500)
