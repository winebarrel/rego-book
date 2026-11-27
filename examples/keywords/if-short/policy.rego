package servers

is_admin if input.user.role == "admin"

names contains server.name if some server in input.servers
