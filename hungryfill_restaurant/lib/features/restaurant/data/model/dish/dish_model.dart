
 
 

 

import 'package:hungryfill_restaurant/features/restaurant/domain/entities/dish/dish_entity.dart';

class DishModel extends DishEntity{
 
   DishModel(
 {
  super.dishid,
  super.dishname,
  super.dishdescription,
  super.dishprice,
  super.stock,
  super.serve,
 required super.category,
 required super.dishcategory,
   super.image1,
   super.image2,
   super.image3,
   super.image4
 }
 ){
   print(" dish model : $dishname  dishid: $dishid ,  ");
 }

factory DishModel.fromJson({ required Map<String , dynamic> json}){
  return DishModel(
    dishid: json["dishId"],
    dishname: json["dishName"],
    dishdescription: json['dishDescription'],
    dishprice: json["dishPrice"],
    stock: json["stock"],
    serve: json["serve"],
    category: json["category"],
    dishcategory: json['dishCategory'],
    image1: json["image1"],
    image2: json["image2"],
    image3: json["image3"],
    image4: json["image4" ],
  );
}

Map<String , dynamic> toJson(){

  return {
    "dishId" : dishid,
    "dishName" : dishname,
    'dishDescription': dishdescription,
    "dishPrice" : dishprice,
    "stock" : stock,
    "serve" : serve,
    "category" : category,
    'dishCategory' : dishcategory,
    "image1" : image1,
    "image2" : image2,
    "image3" : image2,
    "image4" : image2
  };
}


DishModel copywith({
    
   
  final String? dishid,
  final String? dishname,
  final String? dishdescription,
  final String? dishprice,
  final String? stock,
  final String? serve,
  required  List<dynamic> category,
  required String? dishCategory,
  final String? image1,
  final String? image2,
  final String? image3,
  final String? image4

  
   }){
    return DishModel(
      
      dishid: dishid ?? this.dishid,
      dishname: dishname ?? this.dishname,
      dishdescription: dishdescription ?? this.dishdescription,
      dishprice: dishprice ?? this.dishprice,
      stock: stock ?? stock,
      serve: serve ?? serve,
      category: category,
      dishcategory: dishCategory,
      image1: image1 ?? this.image1,
      image2: image2?? this.image2,
      image3: image3 ?? this.image3,
      image4: image4 ?? this.image4, 
      

       
      
    );
   }
 

}