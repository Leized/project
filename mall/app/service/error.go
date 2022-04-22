package service

import (
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gvalid"
	"mall/app/model"
)

func ReqError(r *ghttp.Request) {
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
}
