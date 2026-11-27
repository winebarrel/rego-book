package servers

names := [server.name | some server in input.servers]

prod_names := [server.name |
	some server in input.servers
	server.env == "prod"
]

staging_names := [server.name | some server in input.servers; server.env == "staging"]

dev_names := [server.name | some server in input.servers; server.env == "dev"]

has_dev if {
	count(dev_names) > 0
}
