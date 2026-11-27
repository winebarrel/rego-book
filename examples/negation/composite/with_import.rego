package with_import

import future.keywords.not

not_web if {
	not startswith(input.server.name, "web-")
}
