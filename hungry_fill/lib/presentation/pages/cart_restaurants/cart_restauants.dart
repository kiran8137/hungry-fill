// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
// import 'package:hungry_fill/presentation/pages/cart_page/cart_page.dart';

// class CartRestaurants extends StatefulWidget {
//   const CartRestaurants({super.key});

//   @override
//   State<CartRestaurants> createState() => _CartRestaurantsState();
// }

// class _CartRestaurantsState extends State<CartRestaurants> {
//   @override
//   void initState() {
//     BlocProvider.of<RestaurantBloc>(context).add(GetRestaurantsEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Text("Cart"),
//           centerTitle: true,
//         ),
//         backgroundColor: Colors.white,
//         body: SafeArea(
//             child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: BlocBuilder<RestaurantBloc, RestaurantState>(
//             builder: (context, state) {
//               if(state is GetRestaurantSuccessState){
                
//                  return ListView.separated(
//                   separatorBuilder: (context, index) => Divider(),
//                   itemCount: 2,
//                   itemBuilder: (context, index) {
//                     final restaurants = state.restaurants[index];
//                     return ListTile(
//                       onTap: (){
//                         Navigator.push(context, (MaterialPageRoute(builder: (context)=> CartPage(restaurantid: restaurants.userid, restaurantname: restaurants.restaurantname,))));
//                       },
//                       title: Text(restaurants.restaurantname!),
//                     );
//                   }
//                   );
//               }else{
//                 return Center(child: CircularProgressIndicator(),);
//               }
             
//             } 
//           ),
//         )));
//   }
// }
