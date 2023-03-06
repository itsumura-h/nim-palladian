
import std/os
import std/osproc
import std/re
import std/strformat
import std/tables
import std/terminal
import std/times

let
  sleepTime = 2
  currentDir = getCurrentDir()

var
  files: Table[string, Time]
  isModified = false
  p: Process
  port:int

proc echoMsg(bg: BackgroundColor, msg: string) =
  styledEcho(fgBlack, bg, &"{msg} ", resetStyle)

proc ctrlC() {.noconv.} =
  if p != nil:
    p.close()
  # echoMsg(bgGreen, "[SUCCESS] Stoped dev server")
  quit 0
setControlCHook(ctrlC)


proc buildCommand() =
  try:
    let cmd = "nim js -d:nimExperimentalAsyncjsThen -o:./public/app.js app"
    echo cmd
    if execShellCmd(cmd) > 0:
      raise newException(Exception, "")
    echoMsg(bgGreen, &"Running dev server at http://localhost:{port}")
    echoMsg(bgGreen, "[SUCCESS] Building JavaScript application")
  except:
    echoMsg(bgRed, "[FAILED] Build error")
    echo getCurrentExceptionMsg()

proc runServer(portArg:int) =
  try:
    if p != nil:
      p.close()
    p = startProcess(&"palladian serve -p {portArg}", options={poStdErrToStdOut, poParentStreams, poEvalCommand})
    # echoMsg(bgGreen, &"[SUCCESS] Running dev server http://localhost:{port}")
    port = portArg
  except:
    echoMsg(bgRed, "[FAILED] Build error")
    echo getCurrentExceptionMsg()

proc dev*(portArg=3000) =
  ## Run server for development with hot reload.
  runServer(portArg)
  buildCommand()
  while true:
    sleep sleepTime * 1000
    for f in walkDirRec(currentDir, {pcFile}):
      if f.find(re"(\.nim|\.nims|\.html)$") > -1:
        var modTime: Time
        try:
          modTime = getFileInfo(f).lastWriteTime
        except:
          # file is deleted
          files.del(f)
          isModified = true
          break

        if not files.hasKey(f):
          files[f] = modTime
          # debugEcho &"Skip {f} because of first checking"
          continue
        if files[f] == modTime:
          # debugEcho &"Skip {f} because of the file has not modified"
          continue
        # modified
        isModified = true
        files[f] = modTime
        break

    if isModified:
      isModified = false
      # runCommand(port)
      buildCommand()
