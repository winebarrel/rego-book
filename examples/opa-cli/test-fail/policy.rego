package access

import data.roles

default allow := false

allow if {
	"write" in roles[input.user.role]
}
