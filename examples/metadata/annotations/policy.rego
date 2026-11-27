# METADATA
# title: コンテナイメージのポリシー
# description: デプロイするコンテナのイメージを検査する。
# authors:
# - Platform Team <platform@example.com>
package containers

import future.keywords.not

# METADATA
# title: イメージは社内のレジストリから取得する
# description: 公開レジストリのイメージは使わない。
# custom:
#   severity: high
#   ticket: SEC-123
untrusted_images contains c.image if {
	some c in input.containers
	not startswith(c.image, "registry.example.com/")
}

# METADATA
# title: レポート
report := {
	"title": rego.metadata.rule().title,
	"package_title": rego.metadata.chain()[1].annotations.title,
}

# METADATA
# custom:
#   severity: high
severity := rego.metadata.rule().custom.severity
