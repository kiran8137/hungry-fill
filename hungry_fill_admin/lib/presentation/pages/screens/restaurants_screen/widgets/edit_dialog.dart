import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/core/theme/color.dart';
import 'package:hungry_fill_admin/data/models/category_model.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/restaurant_provider.dart';
import 'package:provider/provider.dart';

class EditDialog extends StatelessWidget {
  EditDialog({super.key, required this.currentcategory});

  final CategoryModel currentcategory;

  final TextEditingController categorycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    categorycontroller.text = currentcategory.categoryname!;
    return Dialog(
      child: Container(
       
        height: 120,
        width: 200,
        decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadiusDirectional.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 40,
                width: 250,
                child: TextFormField(
                  controller: categorycontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                   GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                     child: Container(
                      height: 30,
                      width: 130,
                      decoration: BoxDecoration(
                          color: primarycolor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'cancel',
                          style: GoogleFonts.aBeeZee(color: Colors.white),
                        ),
                      ),
                                       ),
                   ),
                  GestureDetector(
                    onTap: (){
                      if(categorycontroller.text.isEmpty){
                        return;
                      }
                      final category = CategoryModel(
                        categoryname:categorycontroller.text,
                        categoryid: currentcategory.categoryid
                        );
                      Provider.of<RestaurantProvider>(context, listen: false).updateCategory(category: category);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 30,
                      width: 130,
                      decoration: BoxDecoration(
                          color: primarycolor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'update',
                          style: GoogleFonts.aBeeZee(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
