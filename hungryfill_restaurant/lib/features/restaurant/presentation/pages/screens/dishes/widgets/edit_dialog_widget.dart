import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/categories.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/category/category_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/category/category_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/dish/dish_bloc.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class DishEditWidget extends StatefulWidget {
   const DishEditWidget({super.key, required this.dish , });

   final DishModel dish ;

  @override
  State<DishEditWidget> createState() => _DishEditWidgetState();
}

class _DishEditWidgetState extends State<DishEditWidget> {
   late TextEditingController dishnamecontroller;

  late  TextEditingController dishpricecontroller;

   late  TextEditingController dishstockcontroller;

  late   TextEditingController dishservecontroller;

   late TextEditingController dishcategorycontroller;

  late MultiSelectController categorycontroller;


  List<ValueItem<String>>  selectedcategories = [];

  List<CategoryModel> categories = [];

    @override
  void initState() {
  dishnamecontroller = TextEditingController(text: widget.dish.dishname);

  dishpricecontroller =  TextEditingController(text: widget.dish.dishprice);

  dishstockcontroller =  TextEditingController(text: widget.dish.stock);

  dishservecontroller = TextEditingController(text: widget.dish.serve);

  categorycontroller =  MultiSelectController();
 // dishcategorycontroller = TextEditingController(text: widget.dish.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Dialog(
      child: Container(
        height: 550,
        width: 1000,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 1)),
        child: Stack(
          children: [
            Positioned(
                bottom: 10,
                child: SizedBox(
                  width: 1000,
                  height: 40,
                  //color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {

                            DishModel? dish = DishModel(
                              dishid: widget.dish.dishid,
                              dishname: dishnamecontroller.text,
                              dishprice: dishpricecontroller.text,
                              stock: dishstockcontroller.text,
                              serve: dishservecontroller.text,
                              category: []
                            );

                            BlocProvider.of<DishBloc>(context).add(DishUpdateEvent(updatedDish: dish));
                         //   BlocProvider.of<DishBloc>(context).add(GetDishesEvent());
                            Navigator.pop(context);

                          // if (dishnamecontroller.text.isEmpty ||
                          //     dishpricecontroller.text.isEmpty ||
                          //     dishstockcontroller.text.isEmpty ||
                          //     dishservecontroller.text.isEmpty ||
                          //     dishcategorycontroller.text.isEmpty){
                          //       return ;
                          //     }
                          //   DishModel dish = DishModel(
                          //       dishname: dishnamecontroller.text,
                          //       dishprice: dishpricecontroller.text,
                          //       stock: dishstockcontroller.text,
                          //       serve: dishservecontroller.text,
                          //       category: dishcategorycontroller.text);
                          // BlocProvider.of<DishBloc>(context)
                          //     .add(DishAddEvent(dishmodel: dish));
                          //     BlocProvider.of<DishBloc>(context).add(GetDishesEvent());
                          // Navigator.pop(context);
                        },
                        child: Container(
                          width: 470,
                          decoration: BoxDecoration(
                              color: primarycolor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: -10,
                                    blurRadius: 9,
                                    offset: Offset(4, 20))
                              ]),
                          child: Center(
                            child: Text(
                              "Update",
                              style: GoogleFonts.inriaSans(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 470,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 238, 237, 237),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: -10,
                                    blurRadius: 9,
                                    offset: Offset(7, 10))
                              ]),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.inriaSans(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Positioned(
                top: 40,
                left: 20,
                child: Container(
                  height: 120,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                )),
            Positioned(
                left: 230,
                top: 90,
                child: SizedBox(
                  height: 320,
                  width: 150,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Dish Name",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "Price",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "Categories",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "Stock",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "Serves",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                )),
            Positioned(
                left: 400,
                top: 90,
                child: SizedBox(
                  height: 300,
                  width: 400,
                  //color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 37,
                        width: double.infinity,
                        //color: Colors.black,
                        child: TextFormField(
                          controller: dishnamecontroller,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 37,
                        width: 150,
                        child: TextFormField(
                          controller: dishpricecontroller,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                       BlocBuilder<CategoryBloc, CategoryState>(
                        builder: (context, state) {
                          if(state is CategorySuccessEvent){
                            categories = state.categories;

                            return MultiSelectDropDown(
                             
                              options: categories.map((category)=> ValueItem(label: category.categoryname! , value: category.categoryid )).toList(),
                              onOptionSelected: (selectedvalues){
                                setState(() {
                                  selectedcategories = selectedvalues;
                                });
                              }, 
                              );
                          }else{
                            return Center(child: CircularProgressIndicator(),);
                          }
                          
                          
                        },
                        
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      SizedBox(
                        height: 37,
                        width: 100,
                        child: TextFormField(
                          controller: dishstockcontroller,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 37,
                        width: 100,
                        child: TextFormField(
                          controller: dishservecontroller,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}