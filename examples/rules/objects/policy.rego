package servers

ports_by_name[server.name] := server.ports if {
	some server in input.servers
}

ports_by_name["bastion"] := [22]
