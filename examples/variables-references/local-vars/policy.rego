package greeting

message := msg if {
	name := input.user.name
	role := input.user.role
	msg := $"{name} ({role})"
}
