

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/category/category_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/repository/dishrepo_implement/dish_repo_impl.dart';

class DishProvider extends ChangeNotifier{
   final DishRepoImplementation dishrepository;

  DishProvider({required this.dishrepository});


List<DishModel> dishes = [];
List<CategoryModel> categories = [];


Future<void> getDishes() async{



  // List<DishModel> dish =   dishrepository.getDishes(userid: FirebaseAuth.instance.currentUser?.uid);
  dishes.clear();
  dishrepository.getDishes(userid:  FirebaseAuth.instance.currentUser?.uid).listen(
    (dishestream){
      dishes = dishestream;
      notifyListeners();
    }
  );
  //dishes.addAll(dish);
  //notifyListeners();
}

// Future<void> getCategories()async{
  
//   final categoriesresult = await dishrepository.getCategories();
//  categories.addAll(categoriesresult);
//  notifyListeners();


// }



  
  }