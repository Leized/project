package router

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"mall/app/api"
)

func init() {
	s := g.Server()
	s.Group("/", func(group *ghttp.RouterGroup) {
		group.ALL("/hello", api.Hello)
	})
	s.Group("/merch", func(group *ghttp.RouterGroup) {
		group.POST("/post", api.Merch.PostMerch)
		group.GET("/list", api.Merch.ListMerch)
		group.GET("/details", api.Merch.GetMerch)
		group.GET("/cate/details", api.Merch.GetCateMerch)
		group.PATCH("/patch", api.Merch.PatchMerch)
		group.DELETE("/delete", api.Merch.DeleteMerch)
	})
	s.Group("/cate", func(group *ghttp.RouterGroup) {
		group.POST("/post", api.Cate.PostCate)
		group.GET("/list", api.Cate.ListCate)
		group.GET("/details", api.Cate.GetCate)
		group.PATCH("/patch", api.Cate.PatchCate)
		group.DELETE("/delete", api.Cate.DeleteCate)
	})
	s.Group("/cart", func(group *ghttp.RouterGroup) {
		group.POST("/post", api.Cart.PostCart)
		group.GET("/list", api.Cart.ListCart)
		group.PATCH("/patch", api.Cart.PatchCart)
		group.DELETE("/delete", api.Cart.DeleteCart)
	})
}
