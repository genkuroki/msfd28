# Weaveの使い方

Author: 黒木 玄

Date: 2019-03-13

* [Weave.jl](https://github.com/mpastell/Weave.jl) は [Julia言語](https://julialang.org/) と[その Jupyter kernel](https://github.com/JuliaLang/IJulia.jl) の組み合わせで文書を作成するために使える便利なツールである.

* ノートブック `Convert ipynb into html, tex, pdf.ipynb` を実行するとノートブック `テスト.ipynb` から jmd, html, tex, pdf ファイルが作成される. jmdファイルは Julia 言語のコードを含む markdown ファイルである.

* Weave.jl のパッケージに含まれる julia_html.tpl, julia_tex.tpl のそれぞれに訂正を加えることによって myhtml.tpl, mytex.tpl を作成した. 主に日本語対応とLaTeXのマクロの定義の追加.
