import 'package:equatable/equatable.dart';

class DishEntity extends Equatable {
  final String? dishid;
  final String? dishname;
  final String? dishprice;
  final String? stock;
  final String? serve;
  final String? category;
  final String? imageurl;

    DishEntity(
      {
        this.dishid,
        this.dishname,
        this.dishprice,
        this.stock,
        this.serve,
        this.category,
        this.imageurl
      }) {
        print(" dish enitiy : $dishname");
      }

  @override
   
  List<Object?> get props => [dishname , dishprice , stock , serve , category , imageurl];
}
