package servers

has_staging if {
	some i
	input.servers[i].env == "staging"
}

has_dev if {
	input.servers[_].env == "dev"
}
