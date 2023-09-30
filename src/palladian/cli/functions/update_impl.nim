import std/osproc

proc update*() =
  ## = `bun update`. Update outdated dependencies.
  echo execProcess("bun update")
