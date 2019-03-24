# JupyterLabのインストール

* Author: 黒木玄
* Date: 2019-03-23

これは [Julia v1.1.0 の Windows 8.1 へのインストール](https://nbviewer.jupyter.org/github/genkuroki/msfd28/blob/master/install.ipynb) の続き.

Julia環境化にminicondaでPython環境を作ったことを仮定する.

パスの形式についてWindows形式を前提にしているので注意せよ.

## JupyterLab のインストール

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

## JupyterLab Extensions のインストール

JupyterLabには多数の[Extensions](https://github.com/topics/jupyterlab-extension)が開発されている.

### jupyterlab-latex

[jupyterlab-latex](https://github.com/jupyterlab/jupyterlab-latex) をインストールするにはjulia内で以下を実行する. shellモードには行頭で ; を入力すれば入れる.

```julia
julia> ENV["PATH"] = Conda.PYTHONDIR*";" * Conda.SCRIPTDIR*";" * ENV["PATH"]
shell> pip install https://github.com/jupyterlab/jupyterlab-latex.git
shell> jupyter serverextension enable --sys-prefix jupyterlab_latex
shell> jupyter labextension install @jupyterlab/latex
```

これで jupyterlab-latex の最新版がインストールされた.

**注意:** `conda install -c krinsman jupyterlab-latex` によってインストールすると 0.4.0 がインストールされてしまい, Windows上でSyncTexが動かなくなる.

さらに以下の1行を ~/.jupyter/jupyter_notebook_config.py に追加した:

```python
c.LatexConfig.run_times = 3
```

実際に使うと以下のような感じになる. プレビュー部分が小さいのは目次と本文の一部が両方見えるようにするため. もちろん, 見易い大きさに拡大できる.

<img src="images/jupyterlab-latex.png" width="80%" />

**注意:** この1行を追加しないと, LaTeXのコンパイル結果に目次などが追加されなくなる.

### jupyterlab-github

[jupyterlab-github](https://github.com/jupyterlab/jupyterlab-github) はJupyterLab内から自分のGitHubアカウント内のリポジトリに覗くための道具である. これを書いている時点では(2019-03-24), リポジトリに書き込む機能を持たない.

[jupyterlab-github](https://github.com/jupyterlab/jupyterlab-github) をインストールするにはjulia内でまず以下を実行する. shellモードには行頭で ; を入力すれば入れる.

```julia
julia> using Conda
julia> ENV["PATH"] = Conda.PYTHONDIR*";" * Conda.SCRIPTDIR*";" * ENV["PATH"]
shell> jupyter labextension install @jupyterlab/github
shell> pip install jupyterlab_github
shell> jupyter serverextension enable --sys-prefix jupyterlab_github
```

そして, [jupyterlab-githubのREADME](https://github.com/jupyterlab/jupyterlab-github/blob/master/README.md) の指示にしたがって, [GitHub](https://github.com/) のアカウントを取得し, access token を取得し,  ~/.jupyter/jupyter_notebook_config.py に次の1行を付け加えて取得した access token を登録する:

```python
c.GitHubConfig.access_token = '< YOUR_ACCESS_TOKEN >'
```

**警告:** access token が保存してあるファイルを他人に見える場所に置かないこと. access token は実質的に GitHub アカウントのパスワードである.

### jupyterlab-git

[jupyterlab-git](https://github.com/jupyterlab/jupyterlab-git) をインストールするにはjulia内で以下を実行する. shellモードには行頭で ; を入力すれば入れる.

```julia
julia> using Conda
julia> ENV["PATH"] = Conda.PYTHONDIR*";" * Conda.SCRIPTDIR*";" * ENV["PATH"]
shell> jupyter labextension install @jupyterlab/git
shell> pip install jupyterlab-git
shell> jupyter serverextension enable --py jupyterlab_git
```

**注意:** pip を使わずに conda を使って jupyterlab-git をインストールしたら ["Go find a repo"](https://github.com/jupyterlab/jupyterlab-git/issues/179#issuecomment-412914042), ["You aren’t in a git repository"](https://github.com/jupyterlab/jupyterlab-git/issues/212) と言われてどうにもできなくなった.
