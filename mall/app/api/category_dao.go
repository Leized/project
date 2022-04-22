package api

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"mall/app/model"
	"mall/app/service"
)

var Cate = apiCate{}

type apiCate struct{}

// PostCate 增加分类
func (*apiCate) PostCate(r *ghttp.Request) {
	var req model.Category
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		cate := service.QueryKind(req.Kind)
		if cate.ID > 0 {
			err = r.Response.WriteJsonP(g.Map{
				"code":    1,
				"message": "该种类已存在，不可重复操作",
			})
			if err != nil {
				return
			}
		} else {
			service.InsertCate(req.Class, req.Kind)
			cate1 := service.QueryKind(req.Kind)
			if cate1.ID > 0 {
				err = r.Response.WriteJsonP(g.Map{
					"code":    0,
					"message": "种类增加成功",
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

// ListCate 分类列表
func (*apiCate) ListCate(r *ghttp.Request) {
	var req model.Paginate
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		err = r.Response.WriteJsonExit(model.DataRes{
			Code:    0,
			Message: "OK",
			Data:    service.QueryCate(req.Page, req.PageSize),
		})
		if err != nil {
			return
		}
	}
}

// GetCate 获取种类列表
func (*apiCate) GetCate(r *ghttp.Request) {
	var req model.Category
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		dataList := service.QueryClass(req.Class)
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

// PatchCate 分类修改
func (*apiCate) PatchCate(r *ghttp.Request) {
	var req *model.Category
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		service.UpdateCate(req.ID, req.Class, req.Kind)
		cate := service.QueryId(req.ID)
		if cate.Class == req.Class && cate.Kind == req.Kind {
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

// DeleteCate 删除种类
func (*apiCate) DeleteCate(r *ghttp.Request) {
	var req *model.Category
	if err := r.Parse(&req); err != nil {
		service.ReqError(r)
	} else {
		service.DeleteCateId(req.ID)
		cate := service.QueryId(req.ID)
		if cate.ID > 0 {
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
