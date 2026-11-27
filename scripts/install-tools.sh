#!/usr/bin/env bash
# CI 用に OPA と Conftest（Linux amd64）を指定のディレクトリにインストールする。
# この本で動作を確かめているバージョンをここで固定する。
set -euo pipefail

OPA_VERSION=1.23.0
CONFTEST_VERSION=0.71.1

dest="${1:?インストール先のディレクトリを指定してください}"
mkdir -p "$dest"
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
cd "$work"

base="https://github.com/open-policy-agent/opa/releases/download/v${OPA_VERSION}"
curl -fsSLO "$base/opa_linux_amd64_static"
curl -fsSLO "$base/opa_linux_amd64_static.sha256"
sha256sum -c opa_linux_amd64_static.sha256
install -m 755 opa_linux_amd64_static "$dest/opa"

base="https://github.com/open-policy-agent/conftest/releases/download/v${CONFTEST_VERSION}"
archive="conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz"
curl -fsSLO "$base/$archive"
curl -fsSLO "$base/checksums.txt"
grep " ${archive}\$" checksums.txt | sha256sum -c -
tar xzf "$archive" conftest
install -m 755 conftest "$dest/conftest"

"$dest/opa" version
"$dest/conftest" --version
