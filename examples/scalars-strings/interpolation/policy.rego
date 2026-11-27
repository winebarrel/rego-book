package greeting

name := "alice"

port := 8080

message := $"Hello, {upper(name)}!"

url := $"http://localhost:{port}/"

template := $"use \{name} to insert a value"
