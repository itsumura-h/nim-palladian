import std/jsffi
import ./preact

{.emit:"""
import {Router} from 'https://esm.sh/preact-router@4.1.0?deps=preact@10.12.1';
import {Link} from 'https://esm.sh/preact-router@4.1.0/match?deps=preact@10.12.1';
""".}
