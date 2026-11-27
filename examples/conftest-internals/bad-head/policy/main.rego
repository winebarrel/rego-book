package main

deny[msg] if {
	input.name == "web"
	msg := "name is web"
}
