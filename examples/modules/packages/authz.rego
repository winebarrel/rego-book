package app.authz

allow if {
	data.app.common.is_admin
}
