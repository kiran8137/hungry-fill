
import 'package:hungryfill_restaurant/features/restaurant/domain/entities/dish/dish_entity.dart';

class DishModel extends DishEntity{
 
   DishModel(
 {
  super.dishid,
  super.dishname,
  super.dishprice,
  super.stock,
  super.serve,
  super.category,
  super.imageurl
 }
 ){
   print(" dish model : $dishname");
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
    "dishName" : dishname,
    "dishPrice" : dishprice,
    "stock" : stock,
    "serve" : serve,
    "category" : category,
    "imageUrl" : imageurl
  };
}
 

}