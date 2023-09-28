import std/osproc

proc install*() =
  echo execProcess("bun add preact htm @preact/signals preact-router")
