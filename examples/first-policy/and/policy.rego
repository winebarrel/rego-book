package access

can_delete if {
	input.user.role == "admin"
	input.method == "DELETE"
	input.user.mfa_age_minutes <= 10
}
