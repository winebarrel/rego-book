package without_import

not_web if {
	not startswith(input.server.name, "web-")
}
