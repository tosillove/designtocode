import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  /// Creates an [ImageContainer] widget.
  ///
  /// The [width] and [height] parameters are required.
  /// The [uri] parameter specifies the source of the image.
  /// The [fit], [borderRadius], and [padding] parameters are optional.
  const ImageContainer({
    super.key,
    required this.width,
    required this.height,
    required this.uri,
    this.fit,
    this.borderRadius,
    this.padding,
  }) : imageBytes = null;

  /// named constructor for imageBytes
  const ImageContainer.bytes({
    super.key,
    required this.width,
    required this.height,
    required this.imageBytes,
    this.fit,
    this.borderRadius,
    this.padding,
  }) : uri = null;

  /// The width of the image container.
  final double width;

  /// The height of the image container.
  final double height;

  /// The URI of the image to be displayed.
  final String? uri;

  /// The bytes of the image to be displayed.
  final Uint8List? imageBytes;

  /// The fit of the image within the container.
  final BoxFit? fit;

  /// The border radius of the container.
  final BorderRadiusGeometry? borderRadius;

  /// The padding of the container.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> imageProvider;
    try {
      if (imageBytes != null) {
        imageProvider = MemoryImage(imageBytes!);
      } else if (uri != null && uri!.isNotEmpty) {
        if (uri!.startsWith('http://') || uri!.startsWith('https://')) {
          imageProvider = NetworkImage(uri!);
        } else if (uri!.startsWith('assets') || uri!.startsWith('asset')) {
          imageProvider = AssetImage(uri!);
        } else {
          imageProvider = FileImage(File(uri!));
        }
      } else {
        throw UnsupportedError('Invalid image uri or bytes');
      }
    } catch (e) {
      imageProvider = const AssetImage('');
      rethrow;
    }

    return Container(
      width: width,
      height: height,
      padding: padding ?? EdgeInsetsDirectional.zero,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        image: DecorationImage(
          image: imageProvider,
          fit: fit ?? BoxFit.cover,
        ),
      ),
    );
  }
}
