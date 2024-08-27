
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill_admin/core/theme/color.dart';
import 'package:hungry_fill_admin/presentation/statemanagment/provider/restaurant_provider.dart';
import 'package:provider/provider.dart';

Dialog categoryAddDialog({required BuildContext context ,required TextEditingController categorycontroller}) {
    return Dialog(
                                  child: Container(
                                    decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius: BorderRadius.circular(10)
                                    ),
                                    height: 330,
                                    width: 200,
                                   
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            right: 0,
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.pop(context);
                                              },
                                              child: const Icon(Icons.cancel)
                                              )
                                            ),
                                          Column(
                                            children: [
                                              Text(
                                                'Category',
                                                style: GoogleFonts.roboto(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              TextFormField(
                                                controller: categorycontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10))),
                                              ),
                                              const SizedBox(height: 6),
                                              GestureDetector(
                                                onTap: (){
                                                  if(categorycontroller.text.isEmpty){
                                                    return;
                                                  }
                                                  Provider.of<RestaurantProvider>(context,listen: false).createCategory(category: categorycontroller.text);
                                                  
                                                  Navigator.pop(context);
                                                  categorycontroller.clear();
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 150,
                                                  
                                                  decoration: BoxDecoration(
                                                    color: primarycolor,
                                                    borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  child: Center(
                                                    child: Text('Add Category',
                                                    style: GoogleFonts.aBeeZee(
                                                      color: Colors.white
                                                    ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 200,
                                                child: Consumer<RestaurantProvider>(
                                                  builder: (context, value, child) => 
                                                    ListView.separated(
                                                      itemBuilder:
                                                          (context, index) {
                                                        final category =
                                                            value.categories[index];
                                                        return ListTile(
                                                          title: Text(
                                                            category.categoryname!,
                                                            style:
                                                                GoogleFonts.inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                          trailing: const Icon(
                                                            Icons.delete,
                                                            size: 18,
                                                            color: Colors.red,
                                                          ),
                                                        );
                                                      },
                                                      separatorBuilder:
                                                          (context, index) =>
                                                              const Divider(),
                                                      itemCount: value.categories.length),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
  }




  Container restaurantBar({required BuildContext context , required TextEditingController categorycontroller}) {
    return Container(
            width: double.infinity,
            height: 60,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Restaurants List',
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 34,
                        width: 250,
                        //color: Colors.red,
                        child: TextFormField(
                          style: const TextStyle(height: 1.3),
                          decoration: InputDecoration(
                              hintText: 'Search Restaurants',
                              hintStyle: const TextStyle(fontSize: 11),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      const Icon(
                        Icons.search,
                        size: 30,
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: Container(
                                    decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius: BorderRadius.circular(10)
                                    ),
                                    height: 330,
                                    width: 200,
                                   
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            right: 0,
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.pop(context);
                                              },
                                              child: const Icon(Icons.cancel)
                                              )
                                            ),
                                          Column(
                                            children: [
                                              Text(
                                                'Category',
                                                style: GoogleFonts.roboto(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              TextFormField(
                                                controller: categorycontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10))),
                                              ),
                                              const SizedBox(height: 6),
                                              GestureDetector(
                                                onTap: (){
                                                  if(categorycontroller.text.isEmpty){
                                                    return;
                                                  }
                                                  Provider.of<RestaurantProvider>(context,listen: false).createCategory(category: categorycontroller.text);
                                                  
                                                  Navigator.pop(context);
                                                  categorycontroller.clear();
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 150,
                                                  
                                                  decoration: BoxDecoration(
                                                    color: primarycolor,
                                                    borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  child: Center(
                                                    child: Text('Add Category',
                                                    style: GoogleFonts.aBeeZee(
                                                      color: Colors.white
                                                    ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 200,
                                                child: Consumer<RestaurantProvider>(
                                                  builder: (context, value, child) => 
                                                    ListView.separated(
                                                      itemBuilder:
                                                          (context, index) {
                                                        final category =
                                                            value.categories[index];
                                                        return ListTile(
                                                          title: Text(
                                                            category.categoryname!,
                                                            style:
                                                                GoogleFonts.inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                          trailing: const Icon(
                                                            Icons.delete,
                                                            size: 18,
                                                            color: Colors.red,
                                                          ),
                                                        );
                                                      },
                                                      separatorBuilder:
                                                          (context, index) =>
                                                              const Divider(),
                                                      itemCount: value.categories.length),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: 
                        Container(
                          height: 34,
                          width: 120,
                          decoration: BoxDecoration(
                              color: primarycolor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                              Text(
                                'Category',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
  }



 ListView restaurantDetailTable(List<String> tablecontents) {
    return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 160),
                              scrollDirection: Axis.horizontal,
                              itemCount: tablecontents.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Container(
                                        height: 30,
                                        child: Center(
                                          child: Text(
                                            tablecontents[index],
                                            style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromARGB(
                                                    255, 140, 140, 140)),
                                          ),
                                        )
                                        ),
                                    const Icon(
                                      Icons.keyboard_arrow_down,
                                      color:
                                          Color.fromARGB(255, 140, 140, 140),
                                    )
                                  ],
                                );
                              });
  }
