# Rego 入門

OPA のポリシー言語 Rego と、Conftest の入門書です。

- Web 版: https://winebarrel.github.io/rego-book/
- PDF 版・EPUB 版: Web 版のダウンロードリンク、または [Releases](https://github.com/winebarrel/rego-book/releases) から入手できます。

## ビルド

必要なもの:

- [Quarto](https://quarto.org/)
- [OPA](https://github.com/open-policy-agent/opa) と [Conftest](https://github.com/open-policy-agent/conftest)（サンプルの実行結果を作るため）
- PDF 版を作る場合は TeX 環境（`quarto install tinytex` で入ります）

```sh
quarto preview          # Web 版をプレビューする
quarto render           # Web 版・PDF 版・EPUB 版を _book/ に作る
quarto render --to html # Web 版だけを作る
```

`quarto render` の前に `scripts/gen-outputs.sh` が実行され、サンプルの実行結果が作られます。

## ディレクトリ構成

| パス | 内容 |
| --- | --- |
| `index.qmd`, `chapters/` | 本文 |
| `examples/` | サンプルコード。章ごと、例ごとにディレクトリを分ける |
| `_extensions/example/` | サンプルを本文に埋め込むショートコード |
| `scripts/` | サンプルの実行・確認、CI 用のスクリプト |
| `assets/rego.xml` | Rego のシンタックスハイライトの定義 |
| `OUTLINE.md` | 章立て案と執筆方針 |

## サンプルの書き方

サンプルは `examples/<章>/<例>/` に置きます。

- ポリシーや入力のファイルを置きます。本文では `{{< file <章>/<例>/<ファイル名> >}}` で表示します。
- `cmd` に、本文に載せるコマンドを 1 行に 1 つ書きます。ビルド時に例のディレクトリで実行され、結果が `output.txt` に保存されます。本文では `{{< run <章>/<例> >}}` で表示します。
- コマンドが失敗することを見せる例には、`expect-fail` という空のファイルを置きます。置いていないのにコマンドが失敗した場合と、置いているのにすべて成功した場合は、ビルドが失敗します。
- Rego のファイルは `opa fmt` で整形します。構文エラーを見せる例など、整形できないものには `no-fmt` という空のファイルを置きます。

## ライセンス

文章とサンプルコードは [CC0 1.0](LICENSE) で公開しています。
