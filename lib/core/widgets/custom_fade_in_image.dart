import 'dart:convert';
import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:imen_moj/core/utils/transparent_image.dart';

class CustomImageFadeWidget extends StatelessWidget {
  const CustomImageFadeWidget({
    required String imagesURL,
    required BoxFit boxFit,
    double? width,
    double? height,
    double? scale,
    bool? isAsset,
    bool? isBase64,
    super.key,
  })  : _imagesURL = imagesURL,
        _width = width,
        _height = height,
        _boxFit = boxFit,
        _scale = scale,
        _isAsset = isAsset,
  _isBase64 = isBase64;

  final String? _imagesURL;
  final double? _width;
  final double? _height;
  final BoxFit? _boxFit;
  final double? _scale;
  final bool? _isAsset;
  final bool? _isBase64;

  @override
  Widget build(BuildContext context) => FadeInImage(
    image: _getImageProvider(),
    placeholder: MemoryImage(
      kTransparentImage,
      scale: _scale ?? 1.0,
    ),
    width: _width,
    height: _height,
    fit: _boxFit,
    imageErrorBuilder: (_, error, stackTrace) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: MemoryImage(kTransparentImage, scale: _scale ?? 1.0),
              fit: _boxFit,
            )),
      );
    },
  );

  /// **🔹 تشخیص نوع تصویر و تبدیل به `ImageProvider`**
  ImageProvider _getImageProvider() {
    if (_isBase64 ?? false) {
      return MemoryImage(_decodeBase64(_imagesURL!));
    } else if (_isAsset ?? false) {
      return ExtendedAssetImageProvider(_imagesURL!);
    } else {
      return ExtendedNetworkImageProvider(_imagesURL!, cache: false);
    }
  }

  /// **🔹 دیکد کردن `Base64` به `Uint8List`**
  Uint8List _decodeBase64(String base64String) {
    try {
      return const Base64Decoder().convert(base64String);
    } catch (e) {
      return kTransparentImage; // در صورت خطا، تصویر شفاف نمایش داده شود.
    }
  }
}