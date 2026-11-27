package main

import future.keywords.not

registry(image) := split(image, "/")[0]

deny contains msg if {
	some c in input.spec.containers
	not registry(c.image) in data.registries.allowed
	msg := $"{c.name}: registry {registry(c.image)} is not allowed"
}
