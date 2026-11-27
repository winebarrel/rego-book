package app.authz

import data.roles

permissions := roles[input.user.role]

is_known_role if {
	roles[input.user.role]
}
