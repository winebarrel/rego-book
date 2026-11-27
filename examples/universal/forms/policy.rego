package servers

all_short_names if {
	every server in input.servers {
		count(server.name) <= 8
	}
}

all_labels_filled if {
	every key, value in input.labels {
		key != ""
		value != ""
	}
}
