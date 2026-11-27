package network

http_port := 80

https_port := 443

ports := [http_port, https_port]

first_port := ports[0]

listeners := [
	["web", 80],
	["api", 8080],
]

api_port := listeners[1][1]
