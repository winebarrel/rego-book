package main

warn contains "replicas should be at least 2" if {
	input.replicas < 2
}
