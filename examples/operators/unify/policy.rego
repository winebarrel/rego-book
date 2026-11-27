package unify

pair := [x, y] if {
	[x, "world"] = ["hello", y]
}

ordered if {
	x > y
	y = 41
	x = 42
}

role := r if {
	input.user.role = r
}

is_admin if {
	input.user.role = "admin"
}
