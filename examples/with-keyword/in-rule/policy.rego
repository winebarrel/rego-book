package access

import data.roles

allow if {
	"write" in roles[input.user.role]
}

admin_can_write if {
	allow with input as {"user": {"role": "admin"}}
}

viewer_can_write if {
	allow with input.user.role as "viewer"
}
