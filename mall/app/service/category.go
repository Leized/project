package service

import "mall/app/model"

var category model.Category

// InsertCate 把分类信息写入数据库
func InsertCate(class string, kind string) *model.Category {
	db.Create(&model.Category{
		Class: class,
		Kind:  kind,
	})
	return &category
}

// QueryClass 根据类别获取种类列表
func QueryClass(class string) *string {
	db.Where("class = ?", class).First(&category)
	return &category.Kind
}

// QueryKind 根据种类获取商品列表
func QueryKind(kind string) *uint {
	db.Where("kind = ?", kind).First(&category)
	return &category.ID
}

// QueryCategoryID 根据种类ID获取商品信息
func QueryCategoryID(id uint) *model.Merchandise {
	db.Where("category_id = ?", id).First(&model.Merchandise{})
	return &model.Merchandise{}
}
