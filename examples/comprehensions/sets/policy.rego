package servers

envs := {server.env | some server in input.servers}

all_ports := {port |
	some server in input.servers
	some port in server.ports
}
