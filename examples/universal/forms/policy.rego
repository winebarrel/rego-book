package servers

all_short_names if {
	every i, server in input.servers {
		i < 10
		count(server.name) <= 8
	}
}

all_labels_filled if {
	every key, value in input.labels {
		key != ""
		value != ""
	}
}
