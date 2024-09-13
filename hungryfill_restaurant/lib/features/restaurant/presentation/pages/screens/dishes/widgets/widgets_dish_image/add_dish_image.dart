import 'dart:typed_data';

import 'package:flutter/material.dart';

class DishImageWidget extends StatelessWidget {
  const DishImageWidget({
    super.key,
    required this.selectedimage,
  });

  final Uint8List? selectedimage;

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 90,
    width: 90,
    decoration: BoxDecoration(
      color:
          const Color.fromARGB(255, 241, 240, 240),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
          width: 1,
          color: const Color.fromARGB(
              255, 203, 203, 203)),
       //image: DecorationImage(image: MemoryImage(value.selectedimage!),fit: BoxFit.contain)
    ),
    child: selectedimage ==null ?
        Image.asset('assets/placeholder.jpg'):
        Image.memory(selectedimage!,
        fit: BoxFit.cover,
        )
        );
  }
}
