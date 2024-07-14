import 'package:flutter/material.dart';

import '../../constants/color/color.dart';


class AAppBarTheme {
//Customizable Light Appbar Theme
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AppColors.buttonPrimary, size: 24),
    actionsIconTheme: IconThemeData(color: AppColors.primaryColor, size: 24),
  );

//Customizable dark Appbar Theme
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AppColors.buttonPrimary, size: 24),
    actionsIconTheme: IconThemeData(color:AppColors.primaryColor, size: 24),
  );
}