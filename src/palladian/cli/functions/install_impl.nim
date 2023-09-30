import std/osproc

proc install*() =
  ## = `bun install`. Install dependencies for a package.json
  echo execProcess("bun install")
