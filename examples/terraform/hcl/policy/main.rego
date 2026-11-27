package main

import future.keywords.not

deny contains msg if {
	some name, blocks in input.resource.aws_s3_bucket
	some bucket in blocks
	not bucket.tags.Owner
	msg := $"aws_s3_bucket.{name}: tags.Owner is required"
}

deny contains msg if {
	some name, blocks in input.resource.aws_security_group_rule
	some rule in blocks
	rule.type == "ingress"
	rule.from_port <= 22
	rule.to_port >= 22
	"0.0.0.0/0" in rule.cidr_blocks
	msg := $"aws_security_group_rule.{name}: SSH must not be open to the internet"
}
