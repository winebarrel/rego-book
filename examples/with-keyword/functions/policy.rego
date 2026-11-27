package access

is_weekend if {
	time.weekday(time.now_ns()) in {"Saturday", "Sunday"}
}

display_name := upper(input.user.name)

bracket(s) := $"[{s}]"
