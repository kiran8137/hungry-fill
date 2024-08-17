import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/categories.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/category/category_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/category/category_bloc.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

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
              padding: const EdgeInsets.all(15.0),
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
                            fontWeight: FontWeight.w700
                            ),
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
                          child: Row(
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 241, 240, 240),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 203, 203, 203)),
                                  // image: DecorationImage(image: AssetImage('assets/add image.png'),fit: BoxFit.contain)
                                ),
                                child: const Icon(Icons.add_circle,
                                    color: Color.fromARGB(255, 159, 159, 159)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 241, 240, 240),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 203, 203, 203)),
                                ),
                                child: const Icon(Icons.add_circle,
                                    color: Color.fromARGB(255, 159, 159, 159)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 241, 240, 240),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 203, 203, 203)),
                                ),
                                child: const Icon(Icons.add_circle,
                                    color: Color.fromARGB(255, 159, 159, 159)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 241, 240, 240),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 203, 203, 203)),
                                ),
                                child: const Icon(Icons.add_circle,
                                    color: Color.fromARGB(255, 159, 159, 159)),
                              ),
                              const SizedBox(
                                width: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Dish Name',
                        style: TextStyle(
                            fontSize: 15,
                            color: primarycolor,
                            fontWeight: FontWeight.w700
                            ),
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
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Dish Description',
                        style: TextStyle(
                            fontSize: 15,
                             color: primarycolor,
                            fontWeight: FontWeight.w700
                            ),
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
                        ),
                      ),

                      const SizedBox(
                        height: 20,
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
                            fontWeight: FontWeight.w700
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                height: 40,
                                width: 150,
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
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Dish Stock',
                                style: TextStyle(
                                    fontSize: 15,
                                     color: primarycolor,
                            fontWeight: FontWeight.w700
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                  height: 40,
                                  width: 150,
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
                                      }))
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      const Text(
                        'Dish Category',
                        style: TextStyle(
                            fontSize: 15,
                            color: primarycolor,
                            fontWeight: FontWeight.w700
                            ),
                      ),


                      BlocBuilder<CategoryBloc, CategoryState>(
                        builder: (context, state) {
                          debugPrint(state.runtimeType.toString());
                          if (state is CategorySuccessEvent) {
                            categories = state.categories;

                            return Container(
                              width: double.infinity,
                              height: 30,
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

                      SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Cancel',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600
                          ),
                          ),

                         Container(
                              height: 34,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: primarycolor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                 
                                  Text(
                                    'Dish',
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15
                                        ),
                                  ),

                                   const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  
                                ],
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
