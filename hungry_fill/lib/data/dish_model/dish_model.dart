import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungry_fill/domain/entities/dish_entity/dish_entity.dart';

class DishModel extends DishEntity {
 const DishModel(
      {
        super.dishid,
        super.dishname,
        super.dishprice,
        super.dishserve,
        super.dishstock,
        super.dishimage
      });

factory DishModel.fromJson({required Map<String , dynamic> json}){
  return DishModel(
    dishid: json["dishId"],
    dishname: json["dishName"],
    dishprice: json["dishPrice"],
    dishserve: json["serve"],
    dishstock: json["stock"],
    dishimage: json["imageUrl"],
  );
}

}
