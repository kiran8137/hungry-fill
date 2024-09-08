
import 'package:hungry_fill_admin/domain/entities/dish_category_entity.dart';

class DishCategoryModel extends DishCategoryEntity{
  DishCategoryModel({  super.dishcategoryname,   super.dishcategoryid , super.dishcategoryimgeurl});


  factory DishCategoryModel.fromJson({required Map<String , dynamic> json}){
    return DishCategoryModel(
      dishcategoryname: json['dishcategoryname'],
      dishcategoryid: json['dishcategoryid'],
      dishcategoryimgeurl: json['dishCategoryImgeurl']
      
    );
  }

  Map<String , dynamic> toJson(){
    return {
      'dishcategoryname':dishcategoryname,
      'dishcategoryid':dishcategoryid,
      'dishCategoryImgeurl': dishcategoryimgeurl
    };

  }
}