import 'package:equatable/equatable.dart';

class DishCategoryEntity extends Equatable {
 final String? dishcategoryname;
final String? dishcategoryid;
final String? dishcategoryimgeurl;

  const DishCategoryEntity({required this.dishcategoryname, required this.dishcategoryid , required this.dishcategoryimgeurl});

  @override
   
  List<Object?> get props => [dishcategoryname , dishcategoryid , dishcategoryimgeurl];
}