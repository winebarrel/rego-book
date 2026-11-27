package team

primary_role := "admin"

secondary_role := "admin"

roles := {"dev", primary_role, secondary_role}

role_count := count(roles)

no_roles := set()

empty_object := {}
