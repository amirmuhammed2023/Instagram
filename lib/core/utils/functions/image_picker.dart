import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logandregister/features/data/my_fire_storage.dart';
import 'package:path/path.dart' show basename;

class MyImagePicker {
  static final ImagePicker picker = ImagePicker();
  static Uint8List? imagePath;
  static String? imageName;
  static int? imageNumber;
  static getImageInView(ImageSource source) async {
    try {
      final XFile? pickedImage = await picker.pickImage(source: source);
      if (pickedImage != null) {
        imagePath = await pickedImage.readAsBytes();
        imageName = basename(pickedImage.path);
        imageNumber = Random().nextInt(9999999);
        imageName = "$imageNumber$imageName";
        // to save img link in my firestorage
        MyFireStorage.getImageUrl(
          imgName: imageName!,
          imgPath: imagePath!,
        );
      }
    } catch (e) {
      return "image error";
    }
  }

  static void returnToUploadView(TextEditingController textEditingController) {
    textEditingController.clear();
    imagePath = null;
  }
}
