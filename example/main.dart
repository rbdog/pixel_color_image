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
  // Create widget
  const pixelColorImage = PixelColor.assetImage(
    path: 'images/xxx.png',
    onHover: onHover,
    onTap: onTap,
  );

  // Create app
  const app = MaterialApp(
    home: Scaffold(
      body: pixelColorImage, // Use widget
    ),
  );

  // Run app
  runApp(app);
}
