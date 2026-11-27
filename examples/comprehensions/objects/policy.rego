package servers

ports_by_name := {server.name: server.ports | some server in input.servers}

names_by_env := {env: names |
	some env in {server.env | some server in input.servers}
	names := [server.name | some server in input.servers; server.env == env]
}
