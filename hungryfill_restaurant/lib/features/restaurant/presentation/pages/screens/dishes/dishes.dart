import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/daily_order/components/daily_order_component.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/components/dishes_component.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/responsive_views/components.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/add_dish_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/dish_detail_mobile_widget.dart';

import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/dish_detail_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/widgets/components.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/category/category_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/dish_category/dish_category_bloc.dart';
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

  TextEditingController searchController = TextEditingController();
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
      body: Consumer<DishProvider>(
        builder: (context, value, child) => Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child:
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return  dishListBar(context: context, controller: searchController , maxWidth: constraints.maxWidth);
                    },
                    ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double maxWidth = constraints.maxWidth;
                  if (maxWidth > 600) {
                    return dishListWebView(value, tablecontents);
                  } else {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 34,
                                width: 150,
                                //color: Colors.red,
                                child: TextFormField(
                                  controller: searchController,
                                  style: const TextStyle(height: 1.3),
                                  decoration: InputDecoration(
                                      hintText: 'Search Restaurants',
                                      hintStyle: const TextStyle(fontSize: 11),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  onChanged: (String query) {
                                    //Provider.of<DishProvider>(context ,listen: false).searchDishes(query: query);
                                    context
                                        .read<DishProvider>()
                                        .searchDishes(query: query);
                                  },
                                ),
                              ),
                              const Icon(
                                Icons.search,
                                size: 30,
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<CategoryBloc>(context)
                                      .add(GetCategoriesEvent());

                                  BlocProvider.of<DishCategoryBloc>(context)
                                      .add(GetDishCategoriesEvent());
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return const AddDish();
                                      });
                                },
                                child: Container(
                                  height: 34,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: primarycolor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      Text(
                                        'Dish',
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10),

                        dishListMobileView(value),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
