import 'package:flutter/material.dart';
import 'package:hungry_fill/presentation/pages/main_pages/widgets/search_widget.dart';

class RecipeScreen extends StatelessWidget {
    RecipeScreen({super.key});

 final TextEditingController controller  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SearchWidget(searchcontroller: controller),
      ),
      backgroundColor: Colors.white,
      body: Center(child: Text("Recipe Screen",style: TextStyle(color: Colors.black),),),
    );
  }
}