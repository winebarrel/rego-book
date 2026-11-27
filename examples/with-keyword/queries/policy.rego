package access

import data.roles

allow if {
	"write" in roles[input.user.role]
}
