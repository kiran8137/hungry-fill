import 'package:equatable/equatable.dart';

class DishEntity extends Equatable {
  final String? dishid;
  final String? dishname;
  final String? dishprice;
  final String? stock;
  final String? serve;
  final List<String?> category;
  final String? imageurl;

    DishEntity(
      {
        this.dishid,
        this.dishname,
        this.dishprice,
        this.stock,
        this.serve,
        required this.category,
        this.imageurl
      }) {
        print(" dish enitiy : $dishname");
      }

  @override
   
  List<Object?> get props => [dishid , dishname , dishprice , stock , serve , category , imageurl];
}
