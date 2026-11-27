package app.authz

import data.app.common
import data.app.common as shared
import data.roles
import input.user

allow if {
	common.is_admin
}

allow_by_alias if {
	shared.is_admin
}

name := user.name

permissions := roles[user.role]
