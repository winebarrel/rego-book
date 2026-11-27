package main

test_missing_user_is_denied if {
	some doc in parse_config("dockerfile", `
FROM alpine:3.20
CMD ["sh"]
`)
	deny["the final stage must set USER"] with input as doc
}

test_user_in_build_stage_does_not_count if {
	some doc in parse_config("dockerfile", `
FROM alpine:3.20 AS build
USER builder
FROM alpine:3.20
USER root
`)
	deny["USER root: the final stage must not run as root"] with input as doc
}

test_last_user_wins if {
	some doc in parse_config("dockerfile", `
FROM alpine:3.20
USER root
RUN apk add --no-cache curl
USER app
`)
	count(deny) == 0 with input as doc
}
