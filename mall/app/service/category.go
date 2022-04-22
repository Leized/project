package service

import (
	"mall/app/model"
)

// InsertCate 把分类信息写入数据库
func InsertCate(class string, kind string) {
	db.Create(&model.Category{
		Class: class,
		Kind:  kind,
	})
}

// UpdateCate 根据分类Id更新分类信息
func UpdateCate(id uint, class string, kind string) {
	db.Model(&model.Category{}).Where("id = ?", id).Updates(model.Category{
		Class: class,
		Kind:  kind,
	})
}

// QueryCate 获取分类列表
func QueryCate(page int, pageSize int) (category []model.Category) {
	//db.Where("id > 0").Find(&category)
	db.Scopes(Paginate(page, pageSize)).Find(&category)
	return category
}

// QueryId 根据id获取分类信息
func QueryId(id uint) (category *model.Category) {
	db.Where("id = ?", id).Find(&category)
	return category
}

// QueryClass 根据类别名获取种类列表
func QueryClass(class string) (category []model.Category) {
	db.Where("class = ?", class).Find(&category)
	return category
}

// QueryKind 根据种类获取分类信息
func QueryKind(kind string) (category *model.Category) {
	db.Where("kind = ?", kind).First(&category)
	return category
}

// DeleteCateId 根据分类ID删除分类信息
func DeleteCateId(id uint) {
	db.Where("id = ?", id).Delete(&model.Category{})
}
