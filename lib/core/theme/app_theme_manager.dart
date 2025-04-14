import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: "Poppins",
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      centerTitle: true,
    )
  );
}
