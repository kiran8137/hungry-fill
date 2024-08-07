
import 'package:hungryfill_restaurant/features/restaurant/domain/entities/dish/dish_entity.dart';

class DishModel extends DishEntity{
 
   DishModel(
 {
  super.dishid,
  super.dishname,
  super.dishprice,
  super.stock,
  super.serve,
 required super.category,
  super.imageurl
 }
 ){
   print(" dish model : $dishname  dishid: $dishid ,  ");
 }

factory DishModel.fromJson({ required Map<String , dynamic> json}){
  return DishModel(
    dishid: json["dishId"],
    dishname: json["dishName"],
    dishprice: json["dishPrice"],
    stock: json["stock"],
    serve: json["serve"],
    category: json["category"],
    imageurl: json["imageUrl"]
  );
}

Map<String , dynamic> toJson(){

  return {
    "dishId" : dishid,
    "dishName" : dishname,
    "dishPrice" : dishprice,
    "stock" : stock,
    "serve" : serve,
    "category" : category,
    "imageUrl" : imageurl
  };
}


DishModel copywith({
    
   
  final String? dishid,
  final String? dishname,
  final String? dishprice,
  final String? stock,
  final String? serve,
  required  List<String?> category,
  final String? imageurl,

  
   }){
    return DishModel(
      
      dishid: dishid ?? this.dishid,
      dishname: dishname ?? this.dishname,
      dishprice: dishprice ?? this.dishprice,
      stock: stock ?? stock,
      serve: serve ?? serve,
      category: category,
      imageurl: imageurl ?? imageurl
      
    );
   }
 

}