package model

type Users struct {
	ID       int
	Username string `p:"userName"  v:"required|length:6,30#请输入账号|账号长度为:min到:max位"`
	Password string `p:"userKeys" v:"required|length:6,30#请输入密码|密码长度不够"`
}

type RegisterReq struct {
	Username  string `p:"userName"  v:"required|length:6,30#请输入账号|账号长度为:min到:max位"`
	Password  string `p:"userKeys" v:"required|length:6,30#请输入密码|密码长度不够"`
	Password2 string `p:"validateKeys" v:"required|length:6,30|same:userKeys#请确认密码|密码长度不够|两次密码不一致"`
}
