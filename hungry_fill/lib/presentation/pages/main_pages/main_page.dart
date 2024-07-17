
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/data/user_model/user_model.dart';
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/bloc/user_bloc/users_bloc.dart';
import 'package:hungry_fill/presentation/pages/main_pages/home_page/home_page.dart';
import 'package:hungry_fill/presentation/pages/main_pages/recent_orders/recent_order.dart';
import 'package:hungry_fill/presentation/pages/main_pages/reciepe_page/reciepe.dart';
import 'package:hungry_fill/presentation/pages/main_pages/user_profile/user_profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {

  final icons = const [
    ImageIcon(AssetImage("assets/home.png"),color: Colors.white,),
    ImageIcon(AssetImage("assets/recipe-book.png"),color: Colors.white,),
     
    ImageIcon(AssetImage("assets/smartphone.png"),color: Colors.white,),
     
    ImageIcon(AssetImage("assets/person.png"),color: Colors.white,)
  ];
  int currentpageindex = 0;
   
UserModel? currentuserinfo;


  @override
  void initState() {
    
    BlocProvider.of<UsersBloc>(context).add(UserGetEvent());
    BlocProvider.of<RestaurantBloc>(context).add(GetRestaurantsEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Location',
              style: GoogleFonts.abhayaLibre(),
              ),
              Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.rotationZ(
                          6.1415926535897932 / 4,
                        ),
                child: const ImageIcon(AssetImage("assets/next.png"),color: Colors.black,))
              
            ],
          ),
          centerTitle: true,
      ),

      

      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        items: icons,
        index: currentpageindex,
        animationDuration: const Duration(milliseconds: 200),
         backgroundColor: Colors.white,
        color: primarycolor,
         onTap: (currentindex){
          setState(() {
            currentpageindex = currentindex;
          });
         },
        ),

        body:  BlocBuilder<UsersBloc , UsersState>(
          builder:(context,state){

            if(state is UserLoadedState){
                currentuserinfo = state.userdetails;
              
            }

            return   getSelectedScreen(index : currentpageindex , currentuserinfo: currentuserinfo);
          }
          )
        
       
        
    );
  }
}


Widget getSelectedScreen({required int index ,  UserModel? currentuserinfo}){
  Widget widget;

  switch(index){
    case 0 :
     widget =   HomeScreen();
     break;
     case 1:
     widget = const RecipeScreen();
     break;
     case 2:
     widget = const RecentOrderScreen();
     break;
     case 3:
     widget = UserProfileScreen(userinfo: currentuserinfo,);
     break;
     default :
     widget =   HomeScreen();
     break;
     

  }
  return widget;
}