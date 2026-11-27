package naming

name := "web-server"

display_name := upper(name)

is_web if {
	startswith(name, "web-")
}

is_db if {
	startswith(name, "db-")
}
