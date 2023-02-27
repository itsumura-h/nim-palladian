import std/jsffi

{.emit:"""
  import MarkdownIt from 'https://esm.sh/markdown-it@13.0.1';
""".}

type MarkdownIt* = object

proc new*(_:type MarkdownIt):MarkdownIt {.importjs:"new MarkdownIt(@)".}
proc render*(self:MarkdownIt, arg:cstring):cstring {.importjs:"#.render(#)".}
