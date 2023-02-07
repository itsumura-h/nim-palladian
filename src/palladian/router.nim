import std/jsffi
import ./preact

{.emit:"""
import {Router, Link} from 'https://cdn.jsdelivr.net/npm/preact-router@4.1.0/+esm';
""".}

proc Router*():Component {.importcpp: "Router".}
proc Link*():Component {.importcpp: "Link".}
