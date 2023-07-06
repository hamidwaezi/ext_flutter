import 'dart:ui';

enum ColorType {
  hex3(r'^(?:#|0x)([a-f0-9]{3})$'),
  hex4(r'^(?:#|0x)([a-f0-9]{4})$'),
  hex6(r'^(?:#|0x)([a-f0-9]{6})$'),
  hex8(r'^(?:#|0x)([a-f0-9]{8})$'),
  // ^(?:rgb|hsl)a?\([^\)]*\)$
  hls(r'^(rgb)?\((\d{1,3}), (\d{1,3})?%, (\d{1,3})?%\)?$'),
  rgb(r'^(rgb)?\((\d{1,3}), (\d{1,3}), (\d{1,3})\)?$'),
  rgba(r'^(rgba)?\((\d{1,3}), (\d{1,3}), (\d{1,3}), (\d{1,3})\)?$'),
  hlsa(r'^(rgba)?\((\d{1,3}), (\d{1,3}), (\d{1,3}), (\d{1,3})\)?$'),
  ;

  static Color? tryParseToColor(String text) {
    if (RegExp(ColorType.hex3.regex).hasMatch(text)) {
      var hex3 = text.substring(text.length - 3, text.length);
      var hex8 =
          '0xff${hex3[0]}${hex3[0]}${hex3[1]}${hex3[1]}${hex3[2]}${hex3[2]}';
      return Color(int.parse(hex8));
    } else if (RegExp(ColorType.hex4.regex).hasMatch(text)) {
      var hex4 = text.substring(text.length - 4, text.length);
      var hex8 =
          '0x${hex4[0]}${hex4[0]}${hex4[1]}${hex4[1]}${hex4[2]}${hex4[2]}${hex4[3]}${hex4[3]}';
      return Color(int.parse(hex8));
    } else if (RegExp(ColorType.hex6.regex).hasMatch(text)) {
      var hex6 = text.substring(text.length - 6, text.length);
      var hex8 = '0xff$hex6';
      return Color(int.parse(hex8));
    } else if (RegExp(ColorType.hex8.regex).hasMatch(text)) {
      var hex = text.substring(text.length - 8, text.length);
      var hex8 = '0xff$hex';
      return Color(int.parse(hex8));
    }
    return null;
  }

  final String regex;

  const ColorType(this.regex);
}

extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      alpha,
      (red * value).round(),
      (green * value).round(),
      (blue * value).round(),
    );
  }

  Color lighten([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = percent / 100;
    return Color.fromARGB(
      alpha,
      (red + ((255 - red) * value)).round(),
      (green + ((255 - green) * value)).round(),
      (blue + ((255 - blue) * value)).round(),
    );
  }

  Color avg(Color other) {
    final red = (this.red + other.red) ~/ 2;
    final green = (this.green + other.green) ~/ 2;
    final blue = (this.blue + other.blue) ~/ 2;
    final alpha = (this.alpha + other.alpha) ~/ 2;
    return Color.fromARGB(alpha, red, green, blue);
  }
}
