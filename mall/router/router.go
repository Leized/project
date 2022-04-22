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
		group.PATCH("/patch", api.Merch.PatchMerch)
		group.DELETE("/delete", api.Merch.DeleteMerch)
	})
}
