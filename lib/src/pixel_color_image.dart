import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img_lib;

class PixelColorImage extends StatelessWidget {
  // RowData
  final Uint8List imageBytes;
  // Cache
  final img_lib.Image image;
  // Delegate
  final void Function(int x, int y, Color color)? onHover;
  final void Function(int x, int y, Color color)? onTap;
  final Widget Function(BuildContext context, Image image)? buildImage;
  PixelColorImage({
    Key? key,
    required this.imageBytes,
    this.onHover,
    this.onTap,
    this.buildImage,
  })  : image = img_lib.decodeImage(imageBytes)!,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (details) {
        final x = details.localPosition.dx.toInt();
        final y = details.localPosition.dy.toInt();
        final pixel = image.getPixel(x, y);
        final color = Color(pixel);
        onHover?.call(x, y, color);
      },
      child: GestureDetector(
        onTapUp: (details) {
          final x = details.localPosition.dx.toInt();
          final y = details.localPosition.dy.toInt();
          final pixel = image.getPixel(x, y);
          final color = Color(pixel);
          onTap?.call(x, y, color);
        },
        child: buildImage?.call(
              context,
              Image.memory(imageBytes),
            ) ??
            Image.memory(imageBytes),
      ),
    );
  }
}
