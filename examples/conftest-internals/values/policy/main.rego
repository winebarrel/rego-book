package main

deny_bool if {
	input.name == "web"
}

deny_string := "name is web" if {
	input.name == "web"
}

deny_object contains {"msg": "name is web", "severity": "high"} if {
	input.name == "web"
}

deny_empty contains "" if {
	input.name == "web"
}

deny_number contains 42 if {
	input.name == "web"
}

deny_nothing contains "name is db" if {
	input.name == "db"
}
