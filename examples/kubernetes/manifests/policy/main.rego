package main

import future.keywords.not

workload_kinds := {"Deployment", "StatefulSet", "DaemonSet", "ReplicaSet", "Job"}

# Pod と、Pod を作るワークロードから、コンテナを取り出す
containers contains c if {
	input.kind == "Pod"
	some c in input.spec.containers
}

containers contains c if {
	input.kind in workload_kinds
	some c in input.spec.template.spec.containers
}

name := input.metadata.name

deny contains msg if {
	some c in containers
	c.securityContext.privileged == true
	msg := $"{input.kind}/{name}: container {c.name} must not be privileged"
}

deny contains msg if {
	some c in containers
	not c.resources.limits.memory
	msg := $"{input.kind}/{name}: container {c.name} must set resources.limits.memory"
}

deny contains msg if {
	some c in containers
	not has_fixed_tag(c.image)
	msg := $"{input.kind}/{name}: container {c.name} must use a fixed image tag"
}

# イメージの最後の "/" より後ろに ":タグ" があり、タグが latest でない
has_fixed_tag(image) if {
	regex.match(`:[^/:]+$`, image)
	not endswith(image, ":latest")
}

warn contains msg if {
	input.kind in workload_kinds
	not input.metadata.labels.app
	msg := $"{input.kind}/{name}: metadata.labels.app is not set"
}
