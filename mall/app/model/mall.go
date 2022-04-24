package model

import "gorm.io/gorm"

// Merchandise 商品信息
type Merchandise struct {
	gorm.Model
	Name       string  `gorm:"not null;comment:商品名"`
	Inventory  uint    `gorm:"uint;not nul;comment:库存"`
	Price      float64 `gorm:"not nul;comment:单价"`
	CategoryID uint    `gorm:"comment:分类ID"`
}

// Category 分类
type Category struct {
	gorm.Model
	Class string `gorm:"not nul;comment:类别"`
	Kind  string `gorm:"not null;comment:种类"`
}

// ShoppingCart 购物车
type ShoppingCart struct {
	gorm.Model
	UserID        int     `gorm:"<-:create;comment:用户ID"`
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

// Paginate 用户分页查询
type Paginate struct {
	UserID   int `gorm:"<-:create;comment:用户ID"`
	State    string
	Page     int
	PageSize int
}
