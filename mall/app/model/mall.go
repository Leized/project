package model

import "gorm.io/gorm"

// Merchandise 商品信息
type Merchandise struct {
	gorm.Model
	Name       string  `gorm:"unique;not null;comment:商品名"`
	Inventory  uint    `gorm:"uint;not nul;comment:库存"` //库存
	Price      float64 //价格
	CategoryID uint    //分类主键
}

// Category 分类
type Category struct {
	gorm.Model
	Class string //类别
	Kind  string //种类
}

// ShoppingCart 购物车
type ShoppingCart struct {
	gorm.Model
	Num           uint    //商品数量
	SumPrice      float64 //总价
	MerchandiseID uint    //商品主键
}

// DataRes jsom格式输出
type DataRes struct {
	Code    int         `json:"code"`
	Message string      `json:"message"`
	Data    interface{} `json:"data"`
}

// Paginate 分页
type Paginate struct {
	Page     int
	PageSize int
}
