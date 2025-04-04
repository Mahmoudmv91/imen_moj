import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageUtil {
  final ImagePicker _picker = ImagePicker();

  Future<String?> takeImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 100,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (pickedFile != null) {
      var image = File(pickedFile.path);
      return await _cropImage(imageFile: image);
    }
    return null;
  }

  Future<String?> _cropImage({
    required File imageFile,
  }) async {
    String? base64Image;
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
          ],
          toolbarColor: Colors.red,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio5x3,
            CropAspectRatioPreset.ratio5x4,
            CropAspectRatioPreset.ratio7x5,
            CropAspectRatioPreset.ratio16x9
          ],
          aspectRatioLockEnabled: true,
        )
      ],
    );
    if (croppedFile != null) {
      final imageBytes = await croppedFile.readAsBytes();
      base64Image = base64Encode(imageBytes);
    }
    return base64Image;
  }

  Future<String> convertAssetToBase64(String assetPath) async {
    ///read file from assets
    ByteData bytes = await rootBundle.load(assetPath);
    Uint8List buffer = bytes.buffer.asUint8List();

    ///convert to base64String
    String base64String = base64Encode(buffer);
    return base64String;
  }
}
