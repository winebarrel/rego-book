package servers

name_by_env := {server.env: server.name | some server in input.servers}
