
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? categoryname;
  final String? categoryid;

  const CategoryEntity({required this.categoryname, required this.categoryid});

  @override
   
  List<Object?> get props => [categoryname , categoryid];
}