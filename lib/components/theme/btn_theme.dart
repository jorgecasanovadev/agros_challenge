import 'package:agros_challenge/components/theme/color_theme.dart';
import 'package:flutter/material.dart';

class BtnTheme {
  static RoundedRectangleBorder btnShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
  static EdgeInsets btnPadding = const EdgeInsets.only(top: 10, bottom: 10);
  static double btnFontSize = 16.0;
}

class BtnPrimaryTheme {
  static Color backgroundColor = ColorTheme.primaryColor;
  static TextStyle btnTextStyle = TextStyle(
    fontSize: BtnTheme.btnFontSize,
    color: Colors.white,
  );
  static Color foregroundColor = Colors.white;
}

class BtnSecondaryTheme {
  static Color backgroundColor = ColorTheme.secondaryColor;
  static TextStyle btnTextStyle = TextStyle(
    fontSize: BtnTheme.btnFontSize,
    color: Colors.white,
  );
  static Color foregroundColor = Colors.white;
}

class BtnDangerTheme {
  static Color backgroundColor = ColorTheme.dangerColor;
  static TextStyle btnTextStyle = TextStyle(
    fontSize: BtnTheme.btnFontSize,
    color: Colors.white,
  );
  static Color foregroundColor = Colors.white;
}

class BtnOutlinePrimaryTheme {
  static Color backgroundColor = ColorTheme.secondaryColor;
  static TextStyle btnTextStyle = TextStyle(
    fontSize: BtnTheme.btnFontSize,
    color: ColorTheme.secondaryColor,
  );
  static BorderSide borderSide = BorderSide(
    color: ColorTheme.secondaryColor,
  );
}
