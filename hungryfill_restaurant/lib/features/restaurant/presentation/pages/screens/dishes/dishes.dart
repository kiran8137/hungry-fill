import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/components/dishes_component.dart';

import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/dish_detail_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/widgets/components.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/provider/dish_provider.dart';
import 'package:provider/provider.dart';

class DishScreen extends StatefulWidget {
  const DishScreen({super.key, this.index});

  final int? index;

  @override
  State<DishScreen> createState() => _DishScreenState();
}

class _DishScreenState extends State<DishScreen> {
  // @override
  // void initState() {
  //   BlocProvider.of<DishBloc>(context).add(GetDishesEvent());
  //   super.initState();
  // }

  final tablecontents = [
    "         "
    "Dish Name",
    "Price",
    "Serves",
    "Stock"
  ];
  @override
  Widget build(BuildContext context) {
    Provider.of<DishProvider>(context, listen: false).getDishes();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Dishes',
          style: GoogleFonts.radioCanada(
              fontSize: 28, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
           
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: dishListBar(context),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                        )
                        ),
                // width: 1000,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 30,
                        width: 1000,
                        // color: Colors.blue,
                        child: dishDetailTable(tablecontents),
                      ),
                    ),

                    const Divider(),

                   
                    Consumer<DishProvider>(
                      builder: (BuildContext context, DishProvider value,
                              Widget? child) =>
                          value.dishes.isEmpty
                              ? Center(
                                  child: Text(
                                  "No dishes added....!",
                                  style: GoogleFonts.adamina(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ))
                              : Container(
                                  height: 450,
                                  width: double.infinity,
                                  //width: 1000,
                                  //color: Colors.green,
                                  child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        final dishes = value.dishes[index];
                                        return DishDetailWidget(dishes: dishes);
                                      },
                                      separatorBuilder: (context, index) =>
                                          const Divider(),
                                      itemCount: value.dishes.length
                                      ),
                                ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
     
  }
}

