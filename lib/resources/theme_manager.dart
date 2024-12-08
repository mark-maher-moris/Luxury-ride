import 'package:flutter/material.dart';
import 'package:myapp/resources/color_manager.dart';

class ThemeManager {
  static ThemeData appTheme = ThemeData(
      scaffoldBackgroundColor: ColorManager.whiteColor,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: ColorManager.whiteColor,
        surfaceTintColor: ColorManager.whiteColor,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      primaryColor: ColorManager.blackColor,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.blackColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: ColorManager.greyColor,
        unselectedLabelStyle: TextStyle(
          color: ColorManager.greyColor,
          fontSize: 15,
        ),
        selectedItemColor: ColorManager.redColor,
      ));
}
