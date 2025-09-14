import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_fill/data/model/restaurant_model/restaurant_model.dart';
import 'package:hungry_fill/presentation/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:hungry_fill/presentation/pages/widgets/restaurant_card_widget.dart';
import 'package:hungry_fill/presentation/pages/widgets/text_form_field.dart';
import 'package:hungry_fill/widgets/custom_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    // TODO: implement initState
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.white,
          title: CustomText(
                  text: 'Search',
                  fontSize: 17.sp,
                  color: Color.fromRGBO(24, 528, 46, 1),
                ),
           
        ),
     body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            CustomTextFormWidget(
              controller: searchController,
               hinttext:'Search dishes, restaurants',
               onChanged: (p0) {
                 if(p0.isNotEmpty){
                  context.read<RestaurantBloc>().add(SearchRestaurantEvent(restaurantName: p0));
                 } 
               },
               ),

            BlocBuilder<RestaurantBloc, RestaurantState>(
              buildWhen: (previous, current) => current is SearchRestaurantSuccess || current is SearchRestaurantEmptyState,
              builder: (context, state) {
                if(state is SearchRestaurantEmptyState){
                  return Center(child: Text('No Restaurants Found'),);
                }
                if(state is! SearchRestaurantSuccess){
                  return Center(child: CircularProgressIndicator(),);
                }
                final List<RestaurantModel> searchedRestaurants = state.restaurants;
                return Expanded(
                          child: ListView.builder(
                            itemCount: searchedRestaurants.length,
                            itemBuilder: (context, index) {
                              final restaurant = searchedRestaurants[index];
                              return  RestaurantCardWidget(restaurant: restaurant);
                            },
                            )
                          );
              },
            )
          ],
        ),
      )
      ),
    );
  }
}