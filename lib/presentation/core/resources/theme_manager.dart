import 'package:flutter/material.dart';

import 'color_manager.dart';

ThemeData theme = ThemeData(
  primaryColor: AppColors.primaryColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  useMaterial3: true,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 3.0,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedIconTheme: IconThemeData(
      color: AppColors.primaryColor,
    ),
    selectedItemColor: AppColors.primaryColor,
    unselectedIconTheme: IconThemeData(
      color: Color(0xff82898F),
    ),
    unselectedItemColor: Color(0xff82898F),
    selectedLabelStyle: TextStyle(
     color: AppColors.primaryColor
    ),
    unselectedLabelStyle: TextStyle(
     color: Color(0xff82898F),
    ),
  ),
);