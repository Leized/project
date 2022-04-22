package api

import (
	"fmt"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"mall/app/model"
	"mall/app/service"
)

var cart = apiCart{}

type apiCart struct{}

// PostCart 商品上架
func (*apiCart) PostCart(r *ghttp.Request) {
	var req model.Merchandise
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {

		merch := service.QueryMerchName(req.Name)
		if merch.ID > 0 {
			err = r.Response.WriteJsonP(g.Map{
				"code":    1,
				"message": "该商品已上架，不可重复操作",
			})
			if err != nil {
				return
			}
		} else {
			service.InsertMerch(req.Name, req.Inventory, req.Price, req.CategoryID)
			merch1 := service.QueryMerchName(req.Name)
			if merch1.ID > 0 {
				err = r.Response.WriteJsonP(g.Map{
					"code":    0,
					"message": "上架成功",
				})
				if err != nil {
					return
				}
			} else {
				err = r.Response.WriteJsonP(g.Map{
					"code":    1,
					"message": "上架失败",
				})
				if err != nil {
					return
				}
			}
		}
	}
}

// ListCart 商品列表
func (*apiCart) ListCart(r *ghttp.Request) {
	var req model.Paginate
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		err = r.Response.WriteJsonExit(model.DataRes{
			Code:    0,
			Message: "OK",
			Data:    service.QueryMerch(req.Page, req.PageSize),
		})
		if err != nil {
			return
		}
	}
}

// GetCart 获取商品详情
func (*apiCart) GetCart(r *ghttp.Request) {
	var req model.Merchandise
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		dataList := service.QueryMerchId(req.ID)
		err = r.Response.WriteJsonExit(model.DataRes{
			Code:    0,
			Message: "OK",
			Data:    dataList,
		})
		if err != nil {
			return
		}
	}
}

// PatchCart 商品修改
func (*apiCart) PatchCart(r *ghttp.Request) {
	var req *model.Merchandise
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		service.UpdateMerch(req.ID, req.Name, req.Inventory, req.Price, req.CategoryID)
		merch := service.QueryMerchId(req.ID)
		if merch.Name == req.Name && merch.Inventory == req.Inventory && merch.Price == req.Price && merch.CategoryID == req.CategoryID {
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

// DeleteCart 商品下架
func (*apiCart) DeleteCart(r *ghttp.Request) {
	//name string, inventory uint, price float64
	var req *model.Merchandise
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		service.DeleteMerchId(req.ID)
		fmt.Println(req.ID)
		merch := service.QueryMerchId(req.ID)
		fmt.Println(merch.ID)
		if merch.ID > 0 {
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
