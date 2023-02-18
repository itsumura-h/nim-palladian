## use https://esm.sh for CDN.
## You can explicitly tell it which version of any dependency to use.

template importPreact*() =
  {.emit: """
    import {h, render} from 'https://esm.sh/preact@10.12.1';
    import htm from 'https://esm.sh/htm@3.1.1';
    const html = htm.bind(h);
  """.}

template importPreactHooks*() =
  {.emit: """
    import { useState, useEffect, useMemo } from 'https://esm.sh/preact@10.12.1/hooks';
    import { signal, Signal } from 'https://esm.sh/@preact/signals@1.1.3?deps=preact@10.12.1';
  """.}

template importPreactRouter*() =
  {.emit: """
    import {Router} from 'https://esm.sh/preact-router@4.1.0?deps=preact@10.12.1';
    import {Link} from 'https://esm.sh/preact-router@4.1.0/match?deps=preact@10.12.1';
  """.}
