package envs

default label(_) := "unknown"

label(env) := "production" if {
	env == "prod"
}

prod_label := label("prod")

dev_label := label("dev")
