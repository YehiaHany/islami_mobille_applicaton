import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    colorScheme: ColorScheme.dark(primary: AppColors.yellowColor),
  );
}
