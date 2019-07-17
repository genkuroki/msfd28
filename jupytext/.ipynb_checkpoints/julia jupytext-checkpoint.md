---
jupyter:
  jupytext:
    formats: ipynb,md,jl:hydrogen
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.1'
      jupytext_version: 1.1.7
  kernelspec:
    display_name: Julia 1.1.1
    language: julia
    name: julia-1.1
---

# Juliaカーネルのjupytext

* 黒木玄
* 2019-07-17

jupytextを使うと, Jupyter notebook および JupyterLab で ipynb ファイルを保存するときに自動的に jl ファイルや md ファイルを生成して保存するようにできる. ipynb ファイルでの diff は実用的な差分を出力しないことが多い. jupytext を使って jl ファイルや md ファイルを自動生成するようにしておけば, diff によって十分に実用的な差分の出力が得られる.

* https://github.com/mwouts/jupytext
* https://www.google.com/search?q=jupytext

$
\newcommand\real{\operatorname{Re}}
\newcommand\imag{\operatorname{Im}}
$


## Juliaのコード

```julia
using Plots
pyplot(fmt=:svg)
using SpecialFunctions

f(x; h=1e-8) = (zeta(h, x) - zeta(0, x))/h + log(√(2π))
x = range(0.1, 5, length=200)
P = plot(size=(500, 300))
plot!(x, lgamma.(x), label="\$\\log\\Gamma(x)\$", lw=2)
plot!(x, f.(x), label="\$\\zeta_s(0,x)+\\log\\sqrt{2\\pi}\$", lw=2, ls=:dash)
```

```julia
savefig(P, "Lerch.png")
```

## markdownによる説明

### Hurwitzのゼータ函数

Hurwitzのゼータ函数は $\real s > 1$ で収束する 

$$
\zeta(s, x) = \sum_{k=0}^\infty \frac{1}{(x+k)^s}
$$

の解析接続として定義される(解析接続の結果も同じ記号で書かれる).

### Lerchの定理

ガンマ函数 $\Gamma(x)=\int_0^\infty e^{-t} t^{x-1}\,dt$ の対数は

$$
\log\Gamma(x) = \log\zeta_s(0,x) + \log\sqrt{2\pi}
$$

と表わされる.


![Lerchの定理](Lerch.png)

```julia

```
