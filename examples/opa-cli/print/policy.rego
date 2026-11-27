package access

allow if {
	print("role:", input.user.role)
	input.user.role == "admin"
}
