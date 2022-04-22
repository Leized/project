package main

import (
	_ "mall/boot"
	_ "mall/router"

	"github.com/gogf/gf/frame/g"
)

func main() {
	g.Server().Run()
}
