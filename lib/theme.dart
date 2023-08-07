import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class WebneshinTheme {
  FlexScheme colorFlexScheme = FlexScheme.blueWhale;

  ThemeData light() {
    return FlexThemeData.light(
      scheme: this.colorFlexScheme,
      fontFamily: 'yekan',
    );
  }
  ThemeData dark(){
    return FlexThemeData.dark(
      scheme: this.colorFlexScheme,
      fontFamily: 'yekan',
    );
  }
}
