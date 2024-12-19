import 'package:clinic_system_patient/core/resources/color_manager.dart';
import 'package:clinic_system_patient/core/resources/font_manager.dart';
import 'package:flutter/material.dart';
import '../resources/styles_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.springWood,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.springWood,
      centerTitle: true,
      foregroundColor: ColorManager.black,
      elevation: 0,
      titleTextStyle: getBoldStyle(
        color: ColorManager.black,
        fontSize: FontSize.s24,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.white,
      elevation: 0,
      selectedLabelStyle: getBoldStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s12,
      ),
      unselectedLabelStyle: getRegularStyle(
        color: ColorManager.grayishBlue,
        fontSize: FontSize.s12,
      ),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.grayishBlue,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: ColorManager.white,
      height: 60,
      padding: EdgeInsets.zero,
    ),
  );
}
