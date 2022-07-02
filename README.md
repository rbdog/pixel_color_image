![Header](https://github.com/rbdog/pixel_color_image/blob/main/resources/images/pixel-color-image-header.png?raw=true)

# Pixel Color Image

https://pub.dev/packages/pixel_color_image

<br>
<br>

## Usage

### 1. Create widget

- use asset image

```
const pixelColorImage = PixelColor.assetImage(
  path: 'images/xxx.png',
  onHover: onHover,
  onTap: onTap,
);
```

- use url image

```
const pixelColorImage = PixelColor.networkImage(
  url: 'https://example.com/xxx.png',
  onHover: onHover,
  onTap: onTap,
);
```

### 2. these functions are called

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
<br>
<br>

## Color-Preview Widget

- diagram explain

![diagram](https://github.com/rbdog/pixel_color_image/blob/main/resources/images/pixel-color-preview.png?raw=true)

### 1. create Ref (put it at the place you can keep e.g. global)

```
final ref = PixelColorRef();
```

### 2. pass ref to the PixelColor widget

```
final img = PixelColor.assetImage(
  ...
  ...
  ref: ref,
);
```

### 3. pass ref to the Rreview widget

```
final preview = PixelColorPreview(
  ref: ref,
);
```

<br>

🎉 any issues, requests, contributions are welcomed!

<br>
