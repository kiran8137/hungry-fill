
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/model/category/category_model.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/auth_screens/login.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/authentication/auth_bloc_bloc.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/dish/dish_bloc.dart';

class HeaderWidget extends StatelessWidget {
    HeaderWidget({super.key, this.index});

  final int? index;

 

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 50,
    
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight:   Radius.circular(10)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.50),
              spreadRadius: -5,
              blurRadius: 10,
              offset: const Offset(10, 0)
            )
          ]

      ),

      child: Row(
         
        children: [

          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            
             Text("Hi,  Welcome.!",
            style: GoogleFonts.barlow(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: primarycolor
            ),
            ),
          ),

          const SizedBox(width: 950,),

          GestureDetector(
            onTap: (){
                showDialog(
                        context: context, 
                        builder:(context){
                        return  AlertDialog(
                          title: const Text("Are you sure want to delete"),
                            actions: [
                              TextButton(
                                onPressed: (){
                                   Navigator.pop(context);
                                }, 
                                child: const Text("cancel")
                                ),
                                 TextButton(
                                onPressed: (){
                                  BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const LoginScreen()), (Route<dynamic> predicate)=>false);
                                   
                                }, 
                                child: const Text("Ok")
                                )
                            ],
                          );
                        }
                        );
              
            },
            child: Text("Log Out",
            style: TextStyle(
              color: Colors.red
            ),
            ),
          ),

        SizedBox(width: 20,),

        GestureDetector(
          onTap: (){
           
          },
          child: Container(
            height: 45,
            width: 45,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage("assets/person.png"))
            ),
          ),
        ),

         
        ],
      ),
    );
  }
}