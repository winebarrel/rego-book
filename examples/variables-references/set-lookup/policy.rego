package access

admins := {"alice", "bob"}

is_admin if {
	admins[input.user]
}

grants := {
	["alice", "read"],
	["bob", "write"],
}

allow if {
	grants[[input.user, input.action]]
}

has_any_grant if {
	grants[[input.user, _]]
}
