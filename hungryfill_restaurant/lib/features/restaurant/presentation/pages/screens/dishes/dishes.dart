import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/add_dialog_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/add_dish_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/category/category_bloc.dart';
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
     Provider.of<DishProvider>(context ,listen: false).getDishes();
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  Text(
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
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dishes List',
                      style: GoogleFonts.roboto(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 34,
                          width: 250,
                          //color: Colors.red,
                          child: TextFormField(
                            style: const TextStyle(height: 1.3),
                            decoration: InputDecoration(
                                hintText: 'Search Restaurants',
                                hintStyle: const TextStyle(fontSize: 11),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
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
                          onTap: (){
                             BlocProvider.of<CategoryBloc>(context).add(GetCategoriesEvent());
                            showDialog(
                              context: context, 
                              builder:(context){
                                return const AddDish();
                              }
                              );
                            
                          },
                           child: Container(
                              height: 34,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: primarycolor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                        fontSize: 15
                                        ),
                                  )
                                ],
                              ),
                            ),
                         ),
                       
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
                            topRight: Radius.circular(10))),
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
                            child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 160),
                                scrollDirection: Axis.horizontal,
                                itemCount: tablecontents.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Container(
                                          height: 30,
                                          child: Center(
                                            child: Text(
                                              tablecontents[index],
                                              style: GoogleFonts.roboto(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color.fromARGB(
                                                      255, 140, 140, 140)),
                                            ),
                                          )),
                                      const Icon(
                                        Icons.keyboard_arrow_down,
                                        color:
                                            Color.fromARGB(255, 140, 140, 140),
                                      )
                                    ],
                                  );
                                }),
                          ),
                        ),

                        const Divider(),

                        //  ListView.separated(
                        //   scrollDirection: Axis.horizontal,
                        //   itemBuilder: (context,index){

                        //   },
                        //   separatorBuilder: (context , index)=> const Divider(),
                        //   itemCount: 5
                        //   )
                        Consumer<DishProvider>(
                          builder: (BuildContext context, DishProvider value, Widget? child)=>
                          
                           Container(
                            height: 450,
                            width: double.infinity,
                            //width: 1000,
                            //color: Colors.green,
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                   final dishes = value.dishes[index];
                                  return Container(
                                      height: 50,
                                      width: double.infinity,
                                      color: Colors.white,
                                      child:  Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color:const Color.fromARGB(255, 239, 239, 239),
                                              borderRadius: BorderRadius.circular(5),
                                              image: DecorationImage(
                                                image: NetworkImage(dishes.imageurl!),
                                                fit: BoxFit.cover
                                                )
                                            ),

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
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(255, 102, 102, 102)
                                                 ),
                                                ),
                                          ),
                                          const SizedBox(width: 80),
                                            Text(
                                               dishes.serve!,
                                               style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(255, 102, 102, 102)
                                                 ),
                                              ),
                                          const SizedBox(width: 215),
                                            Text(
                                            dishes.stock!,
                                            style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(255, 102, 102, 102)
                                                 ),
                                            ),
                                          // const SizedBox(width: 150),
                                        ],
                                      )
                                      );
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
    //  Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //      // HeaderWidget(),
    //      //const Divider(),
    //     const SizedBox(
    //       height: 25,
    //     ),
    
    //     Row(
           
    //       children: [
    //         const SizedBox(
    //           width: 20,
    //         ),
    //         Text(
    //           "DISHES",
    //           style: GoogleFonts.inriaSans(
    //               fontWeight: FontWeight.bold, fontSize: 30),
    //         ),
    
    //         const SizedBox(width: 1050,),
    //         GestureDetector(
    //           onTap: (){
    //               BlocProvider.of<CategoryBloc>(context)
    //                           .add(GetCategoriesEvent());
    //             showDialog(
    //               barrierDismissible: false,
    //               context: context, 
    //               builder: (context){
    //                 return   DishAddDialog();
    //               }
    //               );
    //           },
    //           child: Container(
    //               height: 40,
    //               width: 95,
    //               decoration: BoxDecoration(
    //                 color: primarycolor,
    //                 borderRadius: BorderRadius.circular(12),
    //               ),
    //               child: Center(
    //                 child: Text(
    //                   "ADD",
    //                   style: GoogleFonts.inriaSans(
    //                       fontSize: 30, fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //             ),
    //         ),
    //       ],
    //     ),
    //     //  SizedBox(height: 45,),
    
    //     Padding(
    //       padding: const EdgeInsets.all(15.0),
    //       child: Row(
    //         children: [
    //           Container(
                
    //             height: 45,
    //             width: 400,
    //             decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(12),
    //                 border: Border.all()
                    
    //                 ),
    //                 child: TextFormField(
    //                   decoration: const InputDecoration(
    //                     border: InputBorder.none
    //                   ),                   ),
    //           ),
    //           const SizedBox(width: 15),
    //           Container(
    //             height: 45,
    //             width: 190,
    //             decoration: BoxDecoration(
    //               color: primarycolor,
    //               borderRadius: BorderRadius.circular(12),
    //             ),
    //             child: Center(
    //               child: GestureDetector(
    //                 onTap: (){
    //                   // getcat();
    //                 },
    //                 child: Text(
    //                   "search",
    //                   style: GoogleFonts.inriaSans(
    //                       fontSize: 35, fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     // SizedBox(height: 45,),
    //     const Padding(
    //       padding: EdgeInsets.all(10.0),
    //       child: DishHeader(),
    //     ),

    //     const Divider(),
       

    //     Consumer<DishProvider>(
    //       builder: (BuildContext context, DishProvider value, Widget? child)=>
          
    //         SizedBox(
    //                width: 1280,
    //                height: 435,
    //               child: SingleChildScrollView(
    //                 child: SizedBox(
    //                    width: 1280,
    //                  height: 600,
    //                   child: ListView.separated(
    //                     separatorBuilder: (context , index)=> const Divider(),
                         
    //                     itemCount: value.dishes.length,
    //                     itemBuilder: (context , index){
    //                       final dish = value.dishes[index];
    //                       return Padding(
    //                         padding: const EdgeInsets.all(10.0),
    //                         child: DishDetailWidget(dish: dish, index: index, ),
    //                       );
    //                     }
    //                     ),
    //                 ),
    //               ),
    //             ),
    //     )



    //   ],
    // );
  }
}

 