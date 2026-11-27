package servers

duplicate_name if {
	some i, a in input.servers
	some j, b in input.servers
	i != j
	a.name == b.name
}
