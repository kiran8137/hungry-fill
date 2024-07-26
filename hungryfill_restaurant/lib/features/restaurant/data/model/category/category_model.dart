 
import 'package:hungryfill_restaurant/features/restaurant/domain/entities/category/category.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    super.categoryname, 
    super.categoryid
    });

  factory CategoryModel.fromJson({required Map<String , dynamic> json}){
    return CategoryModel(
      categoryname: json['name'],
      categoryid: json['categoryId']
    );
  }

  Map<String , dynamic> toJson(){
    return {
      'name':categoryname,
      'categoryId':categoryid
    };

  }
}
