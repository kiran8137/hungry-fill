import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/dish/dish_bloc.dart';
 

class DishAddDialog extends StatelessWidget {
  DishAddDialog({super.key});

  final TextEditingController dishnamecontroller = TextEditingController();
  final TextEditingController dishpricecontroller = TextEditingController();
  final TextEditingController dishstockcontroller = TextEditingController();
  final TextEditingController dishservecontroller = TextEditingController();
  final TextEditingController dishcategorycontroller = TextEditingController();

  List<bool> isSelected = [false, false];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 550,
        width: 1000,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
                          if (dishnamecontroller.text.isEmpty ||
                              dishpricecontroller.text.isEmpty ||
                              dishstockcontroller.text.isEmpty ||
                              dishservecontroller.text.isEmpty ||
                              dishcategorycontroller.text.isEmpty) {
                            return;
                          }
                          DishModel dish = DishModel(
                              dishname: dishnamecontroller.text,
                              dishprice: dishpricecontroller.text,
                              stock: dishstockcontroller.text,
                              serve: dishservecontroller.text,
                              category: dishcategorycontroller.text);
                          BlocProvider.of<DishBloc>(context)
                              .add(DishAddEvent(dishmodel: dish));
                          BlocProvider.of<DishBloc>(context)
                              .add(GetDishesEvent());
                          Navigator.pop(context);
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
                              "Add Item",
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
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<DishBloc>(context).add(DishImagePicker());
                  },
                  child: BlocConsumer<DishBloc, DishState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {

                      if(state is DishImagPickerLoaded){
                        return Container(
                        height: 120,
                        width: 180,
                        decoration: BoxDecoration(
                           // color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)
                            ),

                             child: Image.memory(state.file!.bytes!),
                      );
                      }else{
                        return Container(
                           height: 120,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)
                            ),
                        );
                      }
                      
                    },
                  ),
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
                      SizedBox(
                        height: 37,
                        width: 120,
                        child: 
                        TextFormField(
                          controller: dishcategorycontroller,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        ),

                        // ToggleButtons(
                        //   isSelected: isSelected,
                        //   children: const [
                        //      Text("Veg"),
                        //     Text("NonVeg")
                        //   ],
                        //   onPressed: (int index){
                        //     isSelected[index] = !isSelected[index];
                        //   },
                        //    color: primarycolor,
                        //   selectedColor: Colors.red
                        //   )
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
