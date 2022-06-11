import 'package:flutter/material.dart';
import 'package:pixel_color_image/pixel_color_image.dart';

/// Called while Hoverring
void onHover(int x, int y, Color color) async {
  debugPrint('Hover x: $x, y: $y, color: $color');
}

/// Called when tap
void onTap(int x, int y, Color color) async {
  debugPrint('Tap x: $x, y: $y, color: $color');
}

/// main
void main() async {
  // Get image bytes
  final imageBytes = await getImageBytesAsset("images/xxx.png");

  // Create widget
  final pixelColorImage = PixelColorImage(
    imageBytes: imageBytes,
    onHover: onHover,
    onTap: onTap,
  );

  // Create app
  final app = MaterialApp(
    home: Scaffold(
      body: pixelColorImage, // Use widget
    ),
  );

  // Run app
  runApp(app);
}
