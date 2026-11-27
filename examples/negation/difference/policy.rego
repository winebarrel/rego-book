package servers

owned contains name if {
	some team in input.teams
	some name in team.servers
}

unowned contains server.name if {
	some server in input.servers
	not owned[server.name]
}
