package main

import future.keywords.not

service_names contains file.contents.metadata.name if {
	some file in input
	file.contents.kind == "Service"
}

deny contains msg if {
	some file in input
	file.contents.kind == "Deployment"
	name := file.contents.metadata.name
	not name in service_names
	msg := $"{file.path}: no Service named {name}"
}
