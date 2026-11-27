package access

import data.roles

allow if {
	name := input.user.name
	input.user.role == "admin"
}
