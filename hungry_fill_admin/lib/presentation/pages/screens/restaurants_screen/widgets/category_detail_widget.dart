import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/data/models/category_model.dart';
import 'package:hungry_fill_admin/presentation/pages/screens/restaurants_screen/widgets/edit_dialog.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/restaurant_provider.dart';
import 'package:provider/provider.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Consumer<RestaurantProvider>(
          builder: (context, value, child) =>
              ListView.separated(
                  itemBuilder: (context, index) {
                    final category = value.categories[index];
                    return ListTile(
                      title: Text(
                        category.categoryname!,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    CategoryModel category =
                                        CategoryModel(
                                            categoryname: value
                                                .categories[
                                                    index]
                                                .categoryname,
                                            categoryid: value
                                                .categories[
                                                    index]
                                                .categoryid);
                                    return EditDialog(
                                        currentcategory:
                                            category);
                                  });
                            },
                            child: const Icon(
                              Icons.edit,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                        "Are you sure want to delete",
                                        style: TextStyle(
                                            fontSize: 15),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(
                                                  context);
                                            },
                                            child: const Text(
                                                'cancel')),
                                        TextButton(
                                            onPressed: () {
                                              value.deleteCategory(
                                                  categoryid:
                                                      category
                                                          .categoryid!);
                                              Navigator.pop(
                                                  context);
                                            },
                                            child: const Text(
                                                'ok'))
                                      ],
                                    );
                                  });
                            },
                            child: const Icon(
                              Icons.delete,
                              size: 18,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(),
                  itemCount: value.categories.length),
        ));
  }
}