import 'package:equatable/equatable.dart';

class DishEntity extends Equatable {
  final String? dishid;
  final String? dishname;
  final String? dishprice;
  final String? dishserve;
  final String? dishstock;
  final String? dishimage;

  const DishEntity(
      {required this.dishid,
      required this.dishname,
      required this.dishprice,
      required this.dishserve,
      required this.dishstock,
      required this.dishimage});

  @override
  // TODO: implement props
  List<Object?> get props => [dishid , dishname , dishprice , dishserve , dishstock , dishimage];
}
