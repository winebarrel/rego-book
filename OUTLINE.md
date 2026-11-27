# 章立て案

この本の章立てと、執筆の方針をまとめたファイルです。本には含めません。

## 方針

- 対象読者は、Rego を初めて触る人から、入門したばかりの人まで。
- 第 II 部（Rego 言語）は、OPA 公式ドキュメントの [Policy Language](https://www.openpolicyagent.org/docs/policy-language) の順に説明する。
- まだ説明していない機能は、本文でもサンプルでも使わない。ドキュメントの順番どおりでは説明前の機能が必要になる箇所は、例を書き換えるか、その機能の説明を前に移す。移した箇所は下の「ドキュメントの順番と変えた箇所」に記録する。
- 第 III 部（OPA と Conftest）では、ドメインの情報（Kubernetes マニフェストの構造など、Rego と関係なく成り立つ知識）と、そのドメインに特化した Rego の書き方を節で分ける。
- Conftest の章では、Rego 側が何を評価し、Conftest がその結果のどこを見ているかを分けて説明する。
- OPA のドキュメントは Apache-2.0 なので、文章や例は写さない。章の順番だけを参考にし、説明と例は独自に書く。
- 対象バージョンは OPA 1.23.0、Conftest 0.71.1（内蔵する OPA は 1.21.1）。

## 章立て

章番号は本での番号です（「はじめに」には番号が付きません）。ドキュメントとの対応は、Policy Language ページの見出しです。

### 第 I 部 概要

- はじめに（`index.qmd`、章番号なし）: 対象読者、本の構成、環境の準備、Rego Playground の案内
1. OPA・Rego・Conftest の関係（`chapters/overview.qmd`）

### 第 II 部 Rego 言語

| 章 | 内容 | ドキュメントの見出し |
| --- | --- | --- |
| 2. はじめての Rego | `package`、ルール、`input`、`if`、undefined、AND と OR | The Basics |
| 3. スカラー値と文字列 | 数値・真偽値・null、文字列、ローストリング、文字列補間、組み込み関数の呼び方 | Scalar Values, Strings |
| 4. 複合値 | 配列、オブジェクト、集合 | Composite Values |
| 5. 変数と参照 | 変数、参照、反復（`some`）、`_`、複数の式による結合 | Variables, References |
| 6. 内包表記 | 配列・オブジェクト・集合の内包表記 | Comprehensions |
| 7. ルール | 集合（`contains`）・オブジェクトを生成するルール、増分定義、完全定義、参照を含むルールヘッド、関数 | Rules |
| 8. 否定 | `not` | Negation |
| 9. すべての要素に対する条件 | `every` と、否定を使った書き方 | Universal Quantification, Every Keyword |
| 10. モジュール | コメント、パッケージ、インポート | Modules |
| 11. キーワードの整理 | `in`（所属判定）、`if`、`contains`、`some`、`or` | In / If / Contains / Some / And and Or Keyword |
| 12. `with` | 入力・データ・関数の差し替え | With Keyword |
| 13. `default` と `else` | 既定値、順序付きの評価 | Default Keyword, Else Keyword |
| 14. 演算子 | `:=`、`==`、`=`（単一化）、比較演算子 | Operators |
| 15. 組み込み関数 | 呼び出し方、名前空間、エラー、よく使う関数 | Built-in Functions |
| 16. メタデータ | `# METADATA` によるアノテーション | Metadata |
| 17. スキーマと strict モード | JSON Schema による型検査、`--strict` | Schema, Strict Mode |

### 第 III 部 OPA と Conftest

18. OPA と Conftest の概要（`chapters/opa-conftest.qmd`）: OPA の使われ方、Conftest が担当すること
19. OPA の CLI: `opa eval`、`opa fmt`、`opa check`、`opa test`（ドキュメントの Policy Testing に対応）
20. Conftest は何を評価しているか: Conftest と OPA の関係、ファイルから `input` を作る仕組み、どのパッケージのどのルールを問い合わせるか、ルールの値のどこを見て成否を決めるか、`exception`、`data.conftest.file`
21. Conftest の使い方: `conftest test` の主なオプション、`conftest verify` によるポリシーのテスト
22. Kubernetes マニフェスト: ドメインの情報 → Rego の書き方
23. Terraform: ドメインの情報（HCL と plan JSON）→ Rego の書き方
24. Dockerfile: ドメインの情報 → Rego の書き方

## ドキュメントの順番と変えた箇所

| 機能 | ドキュメントで説明している位置 | この本で最初に説明する位置 | 理由 |
| --- | --- | --- | --- |
| `package`（最低限） | Modules > Packages | 2 章 | 最初のポリシーから必要になる |
| `:=` による値の定義（最低限） | Operators > Assignment | 2 章 | 最初のポリシーから必要になる |
| `==` と比較演算子（最低限） | Operators | 2 章 | 条件を書くために必要になる |
| ドットによるフィールドの参照（最低限） | References | 2 章 | `input.user.role` のように入力を読むために必要になる |
| 組み込み関数の呼び方（最低限） | Built-in Functions | 3 章 | 文字列の操作で使う。名前空間やエラーの扱いは 15 章で説明する |
| 文字列補間で値が undefined のときの `sprintf` との比較 | Strings > Undefined values | 15 章 | `sprintf` と `default` を説明した後に回す |
| 添字によるアクセス（最低限） | References | 4 章 | 配列やオブジェクトの要素を取り出す例に必要になる |
| `some` による反復 | Some Keyword, In Keyword | 5 章 | 参照の説明で反復を扱うため。`in` による所属判定は 11 章で説明する |
| `contains` | Contains Keyword | 7 章 | ドキュメントでも Rules で使い始めるので、そこで説明する |
| `every` | Every Keyword | 9 章 | 「すべての要素に対する条件」の章でまとめて説明する |
| `import future.keywords.not`（最低限） | Modules > Imports | 8 章 | `not` を正しく使うために必要になる。`import` 全般は 10 章で説明する |

執筆を進めて新たに順番を変えた箇所は、この表に追記する。

## 確認済みの動作（19 章の材料）

Conftest 0.71.1 のソース（`policy/engine.go`、`output/result.go`）と実際の実行で確かめた動作。

- 問い合わせるのは、対象の名前空間（既定は `main`）にある、名前が `^(deny|violation)(_[a-zA-Z0-9]+)*$`（失敗）または `^warn(_[a-zA-Z0-9]+)*$`（警告）に一致するルール。ルールごとに `data.<名前空間>.<ルール名>` を評価する。
- ルールの値が配列（Rego の集合は JSON では配列になる）のときだけ、要素を結果として扱う。
  - 要素が文字列なら、それがメッセージになる。
  - 要素がオブジェクトなら、`msg` キー（文字列）が必須。ないとエラーで停止する。`msg` 以外のキーはメタデータとして JSON 出力などに含まれる。
  - 要素がそれ以外の型（数値など）なら無視される。
  - メッセージが空文字列の要素は成功として数えられる。
- 値が配列でない場合（`deny if ...` による真偽値、`deny := "..."` による文字列など）は、結果なしとして成功に数えられる。`deny if ...` が `true` になっても失敗にはならない。
- `deny[msg] if { ... }` と書くと、ポリシーの読み込み時に「rule is using 'if' keyword without 'contains' keyword」というエラーになる。
- `exception` ルール: ルールごとに `data.<名前空間>.exception[_][_] == "<接頭辞を除いたルール名>"` を評価し、成り立てばそのルールの結果をすべて例外として扱う。例えば `deny_latest` に対しては `"latest"` を探す。
- ファイル名は `data.conftest.file.name`、ディレクトリは `data.conftest.file.dir` で参照できる。
