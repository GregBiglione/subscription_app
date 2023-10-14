import 'dart:ui';

class ColorManager {
  static Color purple700 = HexColor.fromHex("#8F6FFF");
  static Color white100 = HexColor.fromHex("#F6F2FF");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");

    if(hexColorString.length == 6) {
      // 8 char with opacity 100%
      hexColorString = "FF$hexColorString";
    }

    return Color(int.parse(hexColorString, radix: 16));
  }
}