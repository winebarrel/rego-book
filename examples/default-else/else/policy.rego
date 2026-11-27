package quota

plan := "pro" if {
	input.user.plan == "pro"
} else := "trial" if {
	input.user.trial
} else := "free"

is_pro if {
	input.user.plan == "pro"
} else := false
