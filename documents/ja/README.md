*―― Palladianはギリシャ・ローマ建築の現代的な解釈であり、複雑な古典的なデザインをシンプルでコンパクトに表現している。*

PalladianはPreactに基づいたNim製フロントエンドフレームワークです。

## なぜPreactか？
Nim製フロントエンドフレームワークを作るにあたって、NodeJSの環境やBabelなどを使ったトランスパイルが不要であることが必要でした。
PreactはCDN呼び出してその機能の全てを使うことができ、またライブラリサイズも3KBと非常にコンパクトです。

### VS React
ReactのJSXを使うとHTMLを宣言的に書けるが、`className`や要素をキャメルケースにしていることなど本来のHTMLとは異なる独自のDSLです。
Preactで使用している[`HTM`](https://github.com/developit/htm)は他に依存性を持たず単体で動くコンポ―サビリティを持ったライブラリであり、より素のHTMLに近い記法で宣言的UIと仮想DOMを使うことができます。
ReactのイベントはReact独自の合成イベントですが、PreactではブラウザネイティブのJavaScriptイベントなので、Nimの`std/dom`をそのまま使うことができます。

### VS SolidJS
SolidJSは仮想DOMを使わずPreactよりも高速に動作しますが、そのJSXは`<For>`など独自記法が含まれ、学習コストになります。
JavaScriptのセマンティクスから逸脱した
コンポーネントを超えて変数の変更を感知するためにReactではReduxやRecoilなど3rdパーティライブラリが必要で、SolidJSではSignalという機能によってよりシンプルに実現しているが、PreactもSignalの機能を持っています。

https://qiita.com/uhyo/items/ff243a5771077aaf4b5b#4%E4%BD%8D-solidjs

コンパイルなし  
https://www.solidjs.com/guides/getting-started#%E3%82%B3%E3%83%B3%E3%83%91%E3%82%A4%E3%83%AB%E3%81%AA%E3%81%97%EF%BC%9F

### VS Karax
