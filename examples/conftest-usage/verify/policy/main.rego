package main

import future.keywords.not

deny contains msg if {
	input.kind == "Deployment"
	not input.metadata.labels
	msg := $"{input.metadata.name}: Deployment must have labels"
}
