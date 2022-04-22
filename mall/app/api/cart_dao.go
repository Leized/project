package api

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"mall/app/model"
	"mall/app/service"
)

var Cart = apiCart{}

type apiCart struct{}

// PostCart 增加商品到购物车
func (*apiCart) PostCart(r *ghttp.Request) {
	var req model.ShoppingCart
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		cart := service.QueryCartMerchId(req.MerchandiseID)
		if cart.ID > 0 {
			//购物车已经有该商品，进行更新即可
			service.UpdateCart(cart.ID, req.Num+cart.Num, req.SumPrice+cart.SumPrice, req.MerchandiseID)
			cart1 := service.QueryCartMerchId(req.MerchandiseID)
			if cart1.Num == req.Num+cart.Num && cart1.SumPrice == req.SumPrice+cart.SumPrice {
				err = r.Response.WriteJsonP(g.Map{
					"code":    0,
					"message": "添加成功",
				})
				if err != nil {
					return
				}
			} else {
				err = r.Response.WriteJsonP(g.Map{
					"code":    1,
					"message": "添加失败",
				})
				if err != nil {
					return
				}
			}
		} else {
			service.InsertCart(req.MerchandiseID, req.Num, req.SumPrice)
			cart := service.QueryCartMerchId(req.MerchandiseID)
			if cart.ID > 0 {
				err = r.Response.WriteJsonP(g.Map{
					"code":    0,
					"message": "添加成功",
				})
				if err != nil {
					return
				}
			} else {
				err = r.Response.WriteJsonP(g.Map{
					"code":    1,
					"message": "添加失败",
				})
				if err != nil {
					return
				}
			}
		}
	}
}

// ListCart 购物车列表
func (*apiCart) ListCart(r *ghttp.Request) {
	var req model.Paginate
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		err = r.Response.WriteJsonExit(model.DataRes{
			Code:    0,
			Message: "OK",
			Data:    service.QueryCart(req.Page, req.PageSize),
		})
		if err != nil {
			return
		}
	}
}

// PatchCart 购物车信息修改
func (*apiCart) PatchCart(r *ghttp.Request) {
	var req *model.ShoppingCart
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		service.UpdateCart(req.ID, req.Num, req.SumPrice, req.MerchandiseID)
		cart := service.QueryCartMerchId(req.MerchandiseID)
		if cart.Num == req.Num && cart.SumPrice == req.SumPrice {
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

// DeleteCart 删除购物车信息
func (*apiCart) DeleteCart(r *ghttp.Request) {
	var req *model.ShoppingCart
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		cart := service.QueryCartId(req.ID)
		if cart.ID > 0 {
			service.DeleteCart(req.ID)
			cart1 := service.QueryCartId(req.ID)
			if cart1.ID > 0 {
				err = r.Response.WriteJsonP(g.Map{
					"code":    1,
					"message": "删除失败",
				})
			} else {
				err = r.Response.WriteJsonP(g.Map{
					"code":    0,
					"message": "删除成功",
				})
			}
		} else {
			err = r.Response.WriteJsonP(g.Map{
				"code":    1,
				"message": "商品不存在",
			})
		}

	}
}
