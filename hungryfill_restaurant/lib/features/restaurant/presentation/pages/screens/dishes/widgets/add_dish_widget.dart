import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/funcitons/dish_funcitons.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/category/category_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/widgets_dish_image/add_dish_image.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/category/category_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/dish/dish_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/dish_category/dish_category_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/provider/dish_provider.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:provider/provider.dart';

class AddDish extends StatefulWidget {
  const AddDish({super.key});

  @override
  State<AddDish> createState() => _AddDishState();
}

class _AddDishState extends State<AddDish> {
  var stockitems = ['IN', 'OUT'];

  var dropdownvalue = 'IN';
  List<CategoryModel> categories = [];
  List<ValueItem<String>> selectedcategories = [];
   List<ValueItem<String>> selecteddishcategories = [];

  List<String>? selectedimagesurl = [];
  //selected images
  Uint8List? selectedimag1;
  Uint8List? selectedimag2;
  Uint8List? selectedimag3;
  Uint8List? selectedimag4;

  String? selectedimag1url;
  String? selectedimag2url;
  String? selectedimag3url;
  String? selectedimag4url;

  final TextEditingController dishnamecontroller = TextEditingController();

  final TextEditingController discriptioncontroller = TextEditingController();

  final TextEditingController dishpricecontroller = TextEditingController();

  final TextEditingController dishstockcontroller = TextEditingController();

  final TextEditingController dishservecontroller = TextEditingController();

  final TextEditingController dishcategorycontroller = TextEditingController();

  final MultiSelectController mulitselectorcontoller = MultiSelectController();
  @override
  void initState() {
    // TODO: implement initState
    // BlocProvider.of<CategoryBloc>(context).add(GetCategoriesEvent());
    // BlocProvider.of<CategoryBloc>(context).add(GetDishCategoriesEvent());
     Provider.of<DishProvider>(context, listen: false).getDishCategory();
     Provider.of<DishProvider>(context, listen: false).getCategory();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 700,
        width: 1000,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                width: 1, color: const Color.fromARGB(255, 203, 203, 203)),
            borderRadius: BorderRadius.circular(7)),
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8)),
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 225, 224, 224)))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Add Dish',
                  style: GoogleFonts.roboto(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                bottom: 10,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  left: 0.9,
                  right: 200,
                ),
                height: 590,
                width: 450,
                //color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   'Dish Details',
                      //   style: GoogleFonts.roboto(
                      //       fontSize: 25,
                      //       fontWeight: FontWeight.w700,
                      //       color: primarycolor),
                      // ),

                      const Text(
                        'Images',
                        style: TextStyle(
                            fontSize: 15,
                            color: primarycolor,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          //color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 203, 203, 203)),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                          child: Consumer<DishProvider>(
                              builder: (context, value, child) {
                            // selectedimag1 = value.selectedimage;
                            return Row(
                              children: [
                                GestureDetector(
                                    onTap: () async {
                                      selectedimag1 = await value.imagePicker();
                                      // selectedimages.add(selectedimag1);
                                    },
                                    child: DishImageWidget(
                                        selectedimage: selectedimag1)),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                    onTap: () async {
                                      selectedimag2 = await value.imagePicker();
                                      // selectedimages.add(selectedimag2);
                                    },
                                    child: DishImageWidget(
                                        selectedimage: selectedimag2)),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                    onTap: () async {
                                      selectedimag3 = await value.imagePicker();
                                      // selectedimages.add(selectedimag3);
                                    },
                                    child: DishImageWidget(
                                        selectedimage: selectedimag3)),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                    onTap: () async {
                                      selectedimag4 = await value.imagePicker();
                                      //selectedimages.add(selectedimag4);
                                    },
                                    child: DishImageWidget(
                                        selectedimage: selectedimag4)),
                                const SizedBox(
                                  width: 5,
                                )
                              ],
                            );
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Dish Name',
                        style: TextStyle(
                            fontSize: 15,
                            color: primarycolor,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 203, 203, 203)),
                        ),
                        child: TextFormField(
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          controller: dishnamecontroller,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Dish Description',
                        style: TextStyle(
                            fontSize: 15,
                            color: primarycolor,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 203, 203, 203)),
                        ),
                        child: TextFormField(
                          maxLines: 2,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          controller: discriptioncontroller,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Dish price',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: primarycolor,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                  // color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 203, 203, 203)),
                                ),
                                child: TextFormField(
                                  maxLines: 2,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                  controller: dishpricecontroller,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Dish Serve',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: primarycolor,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                  // color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 203, 203, 203)),
                                ),
                                child: TextFormField(
                                  maxLines: 2,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                  controller: dishservecontroller,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Dish Stock',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: primarycolor,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    // color: Colors.red,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                            255, 203, 203, 203)),
                                  ),
                                  child: DropdownButton(
                                      focusColor: primarycolor,
                                      value: dropdownvalue,
                                      items: stockitems.map((item) {
                                        return DropdownMenuItem(
                                          value: item,
                                          child: Text(item),
                                        );
                                      }).toList(),
                                      onChanged: (newvalue) {
                                        setState(() {
                                          dropdownvalue = newvalue!;
                                        });
                                      })),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      const Text(
                        'Category',
                        style: TextStyle(
                            fontSize: 15,
                            color: primarycolor,
                            fontWeight: FontWeight.w700),
                      ),

                      BlocBuilder<CategoryBloc, CategoryState>(
                        builder: (context, state) {
                          debugPrint(state.runtimeType.toString());
                          if (state is CategorySuccessEvent) {
                            categories = state.categories;

                            return 
                      SizedBox(
                              width: double.infinity,
                              height: 35,
                              child: MultiSelectDropDown(
                                options: categories
                                    .map((category) => ValueItem(
                                        label: category.categoryname!,
                                        value: category.categoryid))
                                    .toList(),
                                onOptionSelected: (selectedvalues) {
                                  setState(() {
                                    selectedcategories = selectedvalues;
                                  });
                                },
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),

                      //   Consumer<DishProvider>(
                      // builder: (BuildContext context, DishProvider value,
                      //         Widget? child){
                      //            return  
                      //           Container(
                      //         width: double.infinity,
                      //         height: 35,
                      //         child: MultiSelectDropDown(
                      //           hintColor: Colors.black,
                      //           options: value.categories
                      //               .map((category) => ValueItem(
                      //                   label: category.categoryname!,
                      //                   value: category.categoryid))
                      //               .toList(),
                      //           onOptionSelected: (selectedvalues) {
                      //             setState(() {
                      //               selectedcategories = selectedvalues;
                      //             });
                      //           },
                      //         ),
                      //       );
                      //         }
                      //   ),
                      //SizedBox(height: 30),

                      const Text(
                        'Dish Category',
                        style: TextStyle(
                            fontSize: 15,
                            color: primarycolor,
                            fontWeight: FontWeight.w700),
                      ),
                      BlocBuilder<DishCategoryBloc, DishCategoryState>(
                        builder: (context, state) {
                          if (state is GetDishCategoriesSuccess) {
                            final dishcategories = state.dishcategories;
                            return
                             SizedBox(
                              width: double.infinity,
                              height: 35,
                              child: MultiSelectDropDown(
                                options: dishcategories
                                    .map((dishcategory) => ValueItem(
                                        label: dishcategory.dishcategoryname!,
                                        value: dishcategory.dishcategoryid))
                                    .toList(),
                                onOptionSelected: (selectedvalues) {
                                  setState(() {
                                    selecteddishcategories = selectedvalues;
                                  });
                                },
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),

                    

                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              debugPrint('add dish tapped');
                              if (dishnamecontroller.text.isEmpty ||
                                      dishpricecontroller.text.isEmpty ||
                                      dropdownvalue.isEmpty ||
                                      dishservecontroller.text.isEmpty ||
                                      selectedcategories.isEmpty ||
                                      selecteddishcategories.isEmpty
                                  //  selectedimages.isEmpty || selectedimages.length<4
                                  ) {
                                return;
                              }

                              final selectedcategoryids = selectedcategories
                                  .map((category) => category.value)
                                  .toList();
                              final selecteddishcategoryids = selecteddishcategories.
                              map((category)=> category.value).toList();

                              selectedimag1url = await saveImageToStorage(
                                filename: 'dishimage1',
                                selectedImageInBytes: selectedimag1!,
                              );
                              selectedimag2url = await saveImageToStorage(
                                  filename: 'dishimage2',
                                  selectedImageInBytes: selectedimag2!);
                              selectedimag3url = await saveImageToStorage(
                                  filename: 'dishimage3',
                                  selectedImageInBytes: selectedimag3!);
                              selectedimag4url = await saveImageToStorage(
                                  filename: 'dishimage4',
                                  selectedImageInBytes: selectedimag4!);

                              DishModel dish = DishModel(
                                  dishname: dishnamecontroller.text,
                                  dishdescription: discriptioncontroller.text,
                                  dishprice: dishpricecontroller.text,
                                  stock: dropdownvalue,
                                  serve: dishservecontroller.text,
                                  category: selectedcategoryids,
                                  dishcategory: selecteddishcategoryids[0],
                                  image1: selectedimag1url,
                                  image2: selectedimag2url,
                                  image3: selectedimag3url,
                                  image4: selectedimag4url);

                              debugPrint('selected dish $dish');

                              BlocProvider.of<DishBloc>(context)
                                  .add(DishAddEvent(dishmodel: dish));
                           
                              Navigator.pop(context);
                              selecteddishcategoryids.clear();

                            },
                            child: Container(
                              height: 34,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: primarycolor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Add Dish',
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
