# Pixel Color Image

https://pub.dev/packages/pixel_color_image

<br>
<br>

## Usage

### 1. Get image bytes

- asset image

```
final imageBytes = await getImageBytesAsset("images/xxx.png");
```

- url image

```
final imageBytes = await getImageBytesUrl("http://xxx.com/xxx.png");
```

### 2. Create widget

```
final pixelColorImage = PixelColorImage(
  uint8List: imageBytes,
  onHover: onHover,
  onTap: onTap,
);
```

### 3. these functions are called

```
/// Called while Hoverring
void onHover(int x, int y, Color color) async {
  debugPrint('Hover x: $x, y: $y, color: $color');
}

/// Called when tap
void onTap(int x, int y, Color color) async {
  debugPrint('Tap x: $x, y: $y, color: $color');
}
```

<br>

🎉 any issues, requests, contributions are welcomed!

<br>
