import 'package:flutter/material.dart';

import '../../constants/color/color.dart';



class AppElevatedButton {
//Customizable Light Elevated Button Theme

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.buttonPrimary,
      side: const BorderSide(
        color: AppColors.buttonPrimary,
      ),
      padding: const EdgeInsets.all(10.0),
      textStyle: const TextStyle(
          fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

//Customizable dark Elevated Button Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.buttonPrimary,
      
      side: const BorderSide(
        color: AppColors.buttonPrimary,
      ),
      padding: const EdgeInsets.all(10.0),
      textStyle: const TextStyle(
          fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}