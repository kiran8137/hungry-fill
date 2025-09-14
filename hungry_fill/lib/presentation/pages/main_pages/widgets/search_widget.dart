import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';
import 'package:hungry_fill/presentation/pages/widgets/text_form_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.searchcontroller,
    this.resuserid,
  });

  final TextEditingController searchcontroller;
  final String? resuserid;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormWidget(
      
      controller: searchcontroller,
      hinttext: "Search Restaurants , foods",
      onChanged: (value){
        if(value.isNotEmpty){
          BlocProvider.of<DishBloc>(context).add(SearchDishEvent(dishname: value, userid: resuserid));
        }else if(value.isEmpty || value == ''){
           BlocProvider.of<DishBloc>(context)
        .add(DishGetEvent(resuserid: resuserid));
        }
        
      },
    );
  }
}
