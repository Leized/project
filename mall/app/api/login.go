package api

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
	"mall/app/model"
	"mall/app/service"
)

// Login 登陆
func Login(r *ghttp.Request) {
	var req model.Users
	if err := r.Parse(&req); err != nil {
		// Validation error.
		if v, ok := err.(gvalid.Error); ok {
			err = r.Response.WriteJsonExit(model.DataRes{
				Code:    1,
				Message: v.FirstString(),
			})
			if err != nil {
				return
			}
		}
		// Other error.
		err = r.Response.WriteJsonExit(model.DataRes{
			Code:    1,
			Message: err.Error(),
		})
		if err != nil {
			return
		}
	} else {
		encryption := service.Encryption(req.Password)
		rows := service.QueryName(req.Username)
		if rows.ID > 0 {
			if rows.Password == encryption.Password {
				err = r.Response.WriteJsonP(g.Map{
					"code":    0,
					"message": "登陆成功",
				})
				if err != nil {
					return
				}
			} else {
				err = r.Response.WriteJsonP(g.Map{
					"code":    1,
					"message": "密码错误",
				})
				if err != nil {
					return
				}
			}
		} else {
			err = r.Response.WriteJsonP(g.Map{
				"code":    1,
				"message": "用户不存在，请注册后再进行登陆",
			})
			if err != nil {
				return
			}
		}
	}
}
