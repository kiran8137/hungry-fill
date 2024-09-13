
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DishEntity extends Equatable {
  final String? dishid;
  final String? dishname;
  final String? dishdescription;
  final String? dishprice;
  final String? stock;
  final String? serve;
  final List<dynamic> category;
  final String? dishcategory;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;



    DishEntity(
      {
        this.dishid,
        this.dishname,
        this.dishdescription,
        this.dishprice,
        this.stock,
        this.serve,
        required this.category,
        required this.dishcategory,
        this.image1,
        this.image2,
        this.image3,
        this.image4,

      }) {
        debugPrint(" dish enitiy : $dishname");
      }

  @override
   
  List<Object?> get props => [dishid , dishname , dishdescription, dishprice , stock , serve , category , dishcategory, image1,image2,image3,image4];
}
