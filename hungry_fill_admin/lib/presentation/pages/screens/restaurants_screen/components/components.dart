
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/core/theme/color.dart';
import 'package:hungry_fill_admin/data/models/category_model.dart';
import 'package:hungry_fill_admin/data/models/dish_category_model.dart';
import 'package:hungry_fill_admin/presentation/pages/common_widget_component/components/components.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/restaurants_screen/widgets/edit_dialog.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/restaurants_screen/widgets/restaurant_detail.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/restaurant_provider.dart';
import 'package:provider/provider.dart';

Dialog categoryAddDialog({required BuildContext context ,required TextEditingController categorycontroller}) {
    return Dialog(
                                  child: Container(
                                    decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius: BorderRadius.circular(10)
                                    ),
                                    height: 330,
                                    width: 200,
                                   
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            right: 0,
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.pop(context);
                                              },
                                              child: const Icon(Icons.cancel)
                                              )
                                            ),
                                          Column(
                                            children: [
                                              Text(
                                                'Category',
                                                style: GoogleFonts.roboto(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              TextFormField(
                                                controller: categorycontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10))),
                                              ),
                                              const SizedBox(height: 6),
                                              GestureDetector(
                                                onTap: (){
                                                  if(categorycontroller.text.isEmpty){
                                                    return;
                                                  }
                                                  Provider.of<RestaurantProvider>(context,listen: false).createCategory(category: categorycontroller.text);
                                                  
                                                  Navigator.pop(context);
                                                  categorycontroller.clear();
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 150,
                                                  
                                                  decoration: BoxDecoration(
                                                    color: primarycolor,
                                                    borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  child: Center(
                                                    child: Text('Add Category',
                                                    style: GoogleFonts.aBeeZee(
                                                      color: Colors.white
                                                    ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 200,
                                                child: Consumer<RestaurantProvider>(
                                                  builder: (context, value, child) => 
                                                    ListView.separated(
                                                      itemBuilder:
                                                          (context, index) {
                                                        final category =
                                                            value.categories[index];
                                                        return ListTile(
                                                          title: Text(
                                                            category.categoryname!,
                                                            style:
                                                                GoogleFonts.inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                          trailing: const Icon(
                                                            Icons.delete,
                                                            size: 18,
                                                            color: Colors.red,
                                                          ),
                                                        );
                                                      },
                                                      separatorBuilder:
                                                          (context, index) =>
                                                              const Divider(),
                                                      itemCount: value.categories.length),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
  }


Dialog addCategoryDialog(BuildContext context , TextEditingController categorycontroller) {
    return Dialog(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      height: 330,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                                right: 0,
                                                child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Icon(
                                                        Icons.cancel))),
                                            Column(
                                              children: [
                                                Text(
                                                  'Category',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                TextFormField(
                                                  controller:
                                                      categorycontroller,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10))),
                                                ),
                                                const SizedBox(height: 6),
                                                GestureDetector(
                                                  onTap: () {
                                                    if (categorycontroller
                                                        .text.isEmpty) {
                                                      return;
                                                    }
                                                    Provider.of<RestaurantProvider>(
                                                            context,
                                                            listen: false)
                                                        .createCategory(
                                                            category:
                                                                categorycontroller
                                                                    .text);

                                                    Navigator.pop(context);
                                                    categorycontroller
                                                        .clear();
                                                  },
                                                  child: Container(
                                                    height: 30,
                                                    width: 150,
                                                    decoration: BoxDecoration(
                                                        color: primarycolor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Center(
                                                      child: Text(
                                                        'Add Category',
                                                        style: GoogleFonts
                                                            .aBeeZee(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  
                                                  height: 200,
                                                  child: Consumer<
                                                      RestaurantProvider>(
                                                    builder: (context, value,
                                                            child) =>
                                                        ListView.separated(
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              final category =
                                                                  value.categories[
                                                                      index];
                                                              return ListTile(
                                                                title: Text(
                                                                  category
                                                                      .categoryname!,
                                                                  style: GoogleFonts.inter(
                                                                      fontWeight:
                                                                          FontWeight.w600),
                                                                ),
                                                                trailing:
                                                                    const Icon(
                                                                  Icons
                                                                      .delete,
                                                                  size: 18,
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                              );
                                                            },
                                                            separatorBuilder:
                                                                (context,
                                                                        index) =>
                                                                    const Divider(),
                                                            itemCount: value
                                                                .categories
                                                                .length),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
  }


Container categoriesAddButton({required String buttonTitle}) {
    return Container(
                            height: 34,
                            width: 125,
                            decoration: BoxDecoration(
                                color: primarycolor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                Text(
                                 buttonTitle,
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          );
  }

  //list shown in add dishcategories dialog
  ListTile dishCategories(DishCategoryModel dishcategory) {
    return ListTile(
                                                                leading: Container(
                                                                  height: 20,
                                                                  width: 20,
                                                                  color: Colors.grey,
                                                                ),
                                                                title: Text(
                                                                  dishcategory
                                                                      .dishcategoryname!,
                                                                  style: GoogleFonts.inter(
                                                                      fontWeight:
                                                                          FontWeight.w600),
                                                                ),
                                                                trailing:
                                                                    const Icon(
                                                                  Icons
                                                                      .delete,
                                                                  size: 18,
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                              );
  }


// add dish category button in add cat dialog
 Container addDishCategoryButtonInDialog() {
    return Container(
                                                    height: 30,
                                                    width: 150,
                                                    decoration: BoxDecoration(
                                                        color: primarycolor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Center(
                                                      child: Text(
                                                        'Add DishCategory',
                                                        style: GoogleFonts
                                                            .aBeeZee(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  );
  }



ListTile categoriesList(DishCategoryModel dishcategory, BuildContext context, RestaurantProvider value, int index) {
    return ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(image: NetworkImage(dishcategory.dishcategoryimgeurl!,),fit: BoxFit.cover)
                     ),
                    ),
                    title: Text(
                      dishcategory.dishcategoryname!,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600),
                    ),
                    trailing: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  CategoryModel category =
                                      CategoryModel(
                                          categoryname: value
                                              .categories[
                                                  index]
                                              .categoryname,
                                          categoryid: value
                                              .categories[
                                                  index]
                                              .categoryid);
                                  return EditDialog(
                                      currentcategory:
                                          category);
                                });
                          },
                          child: const Icon(
                            Icons.edit,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      "Are you sure want to delete",
                                      style: TextStyle(
                                          fontSize: 15),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(
                                                context);
                                          },
                                          child: const Text(
                                              'cancel')),
                                      TextButton(
                                          onPressed: () {
                                            // value.deleteCategory(
                                            //     categoryid:
                                            //         category
                                            //             .categoryid!);
                                            Navigator.pop(
                                                context);
                                          },
                                          child: const Text(
                                              'ok'))
                                    ],
                                  );
                                });
                          },
                          child: const Icon(
                            Icons.delete,
                            size: 18,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
  }


Padding detailMainContainer({required List<String> tablecontents}) {
    return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  width: 1000,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 30,
                          width: 1000,
                          child: restaurantDetailTable(tablecontents),
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        height: 450,
                        width: 1000,
                        child: Consumer<RestaurantProvider>(
                          builder: (context, value, child) =>
                              ListView.separated(
                                  itemBuilder: (context, index) {
                                    final restaurant =
                                        value.restaurants[index];
                                    return RestaurantDetailWidget(
                                        restaurant: restaurant);
                                  },
                                  separatorBuilder: (context, index) =>
                                      const Divider(),
                                  itemCount: value.restaurants.length),
                        ),
                      )
                    ],
                  ),
                ),
              );
  }

 

  