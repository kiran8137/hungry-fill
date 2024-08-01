
 
import 'package:hungry_fill/domain/entities/category_entity/category_entity.dart';
 

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
