package access

suspended if {
	input.user.suspended
}

allow if {
	input.user.role == "admin"
	not suspended
}
