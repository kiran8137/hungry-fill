import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryfill_restaurant/core/theme/color.dart';
import 'package:hungryfill_restaurant/features/restaurant/data/repository/dishrepo_implement/dish_repo_impl.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/common_widgets/header_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/add_dialog_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/dish_detail_widget.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/pages/screens/dishes/widgets/dish_header.dart';
import 'package:hungryfill_restaurant/features/restaurant/presentation/statemanagment/bloc/dish/dish_bloc.dart';

class DishScreen extends StatelessWidget {
  const DishScreen({super.key, this.index});

  final int? index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderWidget(),
    
        const SizedBox(
          height: 45,
        ),
    
        Row(
           
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              "DISHES",
              style: GoogleFonts.inriaSans(
                  fontWeight: FontWeight.bold, fontSize: 38),
            ),
    
            const SizedBox(width: 1050,),
            GestureDetector(
              onTap: (){
                showDialog(
                  barrierDismissible: false,
                  context: context, 
                  builder: (context){
                    return   DishAddDialog();
                  }
                  );
              },
              child: Container(
                  height: 45,
                  width: 100,
                  decoration: BoxDecoration(
                    color: primarycolor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "ADD",
                      style: GoogleFonts.inriaSans(
                          fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ),
          ],
        ),
        //  SizedBox(height: 45,),
    
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 600,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          spreadRadius: -10,
                          blurRadius: 9,
                          offset: Offset(7, 10)
                          )
                    ]),
              ),
              const SizedBox(width: 15),
              Container(
                height: 45,
                width: 200,
                decoration: BoxDecoration(
                  color: primarycolor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      getcat();
                    },
                    child: Text(
                      "search",
                      style: GoogleFonts.inriaSans(
                          fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // SizedBox(height: 45,),
        const DishHeader(),
       // DishDetailWidget()
      //  Container(
      //   color: Colors.red,
      //   height: 100,
      //   width: double.infinity,
      //  )
        //const DishDetailWidget(),
        BlocConsumer<DishBloc, DishState>(
          listener: (context , state){

            if(state is DishAddSuccuessState){
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                          style: GoogleFonts.aBeeZee(fontSize: 15),
                          "Dish Added Successfully"),
                    ),
                  ),
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              )
             );
            }


            


            if(state is DeleteDishSuccesState){
              
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                          style: GoogleFonts.aBeeZee(fontSize: 15),
                          "Dish Deleted Successfully"),
                    ),
                  ),
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              )
             );
             BlocProvider.of<DishBloc>(context).add(GetDishesEvent());
            }
            
          },
          builder: (context, state) {

            if(state is DishInitial){
              return const Center(child: CircularProgressIndicator(),);
            }

            if(state is GetDishesSuccessState){
              final dishes = state.dishes;
              return SizedBox(
                 width: 1280,
                 height: 450,
                child: SingleChildScrollView(
                  child: Container(
                     width: 1280,
                   height: 600,
                    child: ListView.separated(
                      separatorBuilder: (context , index)=> const Divider(),
                       
                      itemCount: dishes.length,
                      itemBuilder: (context , index){
                        return DishDetailWidget(dish: dishes[index], index: index, );
                      }
                      ),
                  ),
                ),
              );
            } else{
               
              return const Center(child:  Text("No dishes Available"),);
            
            }
           
              
          
          },
        )
      ],
    );
  }
}

 