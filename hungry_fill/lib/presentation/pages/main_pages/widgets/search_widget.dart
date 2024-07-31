import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_fill/presentation/bloc/dish_bloc/dish_bloc.dart';

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
    return TextField(
      
      controller: searchcontroller,
      decoration: InputDecoration(
        hintText: "Search Restaurants , foods",
        hintStyle:  const TextStyle(fontStyle: FontStyle.normal,color: Color.fromARGB(164, 158, 158, 158)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white)
        ),
        fillColor: const Color.fromARGB(62, 207, 204, 204),
        filled: true
      ),
      onChanged: (value){
        if(value.isNotEmpty){
          BlocProvider.of<DishBloc>(context).add(SearchDishEvent(dishname: value, userid: resuserid));
        }else{
           BlocProvider.of<DishBloc>(context)
        .add(DishGetEvent(resuserid: resuserid));
        }
        
      },
    );
  }
}
