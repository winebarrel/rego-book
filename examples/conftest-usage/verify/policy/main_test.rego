package main

test_deployment_without_labels if {
	cfg := parse_config("yaml", `
kind: Deployment
metadata:
  name: web
`)
	deny["web: Deployment must have labels"] with input as cfg
}

test_deployment_with_labels if {
	cfg := parse_config("yaml", `
kind: Deployment
metadata:
  name: web
  labels:
    app: web
`)
	count(deny) == 0 with input as cfg
}
