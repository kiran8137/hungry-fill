

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Padding dishDetailTable(List<String> tablecontents) {
    return Padding(
                            padding: const EdgeInsets.only(top: 8, left: 15),
                            child: SizedBox(
                              //  color: Colors.amber,
                              height: 30,
                              width: double.infinity,
                              child:ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 160),
                        scrollDirection: Axis.horizontal,
                        itemCount: tablecontents.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              SizedBox(
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
                                  )),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color.fromARGB(255, 140, 140, 140),
                              )
                            ],
                          );
                        }
                        )
                              // dishDetailTable(tablecontents),
                            ),
                          );
  }