package quota

is_paid if {
	input.user.plan != "free"
}

max_projects := 100 if {
	is_paid
}

max_projects := 3 if {
	input.user.plan == "free"
}
