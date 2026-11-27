package servers

prod_names contains server.name if {
	some server in input.servers
	server.env == "prod"
}

dev_names contains server.name if {
	some server in input.servers
	server.env == "dev"
}

open_ports contains port if {
	some server in input.servers
	some port in server.ports
}

open_ports contains 22
