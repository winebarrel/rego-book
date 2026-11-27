package servers

all_tls if {
	every server in input.servers {
		server.tls
	}
}
