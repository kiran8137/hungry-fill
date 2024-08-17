// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hungryfill_restaurant/core/funcitons/dish_funcitons.dart';
 
// import 'package:hungryfill_restaurant/core/theme/color.dart';
// import 'package:hungryfill_restaurant/features/restaurant/data/model/category/category_model.dart';
// import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';
// import 'package:hungryfill_restaurant/features/restaurant/data/repository/dishrepo_implement/dish_repo_impl.dart';
// import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/category/category_bloc.dart';
// import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/dish/dish_bloc.dart';
// import 'package:multi_dropdown/multiselect_dropdown.dart';
 

// class DishAddDialog extends StatefulWidget {
//   DishAddDialog({super.key});

//   @override
//   State<DishAddDialog> createState() => _DishAddDialogState();
// }

// class _DishAddDialogState extends State<DishAddDialog> {
//   final TextEditingController dishnamecontroller = TextEditingController();

//   final TextEditingController dishpricecontroller = TextEditingController();

//   final TextEditingController dishstockcontroller = TextEditingController();

//   final TextEditingController dishservecontroller = TextEditingController();

//   final TextEditingController dishcategorycontroller = TextEditingController();

//   final MultiSelectController mulitselectorcontoller = MultiSelectController();

//   List<ValueItem<String>>  selectedcategories = [];

//   List<CategoryModel> categories = [];

//   final List<bool> isSelected = [false, false];

//     Uint8List? selectedimage;
//     String? filename;



//   var stockitems = [     
//      'IN',
//      'OUT'
//   ]; 

//   var dropdownvalue = 'IN';

//   // List<ValueItem> getCategoryValueItems() {
//   @override
//   Widget build(BuildContext context) {
//   //  List<ValueItem<dynamic>> selecteditems = [];
    
//     return Dialog(
//       child: Container(
//         height: 550,
//         width: 1000,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white,
//             border: Border.all(color: Colors.black, width: 1)),
//         child: Stack(
//           children: [
//             Positioned(
//                 bottom: 10,
//                 child: SizedBox(
//                   width: 1000,
//                   height: 40,
//                   //color: Colors.red,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       GestureDetector(
//                         onTap: () async{
//                           if (dishnamecontroller.text.isEmpty ||
//                               dishpricecontroller.text.isEmpty ||
//                               dropdownvalue.isEmpty ||
//                               dishservecontroller.text.isEmpty ||
//                               selectedcategories.isEmpty) {
//                             return;
//                           }

//                           final selectedcategoryids = selectedcategories.map((category)=> category.value).toList();

//                           String imageurl = await  saveImageToStorage(filename: filename!, selectedImageInBytes: selectedimage!);
                         
//                           DishModel dish = DishModel(
//                               dishname: dishnamecontroller.text,
//                               dishprice: dishpricecontroller.text,
//                               stock: dropdownvalue,
//                               serve: dishservecontroller.text,
//                               category: selectedcategoryids,
//                               imageurl: imageurl
//                              // imageurl: selectedimage
//                               );
//                           BlocProvider.of<DishBloc>(context)
//                               .add(DishAddEvent(dishmodel: dish));
                         
                       
//                           Navigator.pop(context);
//                         },
//                         child: Container(
//                           width: 470,
//                           decoration: BoxDecoration(
//                               color: primarycolor,
//                               borderRadius: BorderRadius.circular(10),
//                               boxShadow: const [
//                                 BoxShadow(
//                                     color: Colors.grey,
//                                     spreadRadius: -10,
//                                     blurRadius: 9,
//                                     offset: Offset(4, 20))
//                               ]),
//                           child: Center(
//                             child: Text(
//                               "Add Item",
//                               style: GoogleFonts.inriaSans(
//                                   fontSize: 30, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Container(
//                           width: 470,
//                           decoration: BoxDecoration(
//                               color: const Color.fromARGB(255, 238, 237, 237),
//                               borderRadius: BorderRadius.circular(10),
//                               boxShadow: const [
//                                 BoxShadow(
//                                     color: Colors.black,
//                                     spreadRadius: -10,
//                                     blurRadius: 9,
//                                     offset: Offset(7, 10))
//                               ]),
//                           child: Center(
//                             child: Text(
//                               "Cancel",
//                               style: GoogleFonts.inriaSans(
//                                   fontSize: 30, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )),
//             Positioned(
//                 top: 40,
//                 left: 20,
//                 child: GestureDetector(
//                   onTap: () async{
//                    BlocProvider.of<DishBloc>(context).add(DishImagePicker());
//                     // selectedimage = await pickImag();
                  
//                   },
//                   child:
                   
                     
//                    BlocConsumer<DishBloc, DishState>(
//                     listener: (context, state) {
                       
//                     },
//                     builder: (context, state) {
//                       if (state is DishImagPickerLoaded) {
 
//                         selectedimage = state.file!.files.first.bytes;
//                         filename = state.file!.files.first.name;
//                      // selectedimage = state.file.;
//                         return    Container(
//                           height: 120,
//                           width: 180,
//                           decoration: BoxDecoration(
//                               color: Colors.grey,
//                               borderRadius: BorderRadius.circular(10),
//                               ),
//                               child:  Image.memory(selectedimage!,
//                               fit: BoxFit.fill,
//                               ),
//                         );
                 
//                       } else{
//                       return Container(
//                           height: 120,
//                           width: 180,
//                           decoration: BoxDecoration(
//                               color: Colors.grey,
//                               borderRadius: BorderRadius.circular(10),
//                               ),
                               
//                         );
//                     }
                       
                       
//                     }
//                   ),
//                 )
//                 ),
//             Positioned(
//                 left: 230,
//                 top: 90,
//                 child: SizedBox(
//                   height: 320,
//                   width: 150,
//                   // color: Colors.red,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text(
//                         "Dish Name",
//                         style: GoogleFonts.inter(
//                             fontWeight: FontWeight.bold, fontSize: 15),
//                       ),
//                       Text(
//                         "Price",
//                         style: GoogleFonts.inter(
//                             fontWeight: FontWeight.bold, fontSize: 15),
//                       ),
//                       Text(
//                         "Categories",
//                         style: GoogleFonts.inter(
//                             fontWeight: FontWeight.bold, fontSize: 15),
//                       ),
//                       Text(
//                         "Stock",
//                         style: GoogleFonts.inter(
//                             fontWeight: FontWeight.bold, fontSize: 15),
//                       ),
//                       Text(
//                         "Serves",
//                         style: GoogleFonts.inter(
//                             fontWeight: FontWeight.bold, fontSize: 15),
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                     ],
//                   ),
//                 )),
//             Positioned(
//                 left: 400,
//                 top: 90,
//                 child: SizedBox(
//                   height: 300,
//                   width: 400,
//                   //color: Colors.red,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       SizedBox(
//                         height: 37,
//                         width: double.infinity,
//                         //color: Colors.black,
//                         child: TextFormField(
//                           controller: dishnamecontroller,
//                           decoration: const InputDecoration(
//                               border: OutlineInputBorder()),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       SizedBox(
//                         height: 37,
//                         width: 150,
//                         child: TextFormField(
//                           controller: dishpricecontroller,
//                           decoration: const InputDecoration(
//                               border: OutlineInputBorder()),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       BlocBuilder<CategoryBloc, CategoryState>(

//                         builder: (context, state) {
//                           debugPrint(state.runtimeType.toString());
//                           if(state is CategorySuccessEvent){
//                             categories = state.categories;

//                             return MultiSelectDropDown(
                             
//                               options: categories.map((category)=> ValueItem(label: category.categoryname! , value: category.categoryid )).toList(),
//                               onOptionSelected: (selectedvalues){
//                                 setState(() {
//                                   selectedcategories = selectedvalues;
//                                 });
//                               }, 
//                               );
//                           }else{
//                             return const Center(child: CircularProgressIndicator(),);
//                           }
                          
                          
//                         },
                        
//                       ),
//                       const SizedBox(
//                         height: 22,
//                       ),
//                       SizedBox(
//                         height: 37,
//                         width: 100,
//                         child: DropdownButton(
//                           value: dropdownvalue,
//                           items: stockitems.map((item){
//                             return DropdownMenuItem(
//                               value: item,
//                               child: Text(item),
//                               );
//                           }).toList(),
//                           onChanged: ( newvalue){
//                             setState(() {
//                               dropdownvalue = newvalue!;
//                             });
//                           }
//                           )
                        
//                       ),
//                       const SizedBox(
//                         height: 25,
//                       ),
//                       SizedBox(
//                         height: 37,
//                         width: 100,
//                         child: TextFormField(
//                           controller: dishservecontroller,
//                           decoration: const InputDecoration(
//                               border: OutlineInputBorder()),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                     ],
//                   ),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
