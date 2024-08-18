import 'dart:typed_data';

import 'package:flutter/material.dart';

class EditDishImageWidget extends StatelessWidget {
  const EditDishImageWidget({
    super.key,
    required this.selectedimage, this.imageurl,

  });

  final Uint8List? selectedimage;
  final String? imageurl;

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
       
       image: selectedimage == null ? DecorationImage(image: NetworkImage(imageurl!),fit: BoxFit.cover) : 
            DecorationImage(image: MemoryImage(selectedimage!),fit: BoxFit.cover)
    ),
    
        );
  }
}
