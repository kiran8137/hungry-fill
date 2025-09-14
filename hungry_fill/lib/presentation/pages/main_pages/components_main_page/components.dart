
 
 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/pages/map/map_screen.dart';
import 'package:hungry_fill/presentation/pages/whishlist/whishlist_page.dart';

Widget appBarMain({required BuildContext context}) {
    return AppBar(
      leading: const SizedBox(),
      backgroundColor: Colors.white,
      
        shape:   const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50)
          )
        ),
        bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: Container(
          color:  const Color.fromARGB(189, 14, 9, 45),
          height: 1,
        ),
        ),

        title: SizedBox(
          width: 100,
          height: 100,
          child: Image.asset('assets/Hung.png')),
        //  Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     GestureDetector(
        //       onTap: (){
        //          debugPrint("tapped location");
        //           //  BlocProvider.of<AddressBloc>(context)
        //           //         .add(GetAddressEvent(position: position!));
        //         Navigator.push(context, MaterialPageRoute(builder: (context)=> const MapScreen()));
        //       },
        //       child: Text('Location',
        //       style: GoogleFonts.abhayaLibre(),
        //       ),
        //     ),
        //     Transform(
        //       alignment: FractionalOffset.center,
        //       transform: Matrix4.rotationZ(
        //                 6.1415926535897932 / 4,
        //               ),
        //       child: const ImageIcon(AssetImage("assets/next.png"),color: Colors.black,))
            
        //   ],
        // ),
        centerTitle: true,
        actions:   [
            Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: (){
                  BlocProvider.of<RestaurantBloc>(context).add(GetRestaurantsInWishList());
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WishListPage()));
              },
              child: const Icon(Icons.favorite)),
          ),
          ],
    );
  }
 