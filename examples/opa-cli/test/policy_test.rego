package access_test

import data.access

test_admin_can_write if {
	access.allow with input as {"user": {"role": "admin"}}
		with data.roles as {"admin": ["read", "write"]}
}

test_viewer_cannot_write if {
	not access.allow with input as {"user": {"role": "viewer"}}
		with data.roles as {"viewer": ["read"]}
}
