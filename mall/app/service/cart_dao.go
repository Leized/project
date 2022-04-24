package service

import (
	"mall/app/model"
)

// InsertCart 把购物车信息写入数据库
func InsertCart(userId int, merchandiseId uint, num uint, sumPrice float64) {
	db.Create(&model.ShoppingCart{
		UserID:        userId,
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

// QueryCartUserId 根据用户Id获取购物车信息
func QueryCartUserId(userId int, page int, pageSize int) (cart []model.ShoppingCart) {
	db.Where("user_id = ?", userId).Scopes(Paginate(page, pageSize)).Find(&cart)
	return cart
}

// QueryUserIdAndMerchId 根据用户Id和商品Id获取购物车信息
func QueryUserIdAndMerchId(userId int, merchandiseId uint) (cart *model.ShoppingCart) {
	db.Where(&model.ShoppingCart{UserID: userId, MerchandiseID: merchandiseId}).First(&cart)
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
