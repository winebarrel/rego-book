package main

deny_latest contains "do not use the latest tag" if {
	endswith(input.image, ":latest")
}

deny_root contains "do not run as root" if {
	input.user == "root"
}

exception contains rules if {
	data.conftest.file.name == "legacy.yaml"
	rules := ["latest"]
}
