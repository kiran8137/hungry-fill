import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/core/funtions.dart';
import 'package:hungry_fill_admin/core/theme/color.dart';
import 'package:hungry_fill_admin/data/models/category_model.dart';
import 'package:hungry_fill_admin/presentation/pages/common_widget_component/components/components.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/restaurants_screen/components/components.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/restaurants_screen/widgets/category_detail_widget.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/restaurants_screen/widgets/restaurant_detail.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/restaurants_screen/widgets/edit_dialog.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/restaurant_provider.dart';
import 'package:provider/provider.dart';

class RestaurantsScreen extends StatelessWidget {
  RestaurantsScreen({super.key});

  final tablecontents = [
    "Restaurant Name",
    "Address",
    "Phone number",
    "Active/InActive",
    "               "
  ];

  final TextEditingController categorycontroller = TextEditingController();
  final TextEditingController dishcategorycontroller = TextEditingController();

  Uint8List? dishcategoryimage;
  String? dishcategoryimgeurl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Restaurants',
          style: GoogleFonts.radioCanada(
              fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Restaurants List',
                        style: GoogleFonts.roboto(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 34,
                            width: 250,
                            //color: Colors.red,
                            child: TextFormField(
                              style: const TextStyle(height: 1.3),
                              decoration: InputDecoration(
                                  hintText: 'Search Restaurants',
                                  hintStyle: const TextStyle(fontSize: 11),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          ),
                          const Icon(
                            Icons.search,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        height: 400,
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
                                                    'Dish Category',
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Consumer<RestaurantProvider>(
                                                     builder: (context, value, child){
                                                      return  GestureDetector(
                                                      onTap: () async{
                                                        dishcategoryimage = await value.ImagePicker();
                                                      },
                                                      child: Container(
                                                          height: 50,
                                                          width: 55,
                                                          decoration:  BoxDecoration(
                                                             color: Color.fromARGB(255, 200, 200, 200),
                                                             borderRadius: BorderRadius.circular(8)
                                                          ),
                                                         
                                                          child: dishcategoryimage ==
                                                                  null
                                                              ? const Icon(
                                                                  Icons.add_circle,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          159,
                                                                          159,
                                                                          159))
                                                              : Image.memory(
                                                                  dishcategoryimage!,fit: BoxFit.cover,)),
                                                    );
                                                     }
                                                    
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        dishcategorycontroller,
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                  ),
                                                  const SizedBox(height: 6),
                                                  GestureDetector(
                                                    onTap: () async{
                                                      if (dishcategorycontroller
                                                          .text.isEmpty || dishcategoryimage!.isEmpty) {
                                                        return;
                                                      }
                                                      
                                                      dishcategoryimgeurl = await saveImageToStorage(filename: dishcategorycontroller.text, selectedImageInBytes: dishcategoryimage!);
                                                      Provider.of<RestaurantProvider>(
                                                              context,
                                                              listen: false)
                                                          .createDishCategory(
                                                            dishcategoryimgeurl: dishcategoryimgeurl!,
                                                              dishcategory:
                                                                  dishcategorycontroller
                                                                      .text);

                                                      Navigator.pop(context);
                                                      dishcategorycontroller
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
                                                          'Add DishCategory',
                                                          style: GoogleFonts
                                                              .aBeeZee(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 200,
                                                    child: Consumer<
                                                        RestaurantProvider>(
                                                      builder: (context, value,
                                                              child) =>
                                                          ListView.separated(
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                final dishcategory =
                                                                    value.dishcategories[
                                                                        index];
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
                                                              },
                                                              separatorBuilder:
                                                                  (context,
                                                                          index) =>
                                                                      const Divider(),
                                                              itemCount: value
                                                                  .dishcategories
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
                                  });
                            },
                            child: Container(
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
                                    'Dishes Category',
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
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
                                                  Container(
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
                                  });
                            },
                            child: Container(
                              height: 34,
                              width: 120,
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
                                    'Category',
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
              //  restaurantBar(
              //     context: context, categorycontroller: categorycontroller , dishcategorycontroller: dishcategorycontroller),
              ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Padding(
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
                          child: Container(
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
                ),
              ),
              Column(
                children: [
                Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Consumer<RestaurantProvider>(
          builder: (context, value, child) =>
              ListView.separated(
                  itemBuilder: (context, index) {
                    final dishcategory = value.dishcategories[index];
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
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(),
                  itemCount: value.dishcategories.length),
        ),
        ),
                  Text(
                    'Categories',
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Categories(),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
