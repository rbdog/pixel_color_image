import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pixel_color_image/pixel_color_image.dart';

/// PixelColor
class PixelColor extends StatelessWidget {
  /// assetPath
  final String? path;

  /// url
  final String? url;

  // Delegate
  final void Function(int x, int y, Color color)? onHover;
  final void Function(int x, int y, Color color)? onTap;
  final Widget Function(BuildContext context, Image image)? buildImage;

  /// from assets
  const PixelColor.assetImage({
    Key? key,
    required this.path,
    this.onHover,
    this.onTap,
    this.buildImage,
  })  : url = null,
        super(key: key);

  /// from network
  const PixelColor.networkImage({
    Key? key,
    required this.url,
    this.onHover,
    this.onTap,
    this.buildImage,
  })  : path = null,
        super(key: key);

  /// get image bytes
  Future<Uint8List> getBytes() async {
    if (path != null) {
      return await getImageBytesAsset(path!);
    }
    if (url != null) {
      return await getImageBytesUrl(url!);
    }
    throw Exception('required assetPath | url');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: getBytes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          if (!snapshot.hasData) {
            return const Text("Error: Not Found Image Data");
          }
          return PixelColorImage(
            imageBytes: snapshot.data!,
            onHover: onHover,
            onTap: onTap,
            buildImage: buildImage,
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
