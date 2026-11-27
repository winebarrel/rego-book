package servers

has_plain if {
	some server in input.servers
	not server.tls
}

all_tls_by_not if {
	not has_plain
}

all_tls_by_count if {
	plain := [server | some server in input.servers; not server.tls]
	count(plain) == 0
}
