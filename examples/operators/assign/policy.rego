package profile

city := c if {
	[_, c, _] := split(input.address, ",")
}

name_and_role := [n, r] if {
	{"name": n, "role": r} := input.user
}

name_only := n if {
	{"name": n} := input.user
}
