package api

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"mall/app/model"
	"mall/app/service"
)

var Merch = apiMerch{}

type apiMerch struct{}

// PostMerch 商品上架
func (*apiMerch) PostMerch(r *ghttp.Request) {
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

// ListMerch 商品列表
func (*apiMerch) ListMerch(r *ghttp.Request) {
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

// GetMerch 获取商品详情
func (*apiMerch) GetMerch(r *ghttp.Request) {
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

// GetCateMerch 分类获取商品信息
func (*apiMerch) GetCateMerch(r *ghttp.Request) {
	var req model.Merchandise
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		dataList := service.QueryCategoryId(req.CategoryID)
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

// PatchMerch 商品修改
func (*apiMerch) PatchMerch(r *ghttp.Request) {
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

// DeleteMerch 商品下架
func (*apiMerch) DeleteMerch(r *ghttp.Request) {
	var req *model.Merchandise
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		service.DeleteMerchId(req.ID)
		merch := service.QueryMerchId(req.ID)
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
