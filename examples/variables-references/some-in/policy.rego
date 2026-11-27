package servers

has_staging if {
	some server in input.servers
	server.env == "staging"
}

first_is_web_1 if {
	some i, server in input.servers
	i == 0
	server.name == "web-1"
}
