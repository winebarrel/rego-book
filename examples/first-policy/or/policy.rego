package access

allow if {
	input.method == "GET"
}

allow if {
	input.user.role == "admin"
}
