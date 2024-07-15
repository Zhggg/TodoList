import 'package:flutter/material.dart';

import '../../constants/color.dart';

class AppTextTheme {
//Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    //Label
    labelLarge: const TextStyle().copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor,
    ),

    //Body
    bodyLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),

    bodySmall: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
    ),
  );

//Customizable Dark Text Theme

  static TextTheme darkTextTheme = TextTheme(
    //Label
    labelLarge: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor,
    ),

    //Body
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),

    bodySmall: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
  );
}
