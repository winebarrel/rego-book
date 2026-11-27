package docs

import future.keywords.and
import future.keywords.or

can_edit if {
	input.user.admin or input.user.owner
}

can_publish if {
	input.user.admin or input.user.owner and input.doc.reviewed
}

can_publish_grouped if {
	(input.user.admin or input.user.owner) and input.doc.reviewed
}
