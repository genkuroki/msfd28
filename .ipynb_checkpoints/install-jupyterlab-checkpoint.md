# JupyterLabのインストール

* Author: 黒木玄
* Date: 2019-03-23

これは [Julia v1.1.0 の Windows 8.1 へのインストール](https://nbviewer.jupyter.org/github/genkuroki/msfd28/blob/master/install.ipynb) の続き.

Julia環境化にminicondaでPython環境を作ったことを仮定する.

パスの形式についてWindows形式を前提にしているので注意せよ.

## JupyterLab自体のインストール

[JupyterLab](https://github.com/jupyterlab/jupyterlab)をjulia内から以下のようにしてインストール可能である.

```julia
julia> using Conda
julia> Conda.add_channel("conda-forge")
julia> Conda.add("jupyterlab")
```

以下の内容のショートカットを作成した.

リンク先: C:\Users\genkuroki\.julia\conda\3\Scripts\jupyter-lab.exe

作業フォルダ: C:\Users\genkuroki\OneDrive

C:\Users\genkuroki のような部分は自分のWindowsアカウントに合わせて変えて欲しい.

このようにして作ったショートカットをダブルクリックすればブラウザにJupyterLabのタブが開く.

## JupyterLab Extensions

JupyterLabには多数の[Extensions](https://github.com/topics/jupyterlab-extension)が開発されている.

### jupyterlab-latex

[jupyterlab-latex](https://github.com/jupyterlab/jupyterlab-latex) をインストールするにはjulia内で以下を実行する. shellモードには行頭で ; を入力すれば入れる.

```julia
julia> ENV["PATH"] = Conda.PYTHONDIR*";" * Conda.SCRIPTDIR*";" * ENV["PATH"]
shell> pip install jupyterlab-latex
shell> jupyter serverextension enable --sys-prefix jupyterlab_latex
shell> jupyter labextension install @jupyterlab/latex
```

これで jupyterlab-latex 0.4.1 がインストールされた(2019-03-23).

**注意:** `conda install -c krinsman jupyterlab-latex` によってインストールすると 0.4.0 がインストールされてしまい, Windows上でSyncTexが動かなくなる.

### jupyterlab-git

[jupyterlab-git](https://github.com/jupyterlab/jupyterlab-git) をインストールするにはjulia内で以下を実行する.

```julia
julia> using Conda
julia> ENV["PATH"] = Conda.PYTHONDIR*";" * Conda.SCRIPTDIR*";" * ENV["PATH"]
shell> jupyter labextension install @jupyterlab/git
shell> pip install jupyterlab-git
shell> jupyter serverextension enable --py jupyterlab_git
```

**注意:** pip を使わずに conda を使って jupyterlab-git をインストールしたら ["Go find a repo"](https://github.com/jupyterlab/jupyterlab-git/issues/179#issuecomment-412914042), ["You aren’t in a git repository"](https://github.com/jupyterlab/jupyterlab-git/issues/212) と言われてどうにもできなくなった.
