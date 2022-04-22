package service

import "mall/app/model"

var shoppingCart model.ShoppingCart

// InsertShoppingCart 把购物车信息写入数据库
func InsertShoppingCart(merchandiseId uint, num uint) *model.ShoppingCart {
	db.Create(&model.ShoppingCart{
		MerchandiseID: merchandiseId,
		Num:           num,
	})
	return &shoppingCart
}

// QueryShoppingCart 根据id获取购物车信息
func QueryShoppingCart(id uint) *model.ShoppingCart {
	db.Where("id = ?", id).First(&shoppingCart)
	return &shoppingCart
}

// UpdateShoppingCart 根据id更新购物车信息
func UpdateShoppingCart(id uint, num uint) *model.ShoppingCart {
	db.Model(&model.ShoppingCart{}).Where("id = ?", id).Update("num = ?", num)
	return &shoppingCart
}

// DeleteShoppingCart 根据id删除购物车信息
func DeleteShoppingCart(id uint) {
	db.Where("id = ?", id).Delete(&model.ShoppingCart{})
}

// AddMerchandise 添加商品到购物车
func AddMerchandise(merchandiseId uint, num uint) *float64 {

	return &shoppingCart.SumPrice
}
