
import 'dart:developer';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
 
import 'package:flutter/material.dart';

Future<String> saveImageToStorage({required String filename , required Uint8List selectedImageInBytes}) async {
  try {
    debugPrint("save imag");
    firebase_storage.UploadTask uploadtask;

    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('dishes')
        .child('/+ ${filename}');
    final metadata =
        firebase_storage.SettableMetadata(contentType: 'image/jpeg');

    uploadtask = ref.putData(selectedImageInBytes, metadata);
    await uploadtask.whenComplete(() => null);
    final imageUrl = await ref.getDownloadURL();
    debugPrint(imageUrl);

    return imageUrl;
  } catch (error) {
    log(error.toString());
    throw Exception(error.toString());
  }
}