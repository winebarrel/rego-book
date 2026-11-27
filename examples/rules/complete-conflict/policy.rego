package quota

max_projects := 100 if {
	input.user.plan == "pro"
}

max_projects := 3 if {
	input.user.trial
}
