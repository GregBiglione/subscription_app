import 'dart:ui';

class ColorManager {
  static Color purple700 = HexColor.fromHex("#8F6FFF");
  static Color white100 = HexColor.fromHex("#F6F2FF");
  static Color black = HexColor.fromHex("#000000");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color lightBlue = HexColor.fromHex("#03A9F4");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");

    if(hexColorString.length == 6) {
      // 8 characters with opacity 100% ----------------------------------------
      hexColorString = "FF$hexColorString";
    }

    return Color(int.parse(hexColorString, radix: 16));
  }
}