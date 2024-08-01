
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? categoryname;
  final String? categoryid;

  const CategoryEntity({required this.categoryname, required this.categoryid});

  @override
  // TODO: implement props
  List<Object?> get props => [categoryname , categoryid];
}