package servers

owned := {"web-1", "db-1"}

unowned contains name if {
	not owned[name]
}
