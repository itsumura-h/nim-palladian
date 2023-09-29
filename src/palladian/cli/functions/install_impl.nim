import std/osproc

proc install*() =
  echo execProcess("bun install")
