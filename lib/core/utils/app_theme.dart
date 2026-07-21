import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // ---------------- Light (unchanged look) ----------------
  static ThemeData get light {
    const scaffold = Color(0xFFF0F4F8);
    final scheme = const ColorScheme.light(
      primary: AppColor.primary,
      onPrimary: Colors.white,
      secondary: AppColor.primary,
      surface: Colors.white,
      onSurface: AppColor.textPrimary,
    );
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: scaffold,
      canvasColor: scaffold,
      cardColor: Colors.white,
      dividerColor: const Color(0xFFE0E0E0),
      appBarTheme: const AppBarTheme(
        backgroundColor: scaffold,
        foregroundColor: AppColor.textPrimary,
        elevation: 0,
      ),
      drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFFF0F4F8)),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),
      dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
      iconTheme: const IconThemeData(color: AppColor.textPrimary),
      textTheme: base.textTheme.apply(
        bodyColor: AppColor.textPrimary,
        displayColor: AppColor.textPrimary,
      ),
    );
  }

  // ---------------- Dark (hand-picked palette) ----------------
  static ThemeData get dark {
    final scheme = const ColorScheme.dark(
      primary: AppColor.darkPrimary,
      onPrimary: Color(0xFF04201C),
      secondary: AppColor.darkPrimary,
      surface: AppColor.darkSurface,
      onSurface: AppColor.darkTextPrimary,
    );
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColor.darkBackground,
      canvasColor: AppColor.darkBackground,
      cardColor: AppColor.darkSurface,
      dividerColor: AppColor.darkDivider,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.darkSurface,
        foregroundColor: AppColor.darkTextPrimary,
        elevation: 0,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColor.darkBackground,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColor.darkSurface,
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColor.darkSurface,
      ),
      iconTheme: const IconThemeData(color: AppColor.darkTextPrimary),
      textTheme: base.textTheme.apply(
        bodyColor: AppColor.darkTextPrimary,
        displayColor: AppColor.darkTextPrimary,
      ),
    );
  }
}
