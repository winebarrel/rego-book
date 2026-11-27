package access

# METADATA
# schemas:
# - input: schema.user_request
allow if {
	input.user.rol == "admin"
}
