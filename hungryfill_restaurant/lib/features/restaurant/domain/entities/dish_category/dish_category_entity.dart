
import 'package:equatable/equatable.dart';

class DishCategoryEntity extends Equatable{
  final String? dishcategoryname;
  final String? dishcategoryid;

  const DishCategoryEntity({required this.dishcategoryname, required this.dishcategoryid});
  
  @override
  // TODO: implement props
  List<Object?> get props => [dishcategoryname , dishcategoryid];

}