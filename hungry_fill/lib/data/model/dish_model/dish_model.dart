import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungry_fill/domain/entities/dish_entity/dish_entity.dart';

class DishModel extends DishEntity {
 const DishModel(
      {
        super.dishid,
        super.dishname,
        super.dishdescription,
        super.dishprice,
        super.dishserve,
        super.dishstock,
        super.image1,
        super.image2,
        super.image3,
        super.image4
      });

factory DishModel.fromJson({required Map<String , dynamic> json}){
  return DishModel(
    dishid: json["dishId"],
    dishname: json["dishName"],
    dishdescription: json["dishDescription"],
    dishprice: json["dishPrice"],
    dishserve: json["serve"],
    dishstock: json["stock"],
    image1: json['image1'],
    image2: json['image2'],
    image3: json['image3'],
    image4: json['image4']
  );
}

factory DishModel.fromSnapshot({required DocumentSnapshot snapshot}){
  return DishModel(
    dishid: snapshot["dishId"],
    dishname: snapshot["dishName"],
    dishdescription: snapshot["dishDescription"],
    dishprice: snapshot["dishPrice"],
    dishserve: snapshot["serve"],
    dishstock: snapshot["stock"],
    image1: snapshot['image1'],
    image2: snapshot['image2'],
    image3: snapshot['image3'],
    image4: snapshot['image4']
  );
}

}
