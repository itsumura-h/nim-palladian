*―― Palladian is a contemporary interpretation of Greek and Roman architecture, a simple and compact expression of complex classical design.*

Palladian is a Nim front-end framework based on and wrapped around Preact.

[Official Document Page](https://itsumura-h.github.io/nim-palladian/)  
And it's source code is [here](https://github.com/itsumura-h/nim-palladian/tree/main/examples/document)

## Why Preact?
In creating a front-end framework made by Nim, we needed something that did not require a NodeJS environment and did not require transpiling using Babel or other software.
Preact can use all of its features with a CDN call, and has a very compact library size of 3KB.

### VS React
React's JSX allows you to write HTML declaratively, but it is a unique DSL that differs from the original HTML in that it uses elements such as `className` as camelCase.
The [`HTM`](https://github.com/developit/htm) used by Preact is a composable library that runs by itself with no other dependencies, and allows you to use a declarative UI and virtual DOM in a notation more similar to plain HTML. React's events are composited in React's own syntax.
React's events are React's own composited events, but Preact's events are browser-native JavaScript events, so you can use Nim's `std/dom` as is.

### VS SolidJS
SolidJS does not use a virtual DOM and runs faster than Preact, but the objects embedded in its JSX must be called as functions, which prevents re-rendering and provides higher performance. However, the convenience of calling it from Nim makes debugging time-consuming and costly due to its different behavior from the mental model.
To sense variable changes beyond components, React requires 3rd party libraries such as Redux and Recoil, while SolidJS has a simpler implementation through a feature called Signal, and Preact also has Signal's functionality.
In addition, Preact author Jason Miller has prepared [SoidJS's own control flow, `For` and `Show`](https://www.solidjs.com/docs/latest/api#for), for use in Preact.

https://gist.github.com/developit/af2a4488de152a84bff83e035bb8afc1

### VS Karax
Most modern front-end development is not done by server-side engineers on their own, but rather by designers using HTML created by Figma or TereportHQ, to which front-end engineers implement processing.
Karax creates HTML with its own Nim functions, which would be very costly and impractical for collaboration and portability with designers and tools.
Also, while its unique virtual DOM implementation is eye-catching, it has not kept pace with research into more efficient virtual DOM implementations and reactive UI without virtual DOM in the front-end world, and has not maintained a high quality level compared to other frameworks in the front-end world.
