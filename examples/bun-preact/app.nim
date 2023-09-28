import std/dom
import std/jsffi
import std/jsconsole
import palladian
import ./pages/top_page
import ./pages/about_page


proc App():Component {.exportc.} =
  return html(fmt"""
    <style>
      body {
        background-color:#333333;
      }
      article {
        margin: 16px;
      }
      .title {
        color: goldenrod;
        text-align: center;
      }
      .goldFont {
        color: goldenrod;
      }
      .whiteFont {
        color: silver;
      }
      ul li {
        margin: 8px;
      }
      a {
        color: skyblue;
      }
    </style>
    <article>
      <section>
        <h1 class="title">Nim Palladian is successfully running!!!</h1>
      </section>
    </article>
    <${Router}>
      <${TopPage} path="/" />
      <${AboutPage} path="/about" />
    <//>
  """)


renderApp(App, document.getElementById("app"))
