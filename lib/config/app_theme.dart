import 'package:flutter/material.dart';

import '../core/app_colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'BoutroSasma',
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: AppColors.primaryColor,
  ),
  useMaterial3: true,
);
ThemeData darkTheme = ThemeData(
  fontFamily: 'BoutroSasma',
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: AppColors.primaryColor,
  ),
  useMaterial3: true,
);
