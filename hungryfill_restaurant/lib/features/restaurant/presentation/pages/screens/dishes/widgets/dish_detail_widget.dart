import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/edit_dish_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/dish/dish_bloc.dart';

class DishDetailWidget extends StatelessWidget {
  const DishDetailWidget({
    super.key,
    required this.dishes,
  });

  final DishModel dishes;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: [
            const SizedBox(width: 10),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(
                          255,
                          239,
                          239,
                          239),
                  borderRadius:
                      BorderRadius.circular(
                          5),
                  image: DecorationImage(
                      image: NetworkImage(
                          dishes.image1!),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 80,
              child: Text(
                "${dishes.dishname}",
                style: const TextStyle(
                    fontWeight:
                        FontWeight.w700),
              ),
            ),
            const SizedBox(width: 165),
            SizedBox(
              width: 150,
              child: Text(
                "₹${dishes.dishprice}",
                style: const TextStyle(
                    fontWeight:
                        FontWeight.w500,
                    color: Color.fromARGB(
                        255,
                        102,
                        102,
                        102)),
              ),
            ),
            const SizedBox(width: 80),
            Text(
              dishes.serve!,
              style: const TextStyle(
                  fontWeight:
                      FontWeight.w500,
                  color: Color.fromARGB(
                      255, 102, 102, 102)),
            ),
            const SizedBox(width: 215),
            Text(
              dishes.stock!,
              style: const TextStyle(
                  fontWeight:
                      FontWeight.w500,
                  color: Color.fromARGB(
                      255, 102, 102, 102)),
            ),
    
            SizedBox(width: 300),
    
            GestureDetector(
                onTap: () {
                  DishModel dish = DishModel(
                      dishid: dishes.dishid,
                      dishname:
                          dishes.dishname,
                      dishdescription: dishes
                          .dishdescription,
                      dishprice:
                          dishes.dishprice,
                      serve: dishes.serve,
                      stock: dishes.stock,
                      category:
                          dishes.category,
                      image1: dishes.image1,
                      image2: dishes.image2,
                      image3: dishes.image3,
                      image4: dishes.image4
                          );
    
                  showDialog(
                      barrierDismissible:
                          false,
                      context: context,
                      builder: (context) {
                        return   EditDish(currentdish: dish);
                      });
                },
                child:
                    const Icon(Icons.edit)),
    
            SizedBox(width: 50),
    
            GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              "Are you sure want to delete"),
                          actions: [
                            TextButton(
                                onPressed:
                                    () {
                                  Navigator.pop(
                                      context);
                                },
                                child: const Text(
                                    "cancel")),
                            TextButton(
                                onPressed:
                                    () {
                                  BlocProvider.of<DishBloc>(
                                          context)
                                      .add(DeleteDishEvent(
                                          dishid: dishes.dishid));
                                  Navigator.pop(
                                      context);
                                  // BlocProvider.of<DishBloc>(context)
                                  //     .add(GetDishesEvent());
                                },
                                child:
                                    const Text(
                                        "Ok"))
                          ],
                        );
                      });
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
            // const SizedBox(width: 150),
          ],
        ));
  }
}
