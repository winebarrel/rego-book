package main

test_privileged_container_is_denied if {
	cfg := parse_config("yaml", `
kind: Pod
metadata:
  name: p
spec:
  containers:
    - name: c
      image: registry.example.com/app:1.0.0
      resources:
        limits:
          memory: 64Mi
      securityContext:
        privileged: true
`)
	deny["Pod/p: container c must not be privileged"] with input as cfg
}

test_compliant_deployment_passes if {
	cfg := parse_config("yaml", `
kind: Deployment
metadata:
  name: d
  labels:
    app: d
spec:
  template:
    spec:
      containers:
        - name: c
          image: registry.example.com/app:1.0.0
          resources:
            limits:
              memory: 64Mi
`)
	count(deny) == 0 with input as cfg
	count(warn) == 0 with input as cfg
}
