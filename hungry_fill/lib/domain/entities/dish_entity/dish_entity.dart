import 'package:equatable/equatable.dart';

class DishEntity extends Equatable {
  final String? dishid;
  final String? dishname;
  final String? dishdescription;
  final String? dishprice;
  final String? dishserve;
  final String? dishstock;
   
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;

  const DishEntity( 
   
      {required this.dishid,
      required this.dishname,
      required this.dishdescription,
      required this.dishprice,
      required this.dishserve,
      required this.dishstock,
       
      required this.image1, 
      required this.image2, 
      required this.image3, 
      required this.image4, 
      });

  @override
   
  List<Object?> get props => [dishid , dishname ,dishdescription, dishprice , dishserve , dishstock , image1 ,image2 , image3, image4];
}
