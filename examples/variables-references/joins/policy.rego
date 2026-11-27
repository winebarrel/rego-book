package servers

prod_https if {
	some server in input.servers
	server.env == "prod"
	some port in server.ports
	port == 443
}

db_owner := team.name if {
	some team in input.teams
	some name in team.servers
	name == "db-1"
}
