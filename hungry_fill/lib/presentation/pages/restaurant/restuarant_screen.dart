import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry_fill/core/color/colors.dart';
import 'package:hungry_fill/presentation/pages/main_pages/widgets/search_widget.dart';

class RestuarantScreen extends StatelessWidget {
  RestuarantScreen({super.key});

  final TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios_new),
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
           
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '',
                style: GoogleFonts.abhayaLibre(),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primarycolor,
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(
                  height: 10,
                ),
                SearchWidget(searchcontroller: searchcontroller),
                const SizedBox(height: 50),
                Row(
                  children: [
                    const Expanded(
                        child: Divider(
                      color: Colors.grey,
                    )),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Dishes",
                      style: GoogleFonts.amita(),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Expanded(
                        child: const Divider(
                      color: Colors.grey,
                    ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 246, 245, 245),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Biriyani",
                                      style: GoogleFonts.abhayaLibre(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "₹ 100",
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      height: 45,
                                      width: 155,
                                      decoration: BoxDecoration(
                                          color: primarycolor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                               
                                              ),
                                      child: Center(
                                        child: Text(
                                          "ADD",
                                          style: GoogleFonts.abrilFatface(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: 5)
              ],
            ),
          ),
        )));
  }
}
