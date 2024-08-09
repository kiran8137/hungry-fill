 

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:hungry_fill/core/color/colors.dart';
// import 'package:hungry_fill/core/constants/constant.dart';
// import 'package:hungry_fill/data/model/cart_model/cart_model.dart';
// import 'package:hungry_fill/data/model/dish_model/dish_model.dart';
// import 'package:hungry_fill/data/repository/cart_repo_imp/cart_repo_impl.dart';
// import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
// import 'package:hungry_fill/presentation/pages/cart_page/widgets/bill_details_widgets.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({super.key, this.restaurantid, this.restaurantname});

//   final String? restaurantid;
//   final String? restaurantname;

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {

//   late List<String> dishids = [];
//   late DishModel cartdish;
//   @override
//   void initState() {
//     BlocProvider.of<DishBloc>(context)
//         .add(GetDishInCartEvent(restaurantid: widget.restaurantid));
         
        
        
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
                
//               },
//               child: const Icon(Icons.arrow_back_ios_new)),
//           backgroundColor: Colors.white,
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
//           bottom: PreferredSize(
//             preferredSize: const Size.fromHeight(4),
//             child: Container(
//               color: const Color.fromARGB(255, 188, 188, 188),
//               height: 1,
//             ),
//           ),
//           title: Column(
//             children: [
//               Text(
//                 'Your Cart',
//                 style: GoogleFonts.abhayaLibre(),
//               ),
//               Text(
//                 widget.restaurantname!,
//                 style:
//                     GoogleFonts.acme(fontSize: 16, fontWeight: FontWeight.w400),
//               ),
//             ],
//           ),
//           centerTitle: true,
//         ),
//         backgroundColor: Colors.white,
//         floatingActionButton: GestureDetector(
//           onTap: (){
//             //carttotal(dishids: dishids);
             
//           },
//           child: Container(
//               width: 250,
//               height: 60,
//               decoration: BoxDecoration(
//                   color: primarycolor, borderRadius: BorderRadius.circular(25)),
//               child: Center(
//                 child: Text(
//                   "Procced to Check out",
//                   style: GoogleFonts.breeSerif(color: Colors.white, fontSize: 20),
//                 ),
//               ),
//               ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               children: [
//                 SizedBox(
//                 height: 300,
//                 width: double.infinity,
                
//                   child: BlocBuilder<DishBloc, DishState>(
//                     builder: (context, state) {
//                       print('${state.runtimeType}');
//                       if(state is GetDishInCartInital){
//                         return const Center(child: CircularProgressIndicator(strokeWidth: 5),);
//                       }
                  
//                       if(state is GetDishInCartErrorState){
//                         return const Text('some thing went wrong');
//                       }
                  
//                       if(state is GetDishInCartSuccessState){
//                         for(var i in state.cartdishes){
//                           dishids.add(i.dishid!);
//                         }
//                         return SingleChildScrollView(
//                           child: ListView.separated(
                             
//                             separatorBuilder: (context, index) => const Divider(),
//                             physics: const NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             itemCount: state.cartdishes.length,
//                             itemBuilder: (context, index) {
                            
//                               cartdish = state.cartdishes[index];
//                               return Container(
//                                 height: 100,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                     color: const Color.fromARGB(155, 248, 248, 248),
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       width: 70,
//                                       height: 70,
//                                       decoration: BoxDecoration(
//                                           color: Colors.green,
//                                           borderRadius: BorderRadius.circular(10)),
//                                     ),
//                                     const SizedBox(
//                                       width: 5,
//                                     ),
//                                     Container(
//                                       width: 90,
//                                       child: Text(
//                                          cartdish.dishname!,
//                                         maxLines: 2,
//                                         style: GoogleFonts.roboto(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                                     Container(
//                                       height: 40,
//                                       width: 100,
//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           border: Border.all(color: primarycolor),
//                                           borderRadius: BorderRadius.circular(8)),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           const Icon(
//                                             Icons.add,
//                                             size: 20,
//                                             color: primarycolor,
//                                           ),
//                                           Text(
//                                             "1",
//                                             style: GoogleFonts.abhayaLibre(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           const Icon(
//                                             Icons.remove,
//                                             size: 20,
//                                             color: primarycolor,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 15,
//                                     ),
//                                     Expanded(
//                                         child: Text(
//                                       cartdish.dishprice!,
//                                       style: GoogleFonts.aBeeZee(fontSize: 15),
//                                     ))
//                                   ],
//                                 ),
//                               );
//                             }),
//                         );
//                       }
//                       else{
//                         return const Center(child:   Text("cart is empty"));
//                       }
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Divider(
//                   color: Color.fromARGB(255, 245, 245, 245),
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 const BillDetailswidget(
//                   detail: "Item total",
//                   amount: "200",
//                 ),
//                 const SizedBox(height: 15),
//                 const BillDetailswidget(
//                     detail: "packaging charges", amount: "10"),
//                 const SizedBox(height: 15),
//                 const BillDetailswidget(
//                   detail: "delivery charges",
//                   amount: "30",
//                 ),
//                 const SizedBox(height: 50),
//                 const BillDetailswidget(
//                   detail: "Total Amount",
//                   amount: "240",
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
