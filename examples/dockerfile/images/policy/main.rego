package main

import future.keywords.not

# 最後のステージ（最終的なイメージを作るステージ）の番号
final_stage := max({instr.Stage | some instr in input})

final_instructions contains instr if {
	some instr in input
	instr.Stage == final_stage
}

# 最終ステージのベースイメージのタグを固定する
deny contains msg if {
	some instr in final_instructions
	instr.Cmd == "from"
	image := instr.Value[0]
	image != "scratch"
	not has_fixed_tag(image)
	msg := $"FROM {image}: use a fixed tag for the base image"
}

has_fixed_tag(image) if {
	regex.match(`:[^/:]+$`, image)
	not endswith(image, ":latest")
}

has_fixed_tag(image) if {
	regex.match(`@sha256:[0-9a-f]{64}$`, image)
}

# 最終ステージを root 以外のユーザーで実行する
users := [instr.Value[0] |
	some instr in input
	instr.Stage == final_stage
	instr.Cmd == "user"
]

deny contains "the final stage must set USER" if count(users) == 0

deny contains msg if {
	count(users) > 0
	user := users[count(users) - 1]
	split(user, ":")[0] in {"root", "0"}
	msg := $"USER {user}: the final stage must not run as root"
}

# ADD で URL からダウンロードしない
deny contains msg if {
	some instr in input
	instr.Cmd == "add"
	src := instr.Value[0]
	regex.match(`^https?://`, src)
	msg := $"ADD {src}: download files with RUN instead of ADD"
}

# ENV に秘密情報を入れない
deny contains msg if {
	some instr in input
	instr.Cmd == "env"
	some i, key in instr.Value
	i % 3 == 0
	regex.match(`(?i)(password|secret|token)`, key)
	msg := $"ENV {key}: do not put secrets in environment variables"
}
