

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ListView dishDetailTable(List<String> tablecontents) {
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
                                    )),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color.fromARGB(255, 140, 140, 140),
                                )
                              ],
                            );
                          }
                          );
  }