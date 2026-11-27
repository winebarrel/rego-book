package app

server := {
	"name": "web",
	"port": 8080,
	"labels": {
		"team": "platform",
		"app.kubernetes.io/name": "web-frontend",
	},
}

name := server.name

team := server.labels.team

app_name := server.labels["app.kubernetes.io/name"]
