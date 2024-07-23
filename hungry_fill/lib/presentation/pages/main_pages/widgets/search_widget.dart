import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.searchcontroller,
  });

  final TextEditingController searchcontroller;

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
    );
  }
}
