package api

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"mall/app/model"
	"mall/app/service"
)

var Order = apiOrder{}

type apiOrder struct{}

// PostOrder 生成订单
func (*apiOrder) PostOrder(r *ghttp.Request) {
	var req model.Order
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		order := service.QueryOrderNum(req.OrderNum)
		if order.ID > 0 {
			err = r.Response.WriteJsonP(g.Map{
				"code":    1,
				"message": "该订单已存在",
			})
			if err != nil {
				return
			}
		} else {
			service.InsetOrder(req.UserID, req.OrderNum, req.Merchandises, req.SumPrice, req.State)
			order1 := service.QueryOrderNum(req.OrderNum)
			if order1.ID > 0 {
				err = r.Response.WriteJsonP(g.Map{
					"code":    0,
					"message": "订单生成成功",
				})
				if err != nil {
					return
				}
			} else {
				err = r.Response.WriteJsonP(g.Map{
					"code":    1,
					"message": "订单生成失败",
				})
				if err != nil {
					return
				}
			}
		}
	}
}

// ListOrder 订单列表
func (*apiOrder) ListOrder(r *ghttp.Request) {
	var req model.Paginate
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		err = r.Response.WriteJsonExit(model.DataRes{
			Code:    0,
			Message: "OK",
			Data:    service.QueryUserID(req.UserID, req.Page, req.PageSize),
		})
		if err != nil {
			return
		}
	}
}

// ListStateOrder 根据状态查看用户订单列表
func (*apiOrder) ListStateOrder(r *ghttp.Request) {
	var req model.Order
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		err = r.Response.WriteJsonExit(model.DataRes{
			Code:    0,
			Message: "OK",
			Data:    service.QueryState(req.UserID, req.State),
		})
		if err != nil {
			return
		}
	}
}

// GetOrder 订单详情
func (*apiOrder) GetOrder(r *ghttp.Request) {
	var req *model.Order
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		err = r.Response.WriteJsonExit(model.DataRes{
			Code:    0,
			Message: "OK",
			Data:    service.QueryOrderId(req.ID),
		})
		if err != nil {
			return
		}
	}
}

// PatchOrder 修改订单状态
func (*apiOrder) PatchOrder(r *ghttp.Request) {
	var req *model.Order
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		service.UpdateOrder(req.ID, req.State)
		order := service.QueryOrderId(req.ID)
		if order.State == req.State {
			err = r.Response.WriteJsonP(g.Map{
				"code":    0,
				"message": "修改成功",
			})
			if err != nil {
				return
			}
		} else {
			err = r.Response.WriteJsonP(g.Map{
				"code":    1,
				"message": "修改失败",
			})
			if err != nil {
				return
			}
		}
	}
}

// DeleteOrder 删除订单
func (*apiOrder) DeleteOrder(r *ghttp.Request) {
	var req *model.Order
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		service.DeleteOrder(req.ID)
		order := service.QueryOrderId(req.ID)
		if order.ID > 0 {
			err = r.Response.WriteJsonP(g.Map{
				"code":    1,
				"message": "删除失败",
			})
			if err != nil {
				return
			}
		} else {
			err = r.Response.WriteJsonP(g.Map{
				"code":    0,
				"message": "删除成功",
			})
			if err != nil {
				return
			}
		}
	}
}
