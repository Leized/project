package service

import (
	"gorm.io/gorm"
	"mall/app/model"
)

// InsertMerch 把商品信息写入数据库
func InsertMerch(name string, inventory uint, price float64, categoryID uint) {
	db.Create(&model.Merchandise{
		Name:       name,
		Inventory:  inventory,
		Price:      price,
		CategoryID: categoryID,
	})
}

// Paginate 分页
func Paginate(page int, pageSize int) func(db *gorm.DB) *gorm.DB {
	return func(db *gorm.DB) *gorm.DB {
		if page == 0 {
			page = 1
		}
		switch {
		case pageSize > 100:
			pageSize = 100
		case pageSize <= 0:
			pageSize = 10
		}
		offset := (page - 1) * pageSize
		return db.Offset(offset).Limit(pageSize)
	}
}

// QueryMerch 查询所有商品信息
func QueryMerch(page int, pageSize int) (merch []model.Merchandise) {
	//db.Where("id > 0").Find(&merch)
	db.Scopes(Paginate(page, pageSize)).Find(&merch)
	return merch
}

// QueryMerchName 根据商品名获取商品信息
func QueryMerchName(name string) (merch *model.Merchandise) {
	db.Where("name = ?", name).First(&merch)
	return merch
}

// QueryMerchId 根据商品ID获取商品信息
func QueryMerchId(id uint) (merch *model.Merchandise) {
	db.Where("id = ?", id).First(&merch)
	return merch
}

// QueryCategoryId 根据种类Id获取商品信息
func QueryCategoryId(categoryId uint) (merch []model.Merchandise) {
	db.Where("category_id = ?", categoryId).Find(&merch)
	return merch
}

// UpdateMerch 根据id更新商品信息
func UpdateMerch(id uint, name string, inventory uint, price float64, categoryID uint) {
	db.Model(&model.Merchandise{}).Where("id = ?", id).Updates(model.Merchandise{
		Name:       name,
		Inventory:  inventory,
		Price:      price,
		CategoryID: categoryID,
	})
}

// DeleteMerchId 根据商品ID删除商品信息
func DeleteMerchId(id uint) {
	db.Where("id = ?", id).Delete(&model.Merchandise{})
}
