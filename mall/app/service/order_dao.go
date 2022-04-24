package service

import (
	"mall/app/model"
)

// InsetOrder 订单信息写入数据库
func InsetOrder(userId int, orderNum string, merchandises string, sumPrice float64, state string) {
	db.Create(&model.Order{
		UserID:       userId,
		OrderNum:     orderNum,
		Merchandises: merchandises,
		SumPrice:     sumPrice,
		State:        state,
	})
}

// QueryUserID 根据用户id获取订单列表
func QueryUserID(userId int, page int, pageSize int) (order []model.Order) {
	db.Where("user_id = ?", userId).Scopes(Paginate(page, pageSize)).Find(&order)
	return order
}

// QueryState 根据订单状态获取订单列表
func QueryState(userId int, state string) (order []model.Order) {
	db.Where("user_id = ? AND state = ?", userId, state).Find(&order)
	return order
}

// QueryOrderNum 根据订单编号获取订单列表
func QueryOrderNum(orderNum string) (order *model.Order) {
	db.Where("order_num = ?", orderNum).Find(&order)
	return order
}

// QueryOrderId 根据id获取订单信息
func QueryOrderId(id uint) (order *model.Order) {
	db.Where("id = ?", id).Find(&order)
	return order
}

// UpdateOrder 根据id修改订单信息
func UpdateOrder(id uint, state string) {
	db.Model(&model.Order{}).Where("id = ?", id).Updates(model.Order{
		State: state,
	})
}

// DeleteOrder 删除订单信息
func DeleteOrder(id uint) {
	db.Where("id = ?", id).Delete(&model.Order{})
}
