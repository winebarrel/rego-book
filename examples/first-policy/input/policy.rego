package access

is_admin if {
	input.user.role == "admin"
}
