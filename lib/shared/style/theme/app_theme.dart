import 'package:flutter/material.dart';
import 'package:moviesapp/shared/style/colors/app_colores.dart';
import 'package:moviesapp/shared/style/fonts/text_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.bgColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: AppColors.bottomNavigationBarbacKGroundColor,
        type: BottomNavigationBarType.shifting,
        selectedIconTheme:
            const IconThemeData(color: AppColors.selectedIconColor),
        selectedLabelStyle: AppTextStyle.bodySmall,
        unselectedLabelStyle: AppTextStyle.bodySmall,
        unselectedItemColor: AppColors.unSelectedIconColor,
        selectedItemColor: AppColors.selectedIconColor,
        unselectedIconTheme:
            const IconThemeData(color: AppColors.unSelectedIconColor),
        elevation: 0,
      ),
      appBarTheme: const AppBarTheme(color: AppColors.bgColor, elevation: 0),
      textTheme: TextTheme(
          bodyLarge: AppTextStyle.bodyLarge,
          bodyMedium: AppTextStyle.bodyMedium,
          bodySmall: AppTextStyle.bodySmall));
  static ThemeData darkTheme = ThemeData();
}
