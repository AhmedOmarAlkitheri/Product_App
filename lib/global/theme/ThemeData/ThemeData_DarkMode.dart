import 'package:flutter/material.dart';
import 'package:product_app/global/theme/AppColor/appColor_DarkMode.dart';

ThemeData darkMode() {
  return ThemeData(
      appBarTheme: AppBarTheme(
    backgroundColor: AppcolorDarkmode.primary,
  ));
}
