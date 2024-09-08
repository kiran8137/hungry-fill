import 'package:hungryfill_restaurant/features/restaurant/domain/entities/dish_category/dish_category_entity.dart';

class DishCategoryModel extends DishCategoryEntity{
  const DishCategoryModel({  super.dishcategoryname,   super.dishcategoryid});


  factory DishCategoryModel.fromJson({required Map<String , dynamic> json}){
    return DishCategoryModel(
      dishcategoryname: json['dishcategoryname'],
      dishcategoryid: json['dishcategoryid']
    );
  }

  Map<String , dynamic> toJson(){
    return {
      'dishcategoryname':dishcategoryname,
      'dishcategoryid':dishcategoryid
    };

  }
}