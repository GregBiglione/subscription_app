import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

// Light style -----------------------------------------------------------------

TextStyle getLightStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color,
  );
}

// Regular style ---------------------------------------------------------------

TextStyle getRegularStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
  );
}

TextStyle getRegularStyle14({double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
  );
}

TextStyle getRegularStyle16({double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
  );
}

TextStyle getRegularStyle20({double fontSize = FontSize.s20, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
  );
}

// Medium style ----------------------------------------------------------------

TextStyle getMediumStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
  );
}

TextStyle getMediumStyle14({double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
  );
}

TextStyle getMediumStyle18({double fontSize = FontSize.s18, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
  );
}

// Bold style ------------------------------------------------------------------

TextStyle getBoldStyle18({double fontSize = FontSize.s18, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
  );
}

TextStyle getBoldStyle26({double fontSize = FontSize.s26, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
  );
}