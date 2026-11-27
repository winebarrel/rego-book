package servers

is_prod(name) if {
	some server in input.servers
	server.name == name
	server.env == "prod"
}

env_of(name) := server.env if {
	some server in input.servers
	server.name == name
}

first_and_second([a, b, _]) := $"{a} and {b}"

web_1_is_prod := is_prod("web-1")

web_2_is_prod := is_prod("web-2")

db_env := env_of("db-1")

cache_env := env_of("cache-1")

first_two := first_and_second(["x", "y", "z"])
