package service

import (
	"mall/app/model"
)

// InsertCart 把购物车信息写入数据库
func InsertCart(merchandiseId uint, num uint, sumPrice float64) {
	db.Create(&model.ShoppingCart{
		MerchandiseID: merchandiseId,
		Num:           num,
		SumPrice:      sumPrice,
	})
}

// QueryCartId 根据id获取购物车信息
func QueryCartId(id uint) (cart *model.ShoppingCart) {
	db.Where("id = ?", id).Find(&cart)
	return cart
}

// QueryCart 获取购物车信息
func QueryCart(page int, pageSize int) (cart []model.ShoppingCart) {
	db.Scopes(Paginate(page, pageSize)).Find(&cart)
	return cart
}

// QueryCartMerchId 根据商品Id购物车信息
func QueryCartMerchId(id uint) (cart *model.ShoppingCart) {
	db.Where("merchandise_id = ?", id).Find(&cart)
	return cart
}

// UpdateCart 根据id更新购物车信息
func UpdateCart(id uint, num uint, sumPrice float64, merchandiseId uint) {
	db.Model(&model.ShoppingCart{}).Where("id = ?", id).Updates(model.ShoppingCart{
		Num:           num,
		SumPrice:      sumPrice,
		MerchandiseID: merchandiseId,
	})
}

// DeleteCart 根据id删除购物车信息
func DeleteCart(id uint) {
	db.Where("id = ?", id).Delete(&model.ShoppingCart{})
}
