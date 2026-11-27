package servers

name_by_env[server.env] := server.name if {
	some server in input.servers
}
