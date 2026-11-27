package access

not_admin if {
	not input.user.role == "admin"
}

role_is_not_admin if {
	input.user.role != "admin"
}
