#!/usr/bin/env bash
# サンプルの Rego が opa fmt で整形済みかを確認する（テストは各サンプルの cmd で実行する）。
# 構文エラーを見せる例など、整形できないサンプルには no-fmt を置く。
set -euo pipefail

cd "$(dirname "$0")/.."

status=0

while IFS= read -r -d '' dir; do
  [ -f "$dir/no-fmt" ] && continue
  if ls "$dir"/*.rego > /dev/null 2>&1; then
    if [ -n "$(opa fmt --list "$dir"/*.rego)" ]; then
      echo "opa fmt で整形されていません: $dir" >&2
      opa fmt --diff "$dir"/*.rego >&2 || true
      status=1
    fi
  fi
done < <(find examples -mindepth 2 -maxdepth 2 -type d -print0 | sort -z)

exit "$status"
