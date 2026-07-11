import 'package:flutter/material.dart';
import 'package:mens_store/core/themes/app_colors.dart';
import 'package:mens_store/core/themes/app_fonts.dart';
import 'package:mens_store/core/themes/app_styles.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    // pageTransitionsTheme: PageTransitionsTheme(
    //       builders: {
    //         TargetPlatform.android: GoTransitions.slide.toTop,
    //         TargetPlatform.iOS: GoTransitions.cupertino,
    //         TargetPlatform.macOS: GoTransitions.cupertino,
    //       },
    //     ),
    brightness: Brightness.light,
    // primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    fontFamily: AppFonts.mainAppFont,
    textTheme: TextTheme(
      titleLarge: AppStyles.primaryHeadLinesStyle,
      titleMedium: AppStyles.subTitlesStyle,
    ),
    // buttonTheme: ButtonThemeData(
    //   buttonColor: AppColors.primaryColor,
    //   disabledColor: AppColors.secondaryColor,
    // ),
  );
}
