
import std/os
import std/osproc
import std/re
import std/strformat
import std/strutils
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

proc echoMsg(bg: BackgroundColor, msg: string) =
  styledEcho(fgBlack, bg, &"{msg} ", resetStyle)

proc ctrlC() {.noconv.} =
  if p != nil:
    p.close()
  # echoMsg(bgGreen, "[SUCCESS] Stoped dev server")
  quit 0
setControlCHook(ctrlC)


proc runCommand(port:int) =
  var isInProjectDir = false
  for (kind, path) in walkDir(getCurrentDir()):
    if path.contains(".nimble"):
      isInProjectDir = true
  if not isInProjectDir:
    raise newException(Exception, "Run command in directory which contains nimble file")

  try:
    if p != nil:
      p.close()
    let cmd = "nim js -d:nimExperimentalAsyncjsThen -o:./public/app.js app"
    echo cmd
    if execShellCmd(cmd) > 0:
      raise newException(Exception, "")
    p = startProcess(&"palladian serve -p {port}", options={poStdErrToStdOut, poParentStreams, poEvalCommand})
    echoMsg(bgGreen, "[SUCCESS] Building dev server")
  except:
    echoMsg(bgRed, "[FAILED] Build error")
    echo getCurrentExceptionMsg()
    # quit 1

proc dev*(port=3000) =
  ## Run server for development with hot reload.
  runCommand(port)
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
      runCommand(port)
