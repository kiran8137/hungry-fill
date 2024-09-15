 import 'package:flutter/material.dart';

 SizedBox profileDetailFormField({required bool isEdit, required TextEditingController textController ,required String title}) {
    return SizedBox(
                height: 80,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text(title),
                    TextFormField(
                      readOnly: isEdit,
                      // validator:  validator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: textController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ],
                ),
              );
  }