package messages

by_interpolation := $"role: {input.user.role}"

by_sprintf := sprintf("role: %s", [input.user.role])
