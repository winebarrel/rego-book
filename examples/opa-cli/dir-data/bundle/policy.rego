package access

import data.roles

can_write(role) if {
	"write" in roles[role]
}
