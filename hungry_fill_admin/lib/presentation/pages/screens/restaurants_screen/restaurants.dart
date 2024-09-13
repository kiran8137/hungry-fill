import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/core/funtions.dart';
import 'package:hungry_fill_admin/presentation/pages/common_widget_component/components/components.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/restaurants_screen/components/components.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/restaurants_screen/widgets/category_detail_widget.dart';
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
      appBar: appBarCommon(title: 'Restaurants'),
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
                                                          Navigator.pop(
                                                              context);
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
                                                    Consumer<
                                                            RestaurantProvider>(
                                                        builder: (context,
                                                            value, child) {
                                                      return GestureDetector(
                                                        onTap: () async {
                                                          dishcategoryimage =
                                                              await value
                                                                  .imagePicker();
                                                        },
                                                        child: Container(
                                                            height: 50,
                                                            width: 55,
                                                            decoration: BoxDecoration(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    200,
                                                                    200,
                                                                    200),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8)),
                                                            child: dishcategoryimage ==
                                                                    null
                                                                ? const Icon(
                                                                    Icons
                                                                        .add_circle,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            159,
                                                                            159,
                                                                            159))
                                                                : Image.memory(
                                                                    dishcategoryimage!,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )),
                                                      );
                                                    }),
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
                                                      onTap: () async {
                                                        if (dishcategorycontroller
                                                                .text.isEmpty ||
                                                            dishcategoryimage!
                                                                .isEmpty) {
                                                          return;
                                                        }

                                                        dishcategoryimgeurl =
                                                            await saveImageToStorage(
                                                                filename:
                                                                    dishcategorycontroller
                                                                        .text,
                                                                selectedImageInBytes:
                                                                    dishcategoryimage!);
                                                        Provider.of<RestaurantProvider>(
                                                                context,
                                                                listen: false)
                                                            .createDishCategory(
                                                                dishcategoryimgeurl:
                                                                    dishcategoryimgeurl!,
                                                                dishcategory:
                                                                    dishcategorycontroller
                                                                        .text);

                                                        Navigator.pop(context);
                                                        dishcategorycontroller
                                                            .clear();
                                                      },
                                                      child:
                                                          addDishCategoryButtonInDialog(), // add dish category button in add cat dialog
                                                    ),
                                                    SizedBox(
                                                      height: 200,
                                                      child: Consumer<
                                                          RestaurantProvider>(
                                                        builder: (context,
                                                                value, child) =>
                                                            ListView.separated(
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  final dishcategory =
                                                                      value.dishcategories[
                                                                          index];
                                                                  return dishCategories(
                                                                      dishcategory); //list shown in add dishcategories dialog
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
                              child: categoriesAddButton(
                                  buttonTitle:
                                      "Dishes Category") //add DishCategory button

                              ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return addCategoryDialog(
                                        context, categorycontroller);
                                  });
                            },
                            child: categoriesAddButton(
                              buttonTitle: 'Category',
                            ), // addCategory button
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
               
              ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: detailMainContainer(tablecontents: tablecontents),
              ),
              Column(
                children: [
                  //dishcategories shown in Restaurants page
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Consumer<RestaurantProvider>(
                      builder: (context, value, child) => ListView.separated(
                          itemBuilder: (context, index) {
                            final dishcategory = value.dishcategories[index];
                            return categoriesList(
                                dishcategory, context, value, index);
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: value.dishcategories.length),
                    ),
                  ),

                  //categories shown in Restaurant page
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
