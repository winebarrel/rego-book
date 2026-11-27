package servers

limits.cpu := 2

limits.memory := "4Gi"

names_by_team[team.name] contains name if {
	some team in input.teams
	some name in team.servers
}
