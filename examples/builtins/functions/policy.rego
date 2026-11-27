package containers

images_from_registry if {
	every c in input.containers {
		regex.match(`^registry\.example\.com/`, c.image)
	}
}

total_memory_bytes := sum([units.parse_bytes(c.memory) | some c in input.containers])

total_memory_gib := total_memory_bytes / units.parse_bytes("1Gi")

pull_policy(c) := object.get(c, "imagePullPolicy", "IfNotPresent")

pull_policies := {c.name: pull_policy(c) | some c in input.containers}

summary := sprintf("%d containers, %v GiB", [count(input.containers), total_memory_gib])
