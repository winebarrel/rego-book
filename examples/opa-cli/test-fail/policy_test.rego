package access_test

import data.access

test_viewer_can_write if {
	access.allow with input as {"user": {"role": "viewer"}}
		with data.roles as {"viewer": ["read"]}
}
