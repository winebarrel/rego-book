package access

import future.keywords.not

read_methods := ["GET", "HEAD"]

is_read if {
	input.method in read_methods
}

is_unknown_role if {
	not input.user.role in {"admin", "developer"}
}

is_read_value := input.method in read_methods
