import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/dish/dish_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/dish_header.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/edit_dialog_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/dish/dish_bloc.dart';

class DishDetailWidget extends StatelessWidget {
   const  DishDetailWidget({
    super.key, required this.dish, required this.index
  });

 final DishModel dish;
 final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1280,
      //height: 200,
      // color: Colors.green,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
            
          // const SizedBox(
          //   height: 10,
          // ),
          SizedBox(
            height: 150,
            width: double.infinity,
          //  color: Colors.green,
            child: Column(
              children: [
                const SizedBox(height: 10,),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 25),
                    Text(
                       "${index!+1}",
                      style: GoogleFonts.inter(fontSize: 18),
                    ),
                    const SizedBox(width: 235),
                     Column(
                       children: [
                         Container(
                          height: 100,
                          width: 160,
                         
                          decoration: BoxDecoration(
                             color: Colors.grey,
                             borderRadius: BorderRadius.circular(10)
                          ),
                         ),
                         const SizedBox(height: 5,),
                         Text(dish.dishname!,
                          style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w500)
                         )
                       ],
                     ),
                    const SizedBox(width: 130),
                    Container(
                      
                      width: 60,
                      child: Center(
                        child: Text(
                          dish.dishprice!,
                          style: GoogleFonts.inter(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 145),
                    Container(
                        
                      width: 60,
                      child: Center(
                        child: Text(
                          dish.serve!,
                          style: GoogleFonts.inter(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 170),
                    Container(
                       
                      width: 60,
                      child: Center(
                        child: Text(
                          dish.stock!,
                          style: GoogleFonts.inter(fontSize: 18),
                        ),
                      ),
                    ),
    
                  SizedBox(width: 60,),
    
                   GestureDetector(
                    onTap: (){
                      showDialog(
                  barrierDismissible: false,
                  context: context, 
                  builder: (context){
                     
                    return   DishEditWidget(
                      dish: DishModel(
                        dishid: dish.dishid,
                        dishname: dish.dishname,
                        dishprice: dish.dishprice,
                        stock: dish.stock,
                        serve: dish.serve,
                        category: dish.category,

                      ),
                    );
                  }
                  );
                    },
                     child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              
                              //color: Colors.green,
                              image: DecorationImage(
                                  image: AssetImage("assets/pencil (1).png"),
                                  fit: BoxFit.contain)),
                     ),
                   ),
                     const SizedBox(width: 80,),
                   GestureDetector(
                    onTap: (){
                      showDialog(
                        context: context, 
                        builder:(context){
                        return  AlertDialog(
                          title: const Text("Are you sure want to delete"),
                            actions: [
                              TextButton(
                                onPressed: (){}, 
                                child: const Text("cancel")
                                ),
                                 TextButton(
                                onPressed: (){
                                  BlocProvider.of<DishBloc>(context).add(DeleteDishEvent(dishid:  dish.dishid));
                                  Navigator.pop(context);
                                  BlocProvider.of<DishBloc>(context).add(GetDishesEvent());
                                }, 
                                child: const Text("Ok")
                                )
                            ],
                          );
                        }
                        );
                    },
                     child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              
                              //color: Colors.green,
                              image: DecorationImage(
                                  image: AssetImage("assets/delete.png"),
                                  fit: BoxFit.contain)),
                     ),
                   )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
