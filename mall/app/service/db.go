package service

import (
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"log"
	"mall/app/model"
)

var (
	db  *gorm.DB
	err error
)

func init() {
	db, err = gorm.Open(mysql.Open("root:990820@tcp(127.0.0.1:3306)/test?charset=utf8mb4&parseTime=True&loc=Local"),
		&gorm.Config{})
	if err != nil {
		log.Fatal(err)
	}
	err = db.AutoMigrate(&model.Merchandise{})
	if err != nil {
		return
	}
	err = db.AutoMigrate(&model.Category{})
	if err != nil {
		return
	}
	err = db.AutoMigrate(&model.ShoppingCart{})
	if err != nil {
		return
	}
}
