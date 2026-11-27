package main

import future.keywords.not

# 作成・更新後の値があるリソースの変更
changes contains rc if {
	some rc in input.resource_changes
	rc.mode == "managed"
	is_object(rc.change.after)
}

deny contains msg if {
	some rc in changes
	rc.type == "aws_s3_bucket"
	not rc.change.after.tags.Owner
	msg := $"{rc.address}: tags.Owner is required"
}

deny contains msg if {
	some rc in changes
	rc.type == "aws_security_group_rule"
	after := rc.change.after
	after.type == "ingress"
	after.from_port <= 22
	after.to_port >= 22
	"0.0.0.0/0" in after.cidr_blocks
	msg := $"{rc.address}: SSH must not be open to the internet"
}

deny contains msg if {
	some rc in input.resource_changes
	"delete" in rc.change.actions
	msg := $"{rc.address}: deleting resources is not allowed"
}
