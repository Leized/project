package model

import (
	"gorm.io/gorm"
)

type Order struct {
	gorm.Model
	UserID       int    `gorm:"not nul;comment:用户ID"`
	OrderNum     string `gorm:"not nul;comment:订单编号"`
	Merchandises string
	SumPrice     float64 `gorm:"not nul;comment:总价"`
	State        string  `gorm:"not nul;comment:状态(未发货,已发货,运输中,已签收)"`
}
