# アプリケーション全体で使う判定
package app.common

# 入力のユーザーが管理者なら true
is_admin if {
	input.user.role == "admin"
}
