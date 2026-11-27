package main

import future.keywords.not

deny contains msg if {
	input.kind == "Deployment"
	input.spec.replicas < 2
	msg := $"{input.metadata.name}: replicas must be at least 2"
}

warn contains "metadata.labels is not set" if {
	not input.metadata.labels
}
