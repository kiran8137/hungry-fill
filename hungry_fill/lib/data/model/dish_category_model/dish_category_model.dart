import 'package:hungry_fill/domain/entities/dish_category_entity/dish_category_entity.dart';

class DishCategoryModel extends DishCategoryEntity {
  const DishCategoryModel(
      {super.dishcategoryname,
      super.dishcategoryid,
      super.dishcategoryimgeurl});

  factory DishCategoryModel.fromJson({required Map<String, dynamic> json}) {
    return DishCategoryModel(
        dishcategoryname: json['dishcategoryname'],
        dishcategoryid: json['dishcategoryid'],
        dishcategoryimgeurl: json['dishCategoryImgeurl']);
  }
}
