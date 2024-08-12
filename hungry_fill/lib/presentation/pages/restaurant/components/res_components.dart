
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_fill/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';

SingleChildScrollView filterChip(GetCategoriesSuccesState state, BuildContext context , String resuerid) {
    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: state.categories.map((category){
                          bool isselected = state.selectedcategories.contains(category.categoryname);
                          return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FilterChip(
                            selectedColor : Colors.white,
                            
                             shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          
                          
                          ),
                            backgroundColor: Colors.white,
                            
                            
                            label: Text(category.categoryname!), 
                             selected: isselected,
                            onSelected: (bool isseleced){
                               debugPrint(isseleced.toString());
                               BlocProvider.of<CategoryBloc>(context).add(CategorySelect(category: category.categoryname));
                               if(isseleced == true){
                                 BlocProvider.of<DishBloc>(context).add((GetCategoryDish(categoryid: category.categoryid , resuerid:  resuerid)));
                               }else{
                                 BlocProvider.of<DishBloc>(context).add((DishGetEvent(resuserid:  resuerid)));
                               }
                              
                                
                                
                            }
                            ),
                        );
                        }
                        
                        ).toList(),
                      
                      ),
                    );
  }

