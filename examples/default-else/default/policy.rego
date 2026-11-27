package quota

default allow := false

allow if {
	input.user.role == "admin"
}

default max_projects := 3

max_projects := 100 if {
	input.user.plan == "pro"
}
