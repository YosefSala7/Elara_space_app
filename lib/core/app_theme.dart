import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';

abstract class AppThemes{
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      labelSmall: TextStyle(color: AppColors.primary,fontFamily: FontFamily.spaceGrotesk),
      headlineSmall: TextStyle(color: AppColors.white,fontFamily: FontFamily.spaceGrotesk,fontWeight: .bold)
    )
  );
}