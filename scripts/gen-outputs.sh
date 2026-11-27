#!/usr/bin/env bash
# examples/ 以下の各サンプルで cmd のコマンドを実行し、結果を output.txt に書く。
#
# - cmd には本文に載せるコマンドを 1 行に 1 つ書く。
# - 1 つのサンプルでコマンドの組を分けたいときは cmd-名前 を置く。結果は output-名前.txt に書く。
# - コマンドが失敗する（終了コードが 0 以外になる）ことを見せる例には expect-fail（cmd-名前 には expect-fail-名前）を置く。
#   expect-fail がないのに失敗した場合と、expect-fail があるのにすべて成功した場合はエラーにする。
set -euo pipefail

cd "$(dirname "$0")/.."

status=0

while IFS= read -r -d '' cmdfile; do
  dir="$(dirname "$cmdfile")"
  base="$(basename "$cmdfile")"
  suffix="${base#cmd}"
  out="$dir/output${suffix}.txt"
  expect_fail="$dir/expect-fail${suffix}"
  failed=0

  : > "$out"
  while IFS= read -r line || [ -n "$line" ]; do
    [ -z "$line" ] && continue
    echo "\$ $line" >> "$out"
    if ! (cd "$dir" && NO_COLOR=1 bash -c "$line") >> "$out" 2>&1; then
      failed=1
    fi
  done < "$cmdfile"

  # NO_COLOR を見ないツール（conftest など）が出力する色の制御文字を取り除く。
  perl -pi -e 's/\e\[[0-9;]*m//g' "$out"

  if [ -f "$expect_fail" ]; then
    if [ "$failed" -eq 0 ]; then
      echo "失敗するはずのコマンドが成功しました: $cmdfile" >&2
      status=1
    fi
  elif [ "$failed" -ne 0 ]; then
    echo "コマンドが失敗しました: $cmdfile" >&2
    cat "$out" >&2
    status=1
  fi
done < <(find examples -type f \( -name cmd -o -name 'cmd-*' \) -print0 | sort -z)

exit "$status"
