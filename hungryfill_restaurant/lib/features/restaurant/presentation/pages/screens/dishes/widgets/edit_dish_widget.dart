import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/funcitons/dish_funcitons.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/category/category_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/widgets_dish_image/edit_dish_image.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/category/category_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/dish/dish_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/provider/dish_provider.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:provider/provider.dart';

class EditDish extends StatefulWidget {
  const EditDish({super.key, required this.currentdish});

  final DishModel currentdish;

  @override
  State<EditDish> createState() => _EditDishState();
}

class _EditDishState extends State<EditDish> {
  var stockitems = ['IN', 'OUT'];

  var dropdownvalue = 'IN';
  List<CategoryModel> categories = [];
  List<ValueItem<String>> selectedcategories = [];

    
     
//List<Uint8List?> selectedimages = [];
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



  late TextEditingController dishnamecontroller;

  late TextEditingController dishdescriptioncontroller;

  late  TextEditingController dishpricecontroller;

  late  TextEditingController dishstockcontroller;

  late   TextEditingController dishservecontroller;

  late TextEditingController dishcategorycontroller;

  late MultiSelectController categorycontroller;



     @override
  void initState() {
  dishnamecontroller = TextEditingController(text: widget.currentdish.dishname);

  dishdescriptioncontroller = TextEditingController(text: widget.currentdish.dishdescription);

  dishpricecontroller =  TextEditingController(text: widget.currentdish.dishprice);

  dishstockcontroller =  TextEditingController(text: widget.currentdish.stock);

  dishservecontroller = TextEditingController(text: widget.currentdish.serve);

  categorycontroller =  MultiSelectController();

  dropdownvalue = widget.currentdish.stock!;
 // dishcategorycontroller = TextEditingController(text: widget.dish.category);
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
                  'update Dish',
                  style: GoogleFonts.roboto(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,bottom: 10),
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
                          child: Consumer<DishProvider>(
                            builder: (context, value, child) {
                             // selectedimag1 = value.selectedimage;
                              return  Row(
                              children: [
                                GestureDetector(
                                  onTap: ()async{
                                  
                                  selectedimag1 = await value.ImagePicker();
                                 // selectedimages.add(selectedimag1);
                                  
                                  },
                                  child: EditDishImageWidget(selectedimage: selectedimag1 , imageurl: widget.currentdish.image1,) 
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () async{
                                   selectedimag2 = await value.ImagePicker();
                                  // selectedimages.add(selectedimag2);
                                  },
                                  child: EditDishImageWidget(selectedimage: selectedimag2 ,  imageurl: widget.currentdish.image2)
                                   
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: ()async{
                                    selectedimag3 = await value.ImagePicker();
                                   // selectedimages.add(selectedimag3);
                                  },
                                  child: EditDishImageWidget(selectedimage: selectedimag3, imageurl: widget.currentdish.image3)
                                  
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () async{
                                    selectedimag4 = await value.ImagePicker();
                                    //selectedimages.add(selectedimag4);
                                  },
                                  child: EditDishImageWidget(selectedimage: selectedimag4 ,  imageurl: widget.currentdish.image4)
                                  
                                ),
                                const SizedBox(
                                  width: 5,
                                )
                              ],
                            );
                            }
                            
                          ),
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
                          controller: dishdescriptioncontroller,
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
                            fontWeight: FontWeight.w700
                                    ),
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
                            fontWeight: FontWeight.w700
                                    ),
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
                            fontWeight: FontWeight.w700
                                    ),
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
                                      }))
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

                      const Text(
                        'Dish Category',
                        style: TextStyle(
                            fontSize: 15,
                            color: primarycolor,
                            fontWeight: FontWeight.w700
                            ),
                      ),
                      Container(
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
                            ),

                          SizedBox(height: 10,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600
                            ),
                            ),
                          ),

                         GestureDetector(
                          onTap: () async{
                            debugPrint('add dish tapped');
                          //     if (dishnamecontroller.text.isEmpty ||
                          //     dishpricecontroller.text.isEmpty ||
                          //     dropdownvalue.isEmpty ||
                          //     dishservecontroller.text.isEmpty ||
                          //     selectedcategories.isEmpty 
                          //   //  selectedimages.isEmpty || selectedimages.length<4
                          //     ) {
                          //   return;
                          // }

                          final selectedcategoryids = selectedcategories.map((category)=> category.value).toList();

                          // for(var image in selectedimages){
                          //   selectedimagesurl!.add(await saveImageToStorage(filename: 'dishimage', selectedImageInBytes: image!));
                          // }
                          if(selectedimag1!=null){
                              selectedimag1url = await  saveImageToStorage(filename: 'dishimage1', selectedImageInBytes: selectedimag1!);
                          }
                          if(selectedimag2!=null){
                             selectedimag2url = await  saveImageToStorage(filename: 'dishimage2', selectedImageInBytes: selectedimag2!);
                          }
                          if(selectedimag3!=null){
                            selectedimag3url = await  saveImageToStorage(filename: 'dishimage3', selectedImageInBytes: selectedimag3!);
                          }
                          if(selectedimag4!=null){
                             selectedimag4url = await  saveImageToStorage(filename: 'dishimage4', selectedImageInBytes: selectedimag4!);
                          }
                        
                         
                          
                         

                         
                          DishModel dish = DishModel(
                              dishname: dishnamecontroller.text,
                              dishdescription: dishdescriptioncontroller.text,
                              dishprice: dishpricecontroller.text,
                              stock: dropdownvalue,
                              serve: dishservecontroller.text,
                              category: selectedcategoryids,
                              dishcategory: '',
                              image1: selectedimag1url ?? widget.currentdish.image1,
                              image2 :selectedimag2url ?? widget.currentdish.image2,
                              image3: selectedimag3url ?? widget.currentdish.image3,
                              image4: selectedimag4url ?? widget.currentdish.image4
                              
                              );

                              debugPrint(dish.toString());

                          BlocProvider.of<DishBloc>(context)
                              .add(DishUpdateEvent(updatedDish: dish));
                              
                              Navigator.pop(context);
                          },
                           child: Container(
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
                                      'Add Dish',
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

